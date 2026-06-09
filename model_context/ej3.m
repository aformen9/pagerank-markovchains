% Materia: Metodos y computos numerios
% Fecha: 25/08/2025
% Manejo del lenguaje, graficas y funciones - Tema 1
% Autor: Agustin Formenti

# Ejercicio 3 -> Ploteo de campos escalares

% Mallado
x = -2.5:0.01:2.5;
y = x;
[X, Y] = meshgrid(x,y);
Z = sin(sqrt(X.^2 + Y.^2));

# a)
% --- mesh ---
figure(1);
mesh(X, Y, Z);
grid on;

% --- surf ---
figure(2);
surf(X,Y,Z), colorbar;

# b)
% --- contour ---
figure(3);
contour(X,Y,Z,5), grid on;






















