function S = TaylorExp_tabla(x, n)
%% taylor_exp_tabla
% Aproxima e^x con el polinomio de Taylor y va imprimiendo:
%   - numero de termino k
%   - suma parcial S_k
%   - termino que se agrega en cada paso
%   - error absoluto |e^x - S_k|
%
% Input:
%   x : punto donde quiero aproximar e^x
%   n : numero de terminos de la suma
%
% Output:
%   S : suma parcial final (aproximacion de e^x)
%
% Autor: Agustin Formenti

%% Valor exacto para calcular el error
f_exacto = exp(x);

%% Inicializo suma y primer termino
S = 1;          % suma parcial k = 0
term = 1;       % termino k = 0

%% Encabezado de la tabla
fprintf('\nAproximacion de e^x con Taylor (x = %.6f, n = %d)\n', x, n);
fprintf('--------------------------------------------------------------\n');
fprintf('  k        S_k (suma parcial)      termino_k        error abs\n');
fprintf('--------------------------------------------------------------\n');

%% Imprimo el estado inicial (k = 0)
err = abs(f_exacto - S);
fprintf('%3d   %20.12e   %12.4e   %12.4e\n', 0, S, term, err);

%% Recorro los terminos desde k = 1 hasta n
for k = 1:n
    % Construyo el termino k a partir del anterior
    term = term * x / k;

    % Actualizo suma parcial
    S = S + term;

    % Calculo error absoluto actual
    err = abs(f_exacto - S);

    % Imprimo fila de la tabla
    fprintf('%3d   %20.12e   %12.4e   %12.4e\n', k, S, term, err);
end

fprintf('--------------------------------------------------------------\n');

end

