A = [ 4 -1 1; 4 -8 1; -2 1 5 ];
b = [ 7 -21 15 ]';
x0 = [ 1 2 2]';
tol = 1e-4;
itmax = 30;
x = GaussSeidel(A,b,x0,tol,itmax)
