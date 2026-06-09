function deriv = df1dx(fnom,x)
% Derivada primera numérica con fórmula centrada o(h^2)
% fnom  : nombre de la función que define la ecuación 
% x     : puntos de evaluación
% deriv : puntos de evaluación de la derivada primera aproximada
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modifcacion: Luciano Ponzellini Marinelli (2022)

h = 1e-6;
deriv = (fnom(x+h)-fnom(x-h))/(2*h);
