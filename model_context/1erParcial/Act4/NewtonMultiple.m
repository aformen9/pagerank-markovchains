function x = NewtonMultiple(f, fp, x0, tol, itmax, alpha)
%% Newton-Raphson para raices multiples con multiplicidad alpha
% Input:
%   f     - funcion
%   fp    - derivada de f
%   x0    - estimacion inicial
%   tol   - tolerancia
%   itmax - numero maximo de iteraciones
%   alpha - multiplicidad de la raiz
% Output:
%   x     - raiz aproximada
% Autor: Agustin Formenti

fprintf(' Iter        x_n              error abs\n')

iter = 1;

while 1
    % Evaluo f y f' en x0
    fx  = f(x0);
    fpx = fp(x0);

    % Formula de Newton modificada: x_{n+1} = x_n - alpha*f(x_n)/f'(x_n)
    x = x0 - alpha * fx / fpx;

    % Calculo el error absoluto
    err = abs(x - x0);

    fprintf('%3.0f   %14.10f   %14.10f\n', iter, x, err)

    % Criterio de parada
    if err <= tol
        fprintf('\nRaiz aproximada: %.10f\n', x)
        return
    end

    % Actualizo para siguiente iteracion
    x0 = x;
    iter = iter + 1;

    % Verifico maximo de iteraciones
    if iter > itmax
        fprintf('\nIteraciones maximas alcanzadas.\n')
        fprintf('Raiz parcial: %.10f\n', x)
        return
    end
end
end
