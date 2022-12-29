import wave as wave
import numpy as np
import scipy.signal as sp
import matplotlib.pyplot as plt
import sounddevice as sd
#サンプルファイル読み込み
sample_wave_file = "./CMU_ARCTIC/cmu_us_aew_arctic/wav/arctic_a0001.wav"

#ファイル読み込み
wav = wave.open(sample_wave_file)

#PCM形式の波形データ読み込み
data = wav.readframes(wav.getnframes())

#dataを2バイトの数値列に変換
data = np.frombuffer(data, dtype=np.int16)

speech_signal = data

n_speech = wav.getframes()

#音声データに白色雑音を乗せる

#白色雑音のサンプル数を設定
n_noise_only = 40000

#全体の長さ
n_sample = n_speech + n_noise_only

#白色雑音の生成
wgn_signal = np.random.normal(scale = 0.04, size = n_sample)

#2培地のデータとして書き込むためにスケールを調整
wgn_signal = wgn_signal * np.iinfo(np.int16).max

#2バイトのデータに変換
wgn_signal = wgn_signal.astype(np.int16)

#白色雑音を混ぜる
mix_signal = wgn_signal
mix_signal[n_noise_only:]+= speech_signal

#再生する
sd.play(mix_signal,wav.getframerate())

print("再生開始")

status = sd.wait()
#wavファイルに書き込む
#wave_out = wave.open("./istft_post_wave.wav", "w")
#wave_out.setnchannels(1)
#wave_out.setsampwidth(2)
#wave_out.setframerate(wav.getframerate())
#wave_out.writeframes(data_post)
#wave_out.close()

wav.close()