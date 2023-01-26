import wave as wave
import pyroomacoustics as pa
import numpy as np
import scipy.signal as signal

#乱数の種を初期化
np.random.seed(0)

#畳み込みに用いる音声波形
clean_wave_file="./CMU_ARCTIC/cmu_us_aew_arctic/wav/arctic_a0001.wav"

wav = wave.open(clean_wave_file)
data = wav.readframes(wav.getnframes())
data = np.frombuffer(data, dtype=np.int16)
data = data / np.iinfo(np.int16).max
wav.close()

#サンプリング周波数
sample_rate = 16000

#畳みこむインパルス応答長
n_impulse_length = 512

#インパルス応答を乱数で作成
impulse_response = np.random.normal(size=n_impulse_length)

conv_data = signal.convolve(data, impulse_response,mode = 'full')