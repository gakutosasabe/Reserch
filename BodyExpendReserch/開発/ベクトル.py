import numpy as np

#行列を定義
A=np.matrix([[3.,1.,2.],[2.,3.,1.]])

#ベクトルを定義
b=np.array([2.,1.,4.])

#行列を表示
print("A=\n",A)

#ベクトルを表示
print("B=",b)

#行列Aにベクトルｂを掛ける
print("Ab= \n",np.dot(A,b))