function [x1, x2] = cuad(a, b, c)
%% function cuad: calcula raices de ecuacion cuadratica ax^2 + bx + c = 0
% Input: a, b, c - coeficientes de la ecuacion (a != 0)
% Output: x1, x2 - las dos raices de la ecuacion
% Autor: Agustin Formenti

% Calculo el discriminante
discriminante = b^2 - 4*a*c;

% Calculo las raices usando la formula cuadratica
x1 = (-b + sqrt(discriminante)) / (2*a);
x2 = (-b - sqrt(discriminante)) / (2*a);

end
