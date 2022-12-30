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

n_speech = wav.getnframes()

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

#短時間フーリエ変換を行う
f,t,stft_data = sp.stft(mix_signal, fs=wav.getframerate(),window="hann", nperseg =512, noverlap=256)

#入力信号の振幅を取得
amp = np.abs(stft_data)

#入力信号の位相を取得
phase = stft_data/np.maximum(amp,1.e-20)

#雑音だけの区間のフレーム数
n_noise_only_frame = np.sum(t<(n_noise_only/wav.getframerate()))

#スペクトルサブトラクションのパラメータ
p = 1.0
alpha = 5.0

#雑音の振幅を推定
noise_amp = np.power(np.mean(np.power(amp,p)[:,:n_noise_only_frame], axis = 1, keepdims = True),1./p)

#入力信号の振幅の１％を下回らないようにする
eps = 0.01 * np.power(amp,p)

#出力信号の振幅を計算する
processed_amp = np.power(np.maximum(np.power(amp,p)-alpha*np.power(noise_amp,p),eps), 1./p)

#出力信号の振幅に入力信号の位相を掛ける
processed_stft_data = processed_amp * phase

#時間領域の波形に戻す
t, processed_data_post = sp.istft(processed_stft_data,fs = wav.getframerate(), window = "hann", nperseg = 512, noverlap = 256)
#wavファイルに書き込む
#wave_out = wave.open("./istft_post_wave.wav", "w")
#wave_out.setnchannels(1)
#wave_out.setsampwidth(2)
#wave_out.setframerate(wav.getframerate())
#wave_out.writeframes(data_post)
#wave_out.close()

#2バイトのデータに変換
processed_data_post = processed_data_post.astype(np.int16)


#再生する
sd.play(processed_data_post,wav.getframerate())

print("スペクトルサブトラクション処理後音声再生開始")

status = sd.wait()

#スペクトログラムをプロットする
fig=plt.figure(figsize=(10,4))

#スペクトログラムを表示する
spectrum,  freqs, t, im=plt.specgram(processed_data_post,NFFT=512,noverlap=512//16*15,Fs=wav.getframerate(),cmap="gray")

#カラーバーを表示する
fig.colorbar(im).set_label('Intensity [dB]')

#x軸のラベル
plt.xlabel("Time [sec]")

#y軸のラベル
plt.ylabel("Frequency [Hz]")

#音声ファイルを画像として保存
plt.savefig("./spectrogram_ss_result.png")

#画像を画面に表示
plt.show()

wav.close()

