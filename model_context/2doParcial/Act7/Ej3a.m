% Ejercicio 3a - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

%% Defino las curvas implicitas
% De x = g1(x,y) obtenemos: 4x² - y² - 1 = 0
% De y = g2(x,y) obtenemos: x² + y² - 2x - 3 = 0

% Creo malla de puntos
x = linspace(-2, 4, 400);
y = linspace(-3, 3, 400);
[X, Y] = meshgrid(x, y);

% Evaluo las funciones
F1 = 4*X.^2 - Y.^2 - 1;           % hiperbola
F2 = X.^2 + Y.^2 - 2*X - 3;       % circunferencia

%% Grafico usando contour
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2), hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)

% Marco el punto inicial
plot(1.1, 2.0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
text(1.1, 2.0, '  (1.1, 2.0) punto inicial', 'FontSize', 10)

grid on
xlabel('x')
ylabel('y')
title('Curvas del SENL - Ejercicio 3')
legend('Hiperbola: 4x^2 - y^2 - 1 = 0', ...
       'Circunferencia: x^2 + y^2 - 2x - 3 = 0', ...
       'Punto inicial', 'Location', 'best')
axis equal
xlim([-2 4])
ylim([-3 3])
hold off

fprintf('Grafica generada. Las raices estan en las intersecciones.\n')
