% Actividad 1 - Ejercicio 10a
% Graficas 3D de f(x,y) = e^(-(x^2+y^2)) usando mesh y surf
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 10a ==========')

%% Defino el dominio [-1, 1] x [-1, 1]
% Discretizo cada eje
x = linspace(-1, 1, 50);
y = linspace(-1, 1, 50);

%% Creo la malla (grid) con meshgrid
% meshgrid genera matrices X e Y con las coordenadas de todos los puntos
% X contiene las coordenadas x repetidas en filas
% Y contiene las coordenadas y repetidas en columnas
[X, Y] = meshgrid(x, y);

%% Evaluo la funcion f(x,y) = e^(-(x^2+y^2)) en la malla
% Uso operaciones elemento a elemento con .^ y .*
Z = exp(-(X.^2 + Y.^2));

%% Grafico usando mesh
% mesh crea una superficie con lineas (malla)
figure(6)
mesh(X, Y, Z)
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
title('Grafico 3D con mesh: f(x,y) = e^{-(x^2+y^2)}')
grid on
colorbar  % Agrego barra de colores

disp('Grafico con mesh creado en Figure 6')

%% Grafico usando surf
% surf crea una superficie solida con colores
figure(7)
surf(X, Y, Z)
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
title('Grafico 3D con surf: f(x,y) = e^{-(x^2+y^2)}')
grid on
colorbar  % Agrego barra de colores

disp('Grafico con surf creado en Figure 7')
disp(' ')
disp('========== FIN EJERCICIO 10a ==========')

% Actividad 1 - Ejercicio 10b
% Grafica 2D de curvas de nivel de f(x,y) = e^(-(x^2+y^2))
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 10b ==========')

%% Defino el dominio [-1, 1] x [-1, 1]
x = linspace(-1, 1, 100);
y = linspace(-1, 1, 100);

%% Creo la malla con meshgrid
[X, Y] = meshgrid(x, y);

%% Evaluo la funcion f(x,y) = e^(-(x^2+y^2))
Z = exp(-(X.^2 + Y.^2));

%% Grafico las curvas de nivel usando contour
% contour(X, Y, Z, n) dibuja n curvas de nivel
% Cada curva representa puntos donde f(x,y) tiene el mismo valor
figure(8)
contour(X, Y, Z, 15)  % 15 niveles
grid on
xlabel('x')
ylabel('y')
title('Curvas de nivel de f(x,y) = e^{-(x^2+y^2)}')
colorbar  % Agrego barra de colores para identificar los niveles

disp('Grafica de curvas de nivel creada en Figure 8')
disp(' ')
disp('Las curvas de nivel son circulos concentricos centrados en el origen')
disp('porque la funcion es simetrica radialmente')
disp(' ')
disp('========== FIN EJERCICIO 10b ==========')
