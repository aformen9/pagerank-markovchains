function r = rcuad2_bisec(tol, itmax)
%% Aproxima sqrt(2) con metodo de biseccion en [1,2]
% Input:
%   tol   - tolerancia para |f(c)|
%   itmax - numero maximo de iteraciones
% Output:
%   r     - aproximacion de sqrt(2)
% Autor: Agustin Formenti

% Defino la funcion f(x) = x^2 - 2
f = @(x) x.^2 - 2;

% Intervalo inicial [1,2] donde f(1) < 0 y f(2) > 0
a = 1;
b = 2;

% Metodo de bisecciones
for k = 1:itmax
    % Calculo el punto medio
    c = (a + b) / 2;

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
