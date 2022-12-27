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
#f,t,stft_data = sp.stft(data, fs=wav.getframerate(),window="hann",nperseg= 512, noverlap= 256)

#短時間フーリエ変換後のデータ形式を確認
#print("短時間フーリエ変換後のshape",np.shape(stft_data))

#print("周波数軸[Hz]:", f)
#print("時間軸[sec]", t)

fig = plt.figure(figsize=(10,4))

#スペクトログラムを表示する
spectrum,  freqs, t, im=plt.specgram(data,NFFT=512,noverlap=512//16*15,Fs=wav.getframerate(),cmap="gray")


fig.colorbar(im).set_label('Intensity[db]')

plt.xlabel("Time[sec]")

plt.ylabel("Frequency[Hz]")

plt.savefig("./spectrogram.png")

plt.show()

wav.close()

