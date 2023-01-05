import numpy as np

#行列を定義
A = np.matrix([[3., 1., 2.],[2., 3., 1.]])

#行列を定義
#ピリオドは浮動小数点であるという意味
A=np.matrix([[3., 1., 2.],[2., 3., 1.]])

#Aを表示
print("A=",A)

#行列の大きさを表示
print("行列Aの大きさ(M行,N列）：", np.shape(A))

#行列にスカラーcをかける
c=2.
print("cA = \n",c*A)

#行列Aに行列Bを足す
B=np.matrix([[-1.,2.,4.],[1.,8.,6.]])
print("B=",B)
print("A+B= \n",A+B)

#行列Aに行列Bをかける
B=np.matrix([[4.,2.],[-1,3.],[1.,5.]])
print("AB= \n", np.matmul(A,B))
print("AB= \n",np.einsum("mk,kn->mn",A,B))

#行列Aと行列Bのアダマール積
B=np.matrix([[-1.,2.,4.],[1.,8.,6.]])
print("A*B= \n", np.multiply(A,B))

#行列Aの転置
print("A^T= \n",A.T)
print("A^T= \n",np.transpose(A,axes=(1,0)))
print("A^T= \n",np.swapaxes(A,1,0))