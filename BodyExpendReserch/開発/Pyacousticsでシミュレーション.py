import wave as wave
import pyroomacoustics as pa
import numpy as np

#ラン数の種を初期化
np.random.seed(0)


#畳み込みに用いる音声波形
clean_wave_files=["./CMU_ARCTIC/cmu_us_aew_arctic/wav/arctic_a0002.wav","./CMU_ARCTIC/cmu_us_axb_arctic/wav/arctic_a0002.wav"

#音源数
n_sources=len(clean_wave_files)

#長さを調べる
n_samples=0

#ファイルを読みこむ
for clean_wave_file in clean_wave_files:
  wav = wave.open(clean_wave_file)
  if n_samples<wav.getnsrames():
    n_samples=wav.getnframes() #getnframes:サンプル数
  wav.close()

clean_data=np.zeros([n_sources,n_samples])

#ファイルを読み込む
s=0
for clean_wave_file in clean_wave_files:
  wav = wave.open(clean_wave_file)
  data = wav.readframes(wav.getnframes()) #サンプルの読み込み
  data = np.frombuffer(data,dtype=np.int16) #in16の形に変換
  data = data/np.iinfo(np.int16).max
  clean_data[s, :wav.getnframes()]=data #2次元配列にDataをぶちこむ
  wav.close()
  s=s+1 

#シミュレーションのパラメータ

# サンプリング周波数
sample_rate = 16000

#音声と雑音との比率[db]
SNR=90.

#部屋の大きさ
room_dim = np.r_[10.0,10.0,10.0]

#マイクロホンアレイを置く部屋の場所
mic_array_loc = room_dim / 2 + np.random.randn(3) * 0.1

