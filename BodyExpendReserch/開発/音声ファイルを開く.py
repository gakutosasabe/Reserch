#! python3.9
import wave as wave
import pyroomacoustics as pa
import numpy as np
import matplotlib.pyplot as plt

pa.datasets.CMUArcticCorpus(basedir="./CMU_ARCTIC",download=True, speaker=["aew","axb"])

sample_wave_file="./CMU_ARCTIC/cmu_us_aew_arctic/wav/arctic_a0001.wav"

wav=wave.open(sample_wave_file)

#ファイルの情報を出力する
print("サンプリング周波数[Hz]:",wav.getframerate())
print("サンプルサイズ[Byte]", wav.getsampwidth())
print("サンプル数:",wav.getnframes())
print("チャンネル数:",wav.getnchannels())

#PCM形式の波形データを読み込み
data = wav.readframes(wav.getnframes())
#dataを２バイトの数値列に変換
data = np.frombuffer(data, dtype=np.int16)

wav.close

#2バイトの変数が取りえる値の最大値で正規化
data = data/np.iinfo(np.int16).max

x = np.array(range(wav.getnframes()))/wav.getframerate()

plt.figure(figsize = (10,4))

plt.xlabel("Time[sec]")

plt.ylabel("Value [-1,1]")

plt.plot(x,data)
plt.savefig("./wave_form.png")
plt.show()