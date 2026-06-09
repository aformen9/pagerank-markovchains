function x = Regresiva(A, b)
% Resolucion de sistema triangular superior mediante sustitucion regresiva
% Datos:
%     A - matriz cuadrada triangular superior nxn
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

%% Verificacion de que A es triangular superior
% Una matriz es triangular superior si todos los elementos
% debajo de la diagonal principal son cero

for i = 2:n
    for j = 1:i-1
        if abs(A(i,j)) > 1e-10
            disp('Advertencia: A no es triangular superior');
            break
        end
    end
end

%% Sustitucion regresiva (backward substitution)
% Resolvemos desde la ultima ecuacion hacia la primera
% Empezamos con x(n) y vamos hacia x(1)

% Ultima ecuacion: A(n,n)*x(n) = b(n)
x(n) = b(n) / A(n,n);

% Ecuaciones restantes: resolvemos hacia atras
for k = n-1:-1:1
    % A(k,k)*x(k) + A(k,k+1)*x(k+1) + ... + A(k,n)*x(n) = b(k)
    % Despejamos x(k):
    % x(k) = (b(k) - A(k,k+1)*x(k+1) - ... - A(k,n)*x(n)) / A(k,k)
    x(k) = (b(k) - A(k,k+1:n)*x(k+1:n)') / A(k,k);
end

% Convertimos x en vector columna
x = x';
