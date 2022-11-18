from pydub import AudioSegment
from pydub.playback import play


# ホワイトノイズ音声ファイルの読み込み(場所を既定する必要)
# sound = AudioSegment.from_file("c:\\Users\\GakutoSasabe\\Documents\\Reserch\\BodyExpendReserch\\software\\whitenoise.mp3","mp3")
sound = AudioSegment.from_file("whitenoise.mp3","mp3")
# ホワイトノイズ音声の再生

# 音量を調整する
process_audio = sound -10
play(process_audio)