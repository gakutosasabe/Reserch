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

#マイクロホンアレイのマイク配置
mic_alignments = np.array(
    [
        [-0.01, 0.0, 0.0],
        [0.01, 0.0, 0.0],
    ]
)

#マイクロホン数
n_channels = np.shape(mic_alighments)[0] #今回は2

#マイクロホンアレイの座標系
R=mic_alignments .T +mic_array_loc[:,None]

#部屋を生成する
room = pa.ShoeBox(room_dim, fs=sample_rate, max_order=0)

#用いるマイクロホンアレイの情報を設定する
room.add_microphone_array(pa.MicrophoneArray(R, fs=room.fs))

#音源の場所
doas= np.array(
    [[np.pi/2., 0],
     [np.pi/2.,np.pi/2.]
     ]
)

#音源とマイクロホンの距離
distance = 1.
source_locations = np.zeros((3, doas.shape[0]),dtype=doas.dtype)
source_locations[0, :] = np.cos(doas[:,1]) * np.sin(doas[:, 0])
source_locations[1, :] = np.sin(doas[:,1]) * np.sin(doas[:, 0])
source_locations[2, :] = np.cos(doas[:,0]) 
source_locations *= distance
source_locations += mic_array_loc[:,None]

