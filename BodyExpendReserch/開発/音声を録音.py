#! python3.9

#sounddeviceモジュールをimport
import sounddevice as sd
import wave as wave
import numpy as np

#録音するデータの長さ
wave_length = 5

#サンプリング周波数
sample_rate = 16000

print("録音開始")

#録音開始
data = sd.rec(int(wave_length * sample_rate), sample_rate, channels = 1)

#録音終了まで待つ
sd.wait()

#2バイトのデータとして書き込むためにスケールを調整
data_scale_adjust = data * np.iinfo(np.int16).max

#2バイトのデータに変換
data_scale_adjust = data_scale_adjust.astype(np.int16)

wave_out = wave.open("./record.wav", 'w')
wave_out.setnchannels(1)
wave_out.setsampwidth(2)
wave_out.setframerate(sample_rate)
wave_out.writeframes(data_scale_adjust)
wave_out.close()