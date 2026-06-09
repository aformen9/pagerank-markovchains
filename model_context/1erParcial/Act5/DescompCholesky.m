function R = DescompCholesky(A)
% Factorizacion de Cholesky de una matriz simetrica definida positiva
% Solo devuelve la matriz R triangular superior, NO resuelve sistemas
% Datos:
%     A - matriz simetrica y definida positiva nxn
% Resultado:
%     R - matriz triangular superior tal que A = R^T * R
%
% Autor: Agustin Formenti (2025)
% Basado en Cholesky.m de Luciano Ponzellini Marinelli (2022)

%% Inicializacion
[n, m] = size(A);

if n ~= m
    disp('Error: A debe ser una matriz cuadrada');
    R = NaN;
    return
end

% Verificar que A es simetrica
if ~isequal(A, A')
    disp('Advertencia: A no es simetrica');
end

%% Algoritmo de factorizacion de Cholesky
% Calcula R tal que A = R^T * R

R = zeros(n, n);

for i = 1:n
    % Calculo del elemento diagonal R(i,i)
    aux = A(i,i) - sum(R(1:i-1, i).^2);

    if aux <= 0
        disp('Error: La matriz no es definida positiva. Cholesky no es aplicable.');
        R = NaN;
        return
    end

    R(i,i) = sqrt(aux);

    % Calculo de los elementos fuera de la diagonal R(i,j) para j > i
    for j = i+1:n
        R(i,j) = (A(i,j) - sum(R(1:i-1, i) .* R(1:i-1, j))) / R(i,i);
    end
end
