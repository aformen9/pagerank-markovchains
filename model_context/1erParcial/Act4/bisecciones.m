function [r, k] = bisecciones(f, a, b, tol, itmax, verbose)
%% Metodo general de biseccion para hallar una raiz en [a,b]
% Input:
%   f       - funcion anonima (debe cumplir f(a)*f(b) < 0)
%   a       - extremo izquierdo del intervalo
%   b       - extremo derecho del intervalo
%   tol     - tolerancia para |f(c)|
%   itmax   - numero maximo de iteraciones
%   verbose - (opcional) si es true, imprime extremos y puntos medios
% Output:
%   r       - aproximacion de la raiz
%   k       - numero de iteraciones realizadas
% Autor: Agustin Formenti

% Si no se pasa verbose, por defecto es false
if nargin < 6
    verbose = false;
end

% Verifico que f(a) y f(b) tengan signos opuestos
if f(a) * f(b) > 0
    error('Error: f(a) y f(b) deben tener signos opuestos')
end

% Si verbose es true, imprimo encabezado
if verbose
    fprintf('  Iter        a              b              c\n')
    fprintf('-------------------------------------------------------\n')
end

% Metodo de bisecciones
for k = 1:itmax
    % Calculo el punto medio
    c = (a + b) / 2;

    % Si verbose es true, imprimo los valores actuales
    if verbose
        fprintf('%5d   %.12f   %.12f   %.12f\n', k, a, b, c)
    end

    % Si |f(c)| < tol, encontre la raiz
    if abs(f(c)) < tol
        r = c;
        return
    end

    % Actualizo el intervalo segun el signo de f(a)*f(c)
    if f(a) * f(c) > 0
        a = c;  % la raiz esta en [c,b]
    else
        b = c;  % la raiz esta en [a,c]
    end
end

% Si sali del loop, retorno la ultima aproximacion
r = c;

end
