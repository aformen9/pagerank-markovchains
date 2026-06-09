function S = TaylorExp(x, n)
%% taylor_exp
% Aproxima la funcion exponencial e^x mediante su polinomio de Taylor
% centrado en a = 0:
%   e^x ≈ 1 + x/1! + x^2/2! + ... + x^n/n!
%
% Input:
%   x : punto donde quiero aproximar e^x
%   n : numero de terminos de la suma (grado del polinomio)
%
% Output:
%   S : valor aproximado de e^x usando n terminos
%
% Autor: Agustin Formenti

%% Inicializo la suma y el primer termino
S = 1;          % arranco en 1 (termino k = 0)
term = 1;       % termino k = 0 -> x^0 / 0! = 1

%% Voy construyendo cada termino y actualizando la suma
for k = 1:n
    % Termino k-ésimo: x^k / k! a partir del anterior
    term = term * x / k;

    % Actualizo la suma parcial
    S = S + term;
end

end

