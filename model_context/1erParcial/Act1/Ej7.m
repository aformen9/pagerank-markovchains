% Actividad 1 - Ejercicio 7a
% Graficar f1, f2, f3, f4 en la misma grafica con distintos colores
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 7a ==========')

%% Discretizo el intervalo [-3, 3]
% Uso linspace para generar 100 puntos uniformemente distribuidos
% Esto da una grafica suave
x = linspace(-3, 3, 100);

%% Evaluo cada funcion en el intervalo
y1 = f1(x);
y2 = f2(x);
y3 = f3(x);
y4 = f4(x);

%% Grafico todas las funciones en la misma figura
figure(1)
plot(x, y1, 'b', x, y2, 'r', x, y3, 'g', x, y4, 'm')
% b=azul, r=rojo, g=verde, m=magenta

% Agrego grid para mejor visualizacion
grid on

% Agrego etiquetas y titulo
xlabel('x')
ylabel('y')
title('Graficas de f1, f2, f3, f4 en [-3, 3]')

% Agrego leyenda para identificar cada funcion
legend('f1(x) = x^3 - x - 1', 'f2(x) = e^{-x} - x', ...
       'f3(x) = cos(2x) - sin(x)', 'f4(x) = x ln(|x|)', ...
       'Location', 'best')

disp('Grafica creada en Figure 1')
disp(' ')
disp('========== FIN EJERCICIO 7a ==========')

% Actividad 1 - Ejercicio 7c
% Graficar f1, f2, f3, f4 en subplots separados
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 7c ==========')

%% Discretizo el intervalo [-3, 3]
x = linspace(-3, 3, 100);

%% Evaluo cada funcion
y1 = f1(x);
y2 = f2(x);
y3 = f3(x);
y4 = f4(x);

%% Creo subplot 2x2 (2 filas, 2 columnas)
% subplot(m, n, i) divide la figura en m filas y n columnas
% y activa el subplot i-esimo
figure(2)

% Subplot 1: f1 (posicion 1 = arriba izquierda)
subplot(2, 2, 1)
plot(x, y1, 'b')
grid on
title('f1(x) = x^3 - x - 1')
xlabel('x')
ylabel('f1(x)')

% Subplot 2: f2 (posicion 2 = arriba derecha)
subplot(2, 2, 2)
plot(x, y2, 'r')
grid on
title('f2(x) = e^{-x} - x')
xlabel('x')
ylabel('f2(x)')

% Subplot 3: f3 (posicion 3 = abajo izquierda)
subplot(2, 2, 3)
plot(x, y3, 'g')
grid on
title('f3(x) = cos(2x) - sin(x)')
xlabel('x')
ylabel('f3(x)')

% Subplot 4: f4 (posicion 4 = abajo derecha)
subplot(2, 2, 4)
plot(x, y4, 'm')
grid on
title('f4(x) = x ln(|x|)')
xlabel('x')
ylabel('f4(x)')

disp('Subplots creados en Figure 2')
disp(' ')
disp('========== FIN EJERCICIO 7c ==========')
