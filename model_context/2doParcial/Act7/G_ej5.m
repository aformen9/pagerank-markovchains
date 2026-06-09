function Y = G_ej5(X)
% Generatrices del ejercicio 5 - Actividad 7
% ENTRADA: X = [x, y] vector fila de dos componentes
% SALIDA: Y = [g1(x,y), g2(x,y)] vector fila de dos componentes
%
% Agustin Formenti

x = X(1);
y = X(2);

% Del sistema:
% x² - y = 0.2  -->  y = x² - 0.2
% y² - x = 0.3  -->  x = y² - 0.3

Y(1) = y^2 - 0.3;
Y(2) = x^2 - 0.2;

end
