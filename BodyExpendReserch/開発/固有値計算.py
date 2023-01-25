import numpy as np

np.random.seed(0)

L=10
M=3
N=3

A=np.random.uniform(size=L*M*N)+np.random.uniform(size=L*M*N)*1.j
A=np.reshape(A,(L,M,N))

#正定エルミート行列を作る
B=np.einsum("lmk,lnk->lmn", A, np.conjugate(A))

#Aの固有値分解実施
w,v=np.linalg.eig(A)

#固有値と固有ベクトルからAを復元できるか検証
A_reconst=np.einsum("lmk,lk,lkn -> lmn",v,w,np.linalg.inv(v))
print("A[0]: \n", A[0])
print("A_reconst[0]: \n",A_reconst[0])