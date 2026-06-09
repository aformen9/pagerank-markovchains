function x = Progresiva(A, b)
% Resolucion de sistema triangular inferior mediante sustitucion progresiva
% Datos:
%     A - matriz cuadrada triangular inferior nxn
%     b - vector lado derecho nx1
% Resultado:
%     x - solucion nx1 del sistema Ax=b
%
% Autor: Agustin Formenti (2025)

%% Verificacion de dimensiones
[n, m] = size(A);

if n ~= m
    disp('Error: A debe ser una matriz cuadrada');
    x = NaN;
    return
end

if length(b) ~= n
    disp('Error: b debe tener la misma dimension que A');
    x = NaN;
    return
end

%% Verificacion de que A es triangular inferior
% Una matriz es triangular inferior si todos los elementos
% encima de la diagonal principal son cero

for i = 1:n-1
    for j = i+1:n
        if abs(A(i,j)) > 1e-10
            disp('Advertencia: A no es triangular inferior');
            break
        end
    end
end

%% Sustitucion progresiva (forward substitution)
% Resolvemos desde la primera ecuacion hacia la ultima
% Empezamos con x(1) y vamos hacia x(n)

% Primera ecuacion: A(1,1)*x(1) = b(1)
x(1) = b(1) / A(1,1);

% Ecuaciones restantes: resolvemos hacia adelante
for k = 2:n
    % A(k,1)*x(1) + A(k,2)*x(2) + ... + A(k,k)*x(k) = b(k)
    % Despejamos x(k):
    % x(k) = (b(k) - A(k,1)*x(1) - ... - A(k,k-1)*x(k-1)) / A(k,k)
    x(k) = (b(k) - A(k,1:k-1)*x(1:k-1)') / A(k,k);
end

% Convertimos x en vector columna
x = x';
