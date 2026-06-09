%% Ejercicio 1c - Grafica con aproximacion inicial y final
%% Autor: Agustin Formenti

clear; clc;

alpha = -1;
tol = 1e-4;
p = 0;
q = 0;

%% Punto Fijo
for k = 1:1000
    p_ant = p;
    q_ant = q;

    p = q^2 - 1;
    q = p_ant^2 - 1;

    error = max(abs(p - p_ant), abs(q - q_ant));
    if error < tol
        break;
    end
end

p_final = p;
q_final = q;

x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;

figure;
hold on;
grid on;

contour(X, Y, F1, [0 0], 'k', 'LineWidth', 2.5);
contour(X, Y, F2, [0 0], 'k:', 'LineWidth', 2.5);

%% Punto inicial con asterisco
plot(0, 0, 'k*', 'MarkerSize', 18, 'LineWidth', 3);

%% No se marca circulo porque el metodo diverge

xlabel('x');
ylabel('y');
title('Punto Fijo con alpha=-1');
axis([-2 2 -2 2]);
axis square;
hold off;

%% El metodo diverge porque las generatrices no cumplen condicion de contraccion
%% las derivadas crecen y las iteraciones oscilan sin converger
