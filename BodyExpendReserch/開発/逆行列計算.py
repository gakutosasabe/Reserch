import numpy as np

#乱数の種を設定
np.random.seed(0)

#行列の大きさを設定
L=1
M=2
N=2

#ランダムな複素数のテンソルを定義する
A=np.random.uniform(size = L*M*N) + np.random.uniform(size = L*M*N)* 1.j
print(A)