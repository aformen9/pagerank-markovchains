function [x1, x2] = cuad_mejor(a, b, c)
%% cuad_mejor: calcula raices de ax^2 + bx + c = 0
% usando las formulas mejoradas del Ejercicio 5.
%
% Input:
%   a, b, c : coeficientes (a != 0)
% Output:
%   x1, x2  : raices de la ecuacion
%
% Idea:
%   Partimos de la formula clasica y multiplicamos por conjugado.
%   Se obtiene:
%       x1 = -2c / ( b + sqrt(b^2 - 4ac) )
%       x2 = -2c / ( b - sqrt(b^2 - 4ac) )
%   Estas expresiones evitan restar numeros muy parecidos en el numerador,
%   reduciendo la perdida de cifras significativas.
%
% Autor: Agustin Formenti

%% Calculo el discriminante
D = b^2 - 4*a*c;

%% Raiz cuadrada del discriminante
sqrtD = sqrt(D);

%% Formulas mejoradas
x1 = -2*c ./ (b + sqrtD);
x2 = -2*c ./ (b - sqrtD);

end

