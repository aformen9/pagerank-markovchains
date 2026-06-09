function [x,iter,resrel] = SOR(A,b,x0,omega,tol,itmax)
% Metodo iterativo de Sobrerelajacion sucesiva (SOR)
% Input :
% A     : matriz invertible nxn 
% b     : lado derecho nx1
% x0    : estimación inicial nx1
% omega : parametro de relajacion
% tol   : tolerancia
% itmax : número máximo de iteraciones
% Output:
% x     : vector nx1 aproximación solución SEL Ax=b
% iter  : numero de iteraciones realizadas
% resrel: residuo relativo a norm(b)
%
% Autor: Luciano Ponzellini Marinelli (2025)

[m,n] = size(A);
if m~=n
	disp('La matriz A  no es cuadrada.')  
return;
end

k = 1;
x = x0;
for k = 1:itmax
	x(1) = omega*(1/A(1,1))*(b(1) - A(1,2:n)*x(2:n)) + (1-omega)*x(1);
	for i = 2:n-1
		x(i) = omega*(1/A(i,i))*(b(i) - ... 
				 A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n)) + (1-omega)*x(i);
	end
	x(n) = omega*(1/A(n,n))*(b(n) - A(n,1:n-1)*x(1:n-1)) + (1-omega)*x(n);
   
    resrel = normap(b-A*x,2)/normap(b,2); %residuo residual relat por iter
    %resrel = normap(x-x0,2); %mismo criterio de parada que Jacobi y G-S
   
	if resrel < tol
		iter = k;
		return;
    end
    x0 = x;
end

iter = -1; % Si el metodo de SOR no converge, iter = -1.

end
