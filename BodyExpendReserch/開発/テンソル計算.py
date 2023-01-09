import numpy as np

#乱数の種を設定
L=10
K=5
M=3
R=3
N=3

#ランダムな複素数のテンソル(ndarray)を定義する
A=np.random.uniform(size=L*K*M*R) + np.random.uniform(size=L*K*M*R)*1.j
A=np.reshape(A,(L,K,M,R))

#K*R*N個の複素数を生成
B=np.random.uniform(size=K*R*N)+np.random.uniform(size=K*R*N)*1.j
#形をそろえる
B=np.reshape(B,(K,R,N))

#einsumを使って行列積を計算する
C=np.einsum("lkmr,krn->lkmn", A,B)

