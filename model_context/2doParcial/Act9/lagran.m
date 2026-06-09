function y = lagran(x, xd, yd)
% LAGRAN - Interpolación polinomial mediante el método de Lagrange
%
% Sintaxis: y = lagran(x, xd, yd)
%
% Entradas:
%   x  - Punto(s) donde se desea evaluar el polinomio interpolante (puede ser escalar o vector)
%   xd - Vector de nodos (puntos conocidos en x)
%   yd - Vector de valores de la función en los nodos (f(xd) = yd)
%
% Salida:
%   y  - Valor(es) del polinomio interpolante evaluado en x
%
% Descripción:
%   Esta función calcula el polinomio interpolante de Lagrange que pasa por los puntos (xd, yd)
%   y lo evalúa en el/los punto(s) x.
%
%   Fórmula de Lagrange: P_n(x) = sum_{k=0}^{n} L_{n,k}(x) * y_k
%
%   donde L_{n,k}(x) son los polinomios base de Lagrange:
%   L_{n,k}(x) = prod_{j=0, j≠k}^{n} (x - x_j) / (x_k - x_j)
%
% Ejemplo de uso:
%   xd = [0, 1, 2];
%   yd = [1, 3, 2];
%   x = 0.5;
%   y = lagran(x, xd, yd)
%
% Autor: Agustín Formenti
% Fecha: Noviembre 2025
% Materia: Métodos y Cómputos Numéricos - UCA Rosario

%% Verificación de las dimensiones de entrada
% xd e yd deben tener la misma longitud
if length(xd) ~= length(yd)
    error('Los vectores xd e yd deben tener la misma longitud');
end

%% Inicialización
n = length(xd);      % Número de nodos (puntos conocidos)
y = zeros(size(x));  % Inicializo el vector de salida con el mismo tamaño que x

%% Cálculo del polinomio interpolante de Lagrange
% Recorro cada punto donde quiero evaluar el polinomio
for i = 1:length(x)

    % Para cada punto x(i), calculo P_n(x(i)) usando la fórmula de Lagrange
    % P_n(x) = sum_{k=0}^{n} L_{n,k}(x) * y_k

    suma = 0;  % Inicializo la suma

    % Recorro cada término de la sumatoria (cada nodo k)
    for k = 1:n

        %% Cálculo del polinomio base L_{n,k}(x)
        % L_{n,k}(x) = prod_{j=0, j≠k}^{n} (x - x_j) / (x_k - x_j)

        L = 1;  % Inicializo el producto

        % Recorro todos los nodos j, excepto cuando j = k
        for j = 1:n
            if j ~= k
                % Multiplico el término (x - x_j) / (x_k - x_j)
                L = L * (x(i) - xd(j)) / (xd(k) - xd(j));
            end
        end

        %% Acumulo el término L_{n,k}(x) * y_k en la suma
        suma = suma + L * yd(k);

    end

    % Guardo el valor del polinomio evaluado en x(i)
    y(i) = suma;

end

end
