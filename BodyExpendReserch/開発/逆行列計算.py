import numpy as np

#乱数の種を設定
np.random.seed(0)

#行列の大きさを設定
L=2
M=3
N=2

#ランダムな複素数のテンソルを定義する
A=np.random.uniform(size = L*M*N)
A=np.reshape(A,(L,M,N)) #行×列×奥
print(A)