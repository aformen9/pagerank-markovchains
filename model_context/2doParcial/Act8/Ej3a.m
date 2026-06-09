% Actividad 8 - Ejercicio 3 - Item (a)
% Graficar curvas de nivel para obtener aproximacion de las raices
%
% Sistema: x = 0.7*sen(x) - 0.2*cos(y)
%          y = 0.7*cos(x) + 0.2*sen(y)
%
% Forma estandar: f1(x,y) = x - 0.7*sen(x) + 0.2*cos(y) = 0
%                 f2(x,y) = y - 0.7*cos(x) - 0.2*sen(y) = 0
%
% TEORIA: Las curvas de nivel f1=0 y f2=0 son representaciones graficas
% de las ecuaciones del sistema. Las intersecciones de estas curvas
% corresponden a las raices del SENL. El grafico nos da una aproximacion
% visual de donde estan ubicadas las raices para elegir buenos puntos iniciales.
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 3 - ACTIVIDAD 8 - ITEM (a)\n')
fprintf('Grafico de curvas de nivel\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones no lineales:\n')
fprintf('x = 0.7*sen(x) - 0.2*cos(y)\n')
fprintf('y = 0.7*cos(x) + 0.2*sen(y)\n\n')

fprintf('Forma estandar F(x,y) = 0:\n')
fprintf('f1(x,y) = x - 0.7*sen(x) + 0.2*cos(y) = 0\n')
fprintf('f2(x,y) = y - 0.7*cos(x) - 0.2*sen(y) = 0\n\n')

% Crear malla de puntos
x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

% Evaluar las funciones en la malla
F1 = X - 0.7*sin(X) + 0.2*cos(Y);
F2 = Y - 0.7*cos(X) - 0.2*sin(Y);

% Graficar curvas de nivel donde f1=0 y f2=0
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2)
hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('y')
title('Curvas de nivel del SENL')
legend('f_1(x,y) = 0', 'f_2(x,y) = 0', 'Location', 'best')
axis equal
axis([-2 2 -2 2])
hold off

fprintf('Grafico generado.\n\n')
fprintf('========================================\n')
fprintf('OBSERVACIONES DEL GRAFICO\n')
fprintf('========================================\n')
fprintf('Se observan intersecciones cerca de:\n')
fprintf('- Raiz 1: aproximadamente en (0, 0)\n')
fprintf('- Pueden existir otras raices en la region graficada\n\n')
fprintf('Estos puntos seran usados como aproximaciones iniciales\n')
fprintf('para el metodo de Newton-Raphson en el item (b).\n')


%% Crea malla de puntos
%% Grafica las curvas de nivel donde f₁ = 0 y f₂ = 0
%% Identifica visualmente las aproximaciones de las raíces
%% Incluye teoría sobre interpretación geométrica
