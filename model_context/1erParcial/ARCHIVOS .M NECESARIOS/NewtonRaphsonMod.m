function x = NewtonRaphsonMod(f, fp, x0, tol, itmax, alpha, poder_cociente)
%% Newton-Raphson modificado para raices multiples
% Imprime el cociente |e_{n+1}|/|e_n|^poder en cada iteracion
% Input:
%   f              - funcion
%   fp             - derivada de f
%   x0             - estimacion inicial
%   tol            - tolerancia
%   itmax          - numero maximo de iteraciones
%   alpha          - (opcional) multiplicidad de la raiz (default = 1, N-R estandar)
%   poder_cociente - (opcional) potencia para el cociente de errores (default = 1)
% Output:
%   x              - raiz aproximada
% Autor: Agustin Formenti

% Si no se pasa alpha, por defecto es 1 (Newton-Raphson estandar)
if nargin < 6
    alpha = 1;
end

% Si no se pasa poder_cociente, por defecto es 1
if nargin < 7
    poder_cociente = 1;
end

r = 1;   % raiz doble conocida para este ejercicio

% Imprimo encabezado segun el poder del cociente
if poder_cociente == 1
    fprintf(' Iter        x_n               error abs         |e(n+1)|/|e(n)| \n')
else
    fprintf(' Iter        x_n               error abs         |e(n+1)|/|e(n)|^%d \n', poder_cociente)
end

iter = 1;
e_old = abs(x0 - r);

while 1
    % Evaluo f y f' en x0
    fx  = f(x0);
    fpx = fp(x0);

    % Formula de Newton-Raphson modificada con alpha
    x = x0 - alpha * fx / fpx;

    % Calculo el error absoluto
    e_new = abs(x - r);

    % Calculo el cociente |e_{n+1}|/|e_n|^poder_cociente
    if e_old > 0
        coc = e_new / (e_old^poder_cociente);
    else
        coc = 0;
    end

    fprintf('%3.0f   %14.10f   %14.10f   %14.10f\n', iter, x, e_new, coc)

    % Criterio de parada
    if e_new <= tol
        fprintf('\nRaiz aproximada: %.10f\n', x)
        return
    end

    % Actualizo para siguiente iteracion
    x0 = x;
    e_old = e_new;
    iter = iter + 1;

    % Verifico maximo de iteraciones
    if iter > itmax
        fprintf('\nIteraciones maximas alcanzadas.\n')
        fprintf('Raiz parcial: %.10f\n', x)
        return
    end
end
end
