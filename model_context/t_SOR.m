clear, clc
A = [ 4 -1 1; 4 -8 1; -2 1 5 ];
b = [ 7 -21 15 ]';
x0 = [ 1 2 2]';
tol = 1e-4;
itmax = 30;
omega = 1.05;
[xSOR,iterSOR,resrelSOR] = SOR(A,b,x0,omega,tol,itmax)
