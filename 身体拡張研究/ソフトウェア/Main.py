# coding: UTF-8
import speech_recognition as sr
import pyaudio
import time
from pycaw.pycaw import AudioUtilities, ISimpleAudioVolume
import numpy as np
from scipy.stats import norm
import threading
import librosa
import pyworld

censor_words = ["被験者","被験者さん"] #検閲ワード1
censor_words2 = ["協力者","協力者さん"] #検閲ワード2

formant_conversion = False #フォルマント変換による音声加工
def convert(signal):
    f0_rate = 2.4
    sp_rate = 0.78
    sample_rate = 16000

    f0, t = pyworld.dio(signal, sample_rate)
    f0 = pyworld.stonemask(signal, f0, t, sample_rate)
    sp = pyworld.cheaptrick(signal, f0, t, sample_rate)
    ap = pyworld.d4c(signal, f0, t, sample_rate)

    modified_f0 = f0_rate * f0

    # フォルマントシフト（周波数軸の一様な伸縮）
    modified_sp = np.zeros_like(sp)
    sp_range = int(modified_sp.shape[1] * sp_rate)
    for f in range(modified_sp.shape[1]):
        if (f < sp_range):
            if sp_rate >= 1.0:
                modified_sp[:, f] = sp[:, int(f / sp_rate)]
            else:
                modified_sp[:, f] = sp[:, int(sp_rate * f)]
        else:
            modified_sp[:, f] = sp[:, f]

    y = pyworld.synthesize(modified_f0, modified_sp, ap, sample_rate)

    return y

class WorkerThread(threading.Thread):
    def __init__(self, block_length, margin_length):
        super(WorkerThread, self).__init__()
        self.is_stop = False
        self.lock = threading.Lock()
        self.buffer = []
        self.result = []

        self.prev_samples = []
        
    def stop(self):
        self.is_stop = True
        self.join()

    def run(self):
        while not self.is_stop:
            if len(self.buffer) > 0:
                with self.lock:
                    buf = self.buffer[0]
                    self.buffer = self.buffer[1:]
               
                chunk_size = len(buf[0]['data'])
                sample = np.concatenate([b['data'] for b in buf])

                # pitch sift
                sample = sample.astype(np.float64)
                sample = convert(sample)

                # overlap
                self.prev_samples.append(sample)

                length = len(sample)
                weight = norm.pdf(np.arange(0, length), length/2, length/8)

                caches = []
                wcaches = []
                for i, sample in enumerate(self.prev_samples):
                    pos = (len(self.prev_samples) - i) * chunk_size
                    if len(sample) >= pos + chunk_size:
                        cache = sample[pos:pos+chunk_size]
                        wcache = weight[pos:pos+chunk_size]
                        caches.append(cache)
                        wcaches.append(wcache)

                caches = np.asarray(caches)
                wcaches = np.asarray(wcaches)
                wcaches /= wcaches.sum(axis=0)
                sample = np.sum(wcaches * caches, axis=0)

                if len(self.prev_samples) >= 16:
                    self.prev_samples = self.prev_samples[1:]
            
                with self.lock:
                    self.result.extend(sample.tolist())
            else:
                time.sleep(0.01)

    def push_chunk(self, chunk):
        with self.lock:
            self.buffer.append(chunk)
    
    def pop_chunk(self, chunk_size):
        result = None
        with self.lock:
            if len(self.result) >= chunk_size:
                result = np.array(self.result[:chunk_size])
                self.result = self.result[chunk_size:]

        return result

class AudioFilter():
    def __init__(self, worker, block_length, margin_length):
        self.p = pyaudio.PyAudio()

        self.channels = 1 #マイクがモノラルの場合は1    #現在1じゃないと動かない
        self.rate = 16000 #DVDレベルなので重かったら16000    #現在16000じゃないと動かない

        input_index, output_index = self.get_channels(self.p)
        self.format = pyaudio.paInt16
        self.stream = self.p.open(
            format = self.format,
            channels = self.channels,
            rate = self.rate,
            frames_per_buffer=1024,
            input_device_index = input_index,
            output_device_index = output_index,
            output = True,
            input = True,
            stream_callback=self.callback)#音声が流れてきた時に叩くCallBack関数を指定する

        # Status:0が待ち
        self.age = 0
        self.index = 0
        self.chunk = []
        self.buffer = []
        self.worker = worker

        self.block_length = block_length
        self.margin_length = margin_length

    def get_channels(self, p):
        input_index = self.p.get_default_input_device_info()['index']
        output_index = self.p.get_default_output_device_info()['index']
        #output_index = p.get_default_output_device_info()['index']
        for idx in range(self.p.get_device_count()):
            info = self.p.get_device_info_by_index(idx)
            if 'BlackHole' in info['name']:
                output_index = info['index']
        return input_index, output_index

#  format  : ストリームを読み書きするときのデータ型
#  channels: ステレオかモノラルかの選択 1でモノラル 2でステレオ
#  rate    : サンプル周波数
#  output  : 出力モード
    
    # コールバック関数（再生が必要なときに呼び出される）
    def callback(self, in_data, frame_count, time_info, status):
        if formant_conversion == True:
            decoded_data = np.frombuffer(in_data, np.int16).copy()
            chunk_size = len(decoded_data)

            decoded_data = decoded_data.reshape(-1, 1024)
            for c in decoded_data:
                self.chunk.append({'data': c, 'index': self.index})
                self.index += 1
            
            #if decoded_data.max() > 1000:
            if decoded_data.max() > 0:
                self.age = self.block_length
            else:
                self.age = max(0, self.age - 1)

            if self.age == 0:
                self.chunk = self.chunk[-self.margin_length:]
            else:
                while len(self.chunk) >= self.block_length:
                    # push self.chunk[0:16]
                    self.worker.push_chunk(self.chunk[0:self.block_length])

                    # remove self.chunk[0:8]
                    self.chunk = self.chunk[1:]
            
            ## Pop chunk to current list
            ret = self.worker.pop_chunk(chunk_size)
            
            # Get head from current list
            
            if ret is not None:
                data = ret.astype(np.int16)
                #print(len(data), data.dtype, data.max())
            else:
                data = np.zeros(chunk_size, dtype=np.int16)
            
            out_data = data.tobytes()
        else :
            out_data = in_data
        
        return (out_data, pyaudio.paContinue)
    
    # 音声取り込みをやめるとき
    def close(self):
        self.p.terminate() 
    
    def mute_audio(self): #スピーカーへの音量を小さくする
        return

class AudioCensorship(): #音声検閲クラス
    def character_search(self, source_words, censor_words): # 文字起こしした文字から検閲ワードを見つける
        word_detect = False # 検閲ワード検出フラグ
        for item in censor_words:
            cw_locate = source_words.find(item)
            if cw_locate != -1:
                print("検閲ワード:" + item + " を発見しました")
                word_detect = True
        return word_detect

class AudioController(object): #スピーカーのボリューム調整クラス
    def __init__(self):
        self.process_name = "python.exe"
        self.defaultvolume = 0.0 #初期ボリューム
        self.enhancedvolume = 1.0 #耳拡張時のボリューム
        self.set_defaultvolume = self.set_volume(self.defaultvolume) #インスタンス生成時にデフォルトのボリュームをセット

    def mute(self): #アプリをミュートにする
        sessions = AudioUtilities.GetAllSessions()
        for session in sessions:
            interface = session.SimpleAudioVolume
            if session.Process and session.Process.name() == self.process_name:
                interface.SetMute(1, None)
                print(self.process_name, 'has been muted.')
    
    def unmute(self): #アプリをアンミュートする
        sessions = AudioUtilities.GetAllSessions()
        for session in sessions:
            interface = session.SimpleAudioVolume
            if session.Process and session.Process.name() == self.process_name:
                interface.SetMute(0, None)
                print(self.process_name, 'has been unmuted.')

    def set_volume(self, decibels): #アプリのボリュームを変える
        sessions = AudioUtilities.GetAllSessions()
        for session in sessions:
            interface = session.SimpleAudioVolume
            if session.Process and session.Process.name() == self.process_name:
                # only set volume in the range 0.0 to 1.0
                self.volume = min(1.0, max(0.0, decibels))
                interface.SetMasterVolume(self.volume, None)
                print('Volume set to', self.volume)  # debug
    
    def set_enhanced_volume(self): #self.enhancedvolumeにボリュームを変える
        sessions = AudioUtilities.GetAllSessions()
        for session in sessions:
            interface = session.SimpleAudioVolume
            if session.Process and session.Process.name() == self.process_name:
                # only set volume in the range 0.0 to 1.0
                self.volume = min(1.0, max(0.0, self.enhancedvolume))
                interface.SetMasterVolume(self.volume, None)
                print('Volume set to', self.volume)  # debug
    
    def process_volume(self): #現在のボリュームを取得する
        sessions = AudioUtilities.GetAllSessions()
        for session in sessions:
            interface = session.SimpleAudioVolume
            if session.Process and session.Process.name() == self.process_name:
                print('Volume:', interface.GetMasterVolume())  # debug
                return interface.GetMasterVolume()


class Timer(): #タイマークラス
    def __init__(self):
        self.timer = time.time()
    
    def is_time_out(self, settime): 
        if time.time() - self.timer > settime:
            return True
        else:
            return False

class KeyInput(): #キー入力クラス
    
    def __init__(self):
        self.start = key_input(self)
    
    def key_input(self,censor_words): #
        while True:
            input = input("検閲ワードを入力してください : ")
            censor_words.append(input)
            
            right_input = False
            cont_input = False
            while right_input == False : 
                input_y = ("更に閲覧ワードの入力を続けますか？(y/n) : ").lower() # inputを小文字に変換
                if input_y == "y" :
                    right_input = True
                    cont_input = True
                elif input_y == "n" :
                    right_input = False
                    cont_input = False
                else :
                    print("y か n を入力してください")
                    right_input = False
            if cont_input == True :
                pass
            else :
                break
        return




if __name__ == "__main__": #importされた場合に実行しないようにするらしい

    #AudioCensorshipのインスタンスを作る
    ace = AudioCensorship()
    #AudioControllerのインスタンスを作る
    aco = AudioController()

    
    block_length = 8
    margin_length = 1

    worker_th = WorkerThread(block_length, margin_length)
    worker_th.setDaemon(True)
    worker_th.start()
    #AudioFileterのインスタンスを作る
    af = AudioFilter(worker_th, block_length, margin_length)
    
    #ストリーミングを始める
    af.stream.start_stream()

    # ボリュームをゼロにする
    aco.set_volume(0.0)

    # ノンブロッキングなのでこの中で音声認識・音の変換などを行う
    while af.stream.is_active():
        #print("なんの処理をしてもOK")
        r = sr.Recognizer()
        with sr.Microphone() as source: # pyaudioを使ってマイクを認識？
            r.adjust_for_ambient_noise(source)
            print("音声を読み取っています")
            audio = r.listen(source)
            try:
                query = r.recognize_google(audio, language='ja-JP')
                print(query)
                words_detect1 = ace.character_search(query, censor_words)
                words_detect2 = ace.character_search(query, censor_words2)
                if words_detect1 == True:
                    aco.set_volume(1.0)
                    # mute_timer = Timer()
                if words_detect2 == True:
                    aco.set_volume(0.0)
            except:
                print("エラー")
            
            #volume_now = aco.process_volume()
            #if round(volume_now, 2) == aco.enhancedvolume: # 現在のボリュームが耳拡張ボリュームだった場合にデフォルトボリュームに戻す
            #    if mute_timer.is_time_out(5) :
            #        aco.set_volume(aco.defaultvolume)

    # ストリーミングを止める

    worker_th.stop()
    af.stream.stop_stream()
    af.stream.close()
    af.close()






