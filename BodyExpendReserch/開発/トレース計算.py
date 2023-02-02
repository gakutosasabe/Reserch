import numpy as np

#乱数の種を設定
np.random.seed(0)

L=10
M=3
N=3

#ランダムな複素数のテンソルを定義(A)
A = np.random.uniform(size = L*M*N) + np.random.uniform(size = L*M*N)*1.j
A = np.reshape(A,(L,M,N))

#ランダムな複素数のテンソルを定義(B)
b = np.random.uniform(size = L*M*N) + np.random.uniform(size = L*M*N)*1.j
b = np.reshape(b,(L,M,N))

#行列Aのtrace
print("tr(A)= \n",np.trace(A,axis1=-2, axis2=-1))

#einsumを用いたtrace計算
print("tr(A)= \n", np.einsum("lmm->l", A))


