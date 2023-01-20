import numpy as np

#乱数の種を設定
np.random.seed(0)

#行列の大きさを設定
L=10
M=3
N=3

#ランダムな複素数のテンソルを定義する
A=np.random.uniform(size = L*M*N)
A=np.reshape(A,(L,M,N)) #行×列×奥
print(A)

#行列式を計算する
detA = np.linalg.det(A)

print("detA(0):", detA[0])

det3A = np.linalg.det(3*A)

#逆行列を計算する
A_inv = np.linalg.inv(A)

#Aとかけて単位行列になっているかどうかを検算
AA_inv = np.einsum("lmk,lkn ->lmn",A,A_inv)
print("単位行列?:\n",AA_inv[0])

A_invA=np.einsum("lmk,lkn -> lmn",A_inv,A)
print("単位行列？:\n",A_invA[0])

#一般化逆行列計算
A_inv=np.linalg.pinv(A)

#Aとかけて単位行列になっているかどうかを検算
AA_inv = np.einsum("lmk,lkn ->lmn",A,A_inv)
print("単位行列?:\n",AA_inv[0])

A_invA=np.einsum("lmk,lkn -> lmn",A_inv,A)
print("単位行列？:\n",A_invA[0])


