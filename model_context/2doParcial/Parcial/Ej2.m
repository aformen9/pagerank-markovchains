%%% Ej2
%%% Autor: Agustin Formenti

%% 2a
%% Sistema: 7x^3 - 10x - y = 1, 8y^3 - 11y + x = 1

clear; clc;

x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

F1 = 7*X.^3 - 10*X - Y - 1;
F2 = 8*Y.^3 - 11*Y + X - 1;

figure;
hold on;
grid on;

contour(X, Y, F1, [0 0], 'r', 'LineWidth', 2.5);
contour(X, Y, F2, [0 0], 'b', 'LineWidth', 2.5);

xlabel('x');
ylabel('y');
title('Sistema cubico');
axis([-2 2 -2 2]);
axis square;
hold off;

%% 2b
%% Sistema: 7x^3 - 10x - y = 1, 8y^3 - 11y + x = 1
%% Generatrices: y = 7x^3 - 10x - 1, x = 1 - 8y^3 + 11y

clear; clc;

tol = 1e-7;
P0 = [1.2, 1.2];

[Pk, iter] = PuntoFijo('G_ej2b', P0, tol, 10000);

disp(' ')
disp('Verificacion:')
f1 = 7*Pk(1)^3 - 10*Pk(1) - Pk(2) - 1;
f2 = 8*Pk(2)^3 - 11*Pk(2) + Pk(1) - 1;
disp(['f1 = ', num2str(f1)])
disp(['f2 = ', num2str(f2)])

%% El metodo diverge porque las generatrices no satisfacen
%% la condicion de contraccion. Las derivadas son muy grandes
%% y provoca que las iteraciones diverjan.
%% Para este sistema punto fijo no es adecuado.

%% 2c
%% Sistema: 7x^3 - 10x - y = 1, 8y^3 - 11y + x = 1

clear; clc;

X0 = [1; 1];
tol = 1e-7;

[X, iter, err] = NewtonRaphsonSENL('F_ej2c', 'JF_ej2c', X0, tol, 100);
