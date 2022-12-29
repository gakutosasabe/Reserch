import wave as wave
import numpy as np
import scipy.signal as sp
import matplotlib.pyplot as plt

#サンプルファイル読み込み
sample_wave_file = "./CMU_ARCTIC/cmu_us_aew_arctic/wav/arctic_a0001.wav"

#ファイル読み込み
wav = wave.open(sample_wave_file)

#PCM形式の波形データ読み込み
data = wav.readframes(wav.getnframes())

#dataを2バイトの数値列に変換
data = np.frombuffer(data, dtype=np.int16)

#短時間フーリエ変換を行う
f,t,stft_data = sp.stft(data, fs=wav.getframerate(),window="hann",nperseg= 512, noverlap= 256)

#短時間フーリエ変換後のデータ形式を確認
#print("短時間フーリエ変換後のshape",np.shape(stft_data))

#print("周波数軸[Hz]:", f)
#print("時間軸[sec]", t)

#特定の周波数を消す
stft_data[:50,:]=0

#時間領域の波形に戻す
t, data_post = sp.istft(stft_data, fs = wav.getframerate(), window="hann", nperseg=512, noverlap= 256)

#2バイトのデータに変換
data_post = data_post.astype(np.int16)

#wavファイルに書き込む
wave_out = wave.open("./istft_post_wave.wav", "w")
wave_out.setnchannels(1)
wave_out.setsampwidth(2)
wave_out.setframerate(wav.getframerate())
wave_out.writeframes(data_post)
wave_out.close()
wav.close()