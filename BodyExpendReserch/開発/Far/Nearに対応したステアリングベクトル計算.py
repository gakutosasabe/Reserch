import numpy as np

#ステアリングベクトルを算出
#mic_position: 3 x M dimensional ndarray [[x,y,z],[x,y,z]]
#source_position: 3 x Ns dimensional ndarray [[x,y,z],[x,y,z]]
#freqs: Nk dimensional array [f1,f2,f3 ...]
#sound_speed : 音速 [m/s]
#is_use_far: Farを使う場合はTrue,Nearの場合はFalse
#return : steering vector (Nk x Ns x M)

def calculate_steering_vecroe(mic_alignments, source_locations,freqs, sound_speed=340, is_use_far = False):
    return()

#サンプリングレート [Hz]
sample_rate = 16000

#フレームサイズ
N=1024

#周波数の数
Nk = N/2 + 1

#各ビンの周波数
freqs = np.arange(0,Nk,1)*sample_rate/N

#マイクロホンアレイのマイク配置
mic_alignments = np.array(
    [
        [-0.01, 0.0, 0.0],
        [0.01, 0.0, 0.0],
    ]
).T

#音源の方向
doas = np.array(
    [[np.pi/2.0],
    [np.pi/2,np.pi]
    ]
)

#音源とマイクロホンの距離
distance = 1

#音源の位置ベクトル
source_locations=np.zeros((3, doas.shape[0]), dtype=doas.dtype)
source_locations[0, :] = np.cos(doas[:, 1]) * np.sin(doas[:, 0])
source_locations[1, :] = np.sin(doas[:, 1]) * np.sin(doas[:, 0])
source_locations[2, :] = np.cos(doas[:, 0])
source_locations *= distance

