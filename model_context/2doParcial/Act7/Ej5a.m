% Ejercicio 5a - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

%% Ecuaciones implicitas:
% x² - y = 0.2  -->  y = x² - 0.2
% y² - x = 0.3  -->  x = y² - 0.3

%% Creo malla de puntos
x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

%% Evaluo las funciones implicitas
% Curva 1: x² - y - 0.2 = 0
F1 = X.^2 - Y - 0.2;

% Curva 2: y² - x - 0.3 = 0
F2 = Y.^2 - X - 0.3;

%% Grafico usando contour
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2), hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)

% Marco los puntos iniciales
plot(1.2, 1.2, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
text(1.2, 1.2, '  (1.2, 1.2)', 'FontSize', 10)

plot(-0.2, -0.2, 'mo', 'MarkerSize', 10, 'MarkerFaceColor', 'm')
text(-0.2, -0.2, '  (-0.2, -0.2)', 'FontSize', 10)

grid on
xlabel('x')
ylabel('y')
title('Curvas del SENL - Ejercicio 5')
legend('Parabola 1: x^2 - y = 0.2', ...
       'Parabola 2: y^2 - x = 0.3', ...
       'Punto inicial 1', ...
       'Punto inicial 2', ...
       'Location', 'best')
axis equal
xlim([-2 2])
ylim([-2 2])
hold off

fprintf('Grafica generada. Las raices estan en las intersecciones.\n')
