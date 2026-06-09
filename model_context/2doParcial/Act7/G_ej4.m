function Y = G_ej4(X)
% Generatrices del ejercicio 4 - Actividad 7
% ENTRADA: X = [x, y] vector fila de dos componentes
% SALIDA: Y = [g1(x,y), g2(x,y)] vector fila de dos componentes
%
% Agustin Formenti

x = X(1);
y = X(2);

Y(1) = (y - x^3 + 3*x^2 + 3*x)/7;
Y(2) = (y^2 + 2*y - x - 2)/2;

end
