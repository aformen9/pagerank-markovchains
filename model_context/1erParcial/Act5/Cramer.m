function x = Cramer(A,b)
% Cálculo solución del sistema lineal Ax=b mediante eliminación Gaussiana
% Datos:
%     A matriz invertible nxn
%     b vector nx1
% Resultado:
%     x solucion nx1 del sistema Ax=b por la regla de Cramer
%
% Autor: Luciano Ponzellini Marinelli (2022)

% Inicialización
[n,n] = size(A);

% Cálculo del determinante de A 
d = det(A);
B = A;

if d==0
    disp('La matriz no es inversible. Cramer no es aplicable.');
    x = NaN;
else
    x=zeros(n,1);
    for j=1:n
        A(:,j) = b;
        x(j) = det(A)/d;
        A = B;
    end
end
