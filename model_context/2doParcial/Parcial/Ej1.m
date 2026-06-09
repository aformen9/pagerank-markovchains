%%% Ej1
%%% Autor: Agustin Formenti

%% 1a
%% Sistema: x^2 - y + alpha = 0, -x + y^2 + alpha = 0

clear; clc;

x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

figure;
hold on;
grid on;

%% alphas
alpha = 1;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'r', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'r:', 'LineWidth', 2);

alpha = 0.25;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'g', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'g:', 'LineWidth', 2);

alpha = 0;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'b:', 'LineWidth', 2);

alpha = -1;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'm', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'm:', 'LineWidth', 2);

xlabel('x');
ylabel('y');
title('Curvas de nivel para distintos alpha');
axis([-2 2 -2 2]);
axis square;
hold off;

%% 1b
%% Sistema: x^2 - y - 1 = 0, -x + y^2 - 1 = 0
%% Generatrices: x = y^2 - 1, y = x^2 - 1

clear; clc;

alpha = -1;
tol = 1e-4;
P0 = [0, 0];

[Pk, iter] = PuntoFijo('G_ej1b', P0, tol, 1000);

p_final = Pk(1);
q_final = Pk(2);

%% 1c

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
