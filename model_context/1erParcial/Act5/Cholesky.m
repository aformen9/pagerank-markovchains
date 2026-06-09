function [x,R]=Cholesky(A,b)
% Factorizacion de la matriz positiva definida A usando Cholesky.
% Si la matriz no es definida positiva, el algoritmo falla.
% Cálculo solución del sistema lineal Ax=b mediante R^tRx=b
% Datos:
%     A matriz sim\'etrica nxn
%     b vector nx1
% Resultado:
%     x solucion nx1 del sistema Ax=b por Cholesky
%     R matriz nxn triangular superior
%
% Autor: Luciano Ponzellini Marinelli (2022)


% Inicialización
[n,n] = size(A);
R = zeros(n,n);

for i =1:n
    aux=A(i,i)-sum(R(1:i-1,i).^2);
    if aux <= 0
    disp('La matriz no es positiva definida. Cholesky no es aplicable.');
    x = NaN; R=NaN;
    return
    end
    R(i,i) = sqrt(aux);
    for j=i+1:n
        R(i,j)=(A(i,j)-sum(R(1:i-1,i).*R(1:i-1,j)))/R(i,i);
    end
    
end

% Resolucion para determinar y con sustitucion progresiva (hacia adelante)
y(1) = b(1);
L=R';
for k=2:n
   y(k) = (b(k) - L(k,1:k-1)*y(1:k-1)') / L(k,k);
end

% Resolucion para determinar x con sustitucion regresiva (hacia atras)
x(n) = y(n)/R(n,n);
for k=n-1:-1:1
	x(k) = (y(k) - R(k,k+1:n)*x(k+1:n)') / R(k,k);
end

x=x';
