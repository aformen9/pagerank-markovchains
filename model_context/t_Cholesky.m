clear,clc

A=[1 1 4 -1; 1 5 0 -1; 4 0 21 -4; -1 -1 -4 10]
b=[11 7 51 25]'

[xC,RC]=Cholesky(A,b)

A==RC'*RC   %verifico si A=R'*R
r = b-A*xC  %calculo el vector residual
