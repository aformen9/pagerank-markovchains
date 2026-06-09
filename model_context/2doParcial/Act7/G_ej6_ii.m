function Y = G_ej6_ii(X)
% Generatrices del ejercicio 6b-ii) - Actividad 7
% ENTRADA: X = [x, y, z] vector fila de tres componentes
% SALIDA: Y = [g1(x,y,z), g2(x,y,z), g3(x,y,z)] vector fila
%
% Agustin Formenti

x = X(1);
y = X(2);
z = X(3);

% Sistema original:
% x² - x + 2y² + yz = 10
% 5x - 6y + z = 0
% z - x² - y² = 0

% Despejo para Punto Fijo:
% x = x² + 2y² + yz - 10
% y = (5x + z)/6
% z = x² + y²

Y(1) = x^2 + 2*y^2 + y*z - 10;
Y(2) = (5*x + z)/6;
Y(3) = x^2 + y^2;

end
