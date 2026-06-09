% Actividad 5 - Ejercicio 2b
% Resolver SEL usando el metodo de Cramer
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 2b')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Sistema 3x3:
%   10x1 + 3x2 + x3 = 19
%   3x1 + 10x2 + 2x3 = 29
%   x1 + 2x2 + 10x3 = 35

% Matriz de coeficientes A
A = [10, 3, 1;
     3, 10, 2;
     1, 2, 10];

% Vector lado derecho b
b = [19; 29; 35];

disp('Matriz de coeficientes A:')
disp(A)
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Resolucion usando el metodo de Cramer
% El metodo de Cramer usa determinantes para resolver sistemas lineales
% Para cada incognita xi, se calcula xi = det(Ai) / det(A)
% donde Ai es la matriz A con la i-esima columna reemplazada por b

x = Cramer(A, b);

disp('Solucion del sistema usando Cramer (x):')
disp(x)
disp(' ')

%% Verificacion de la solucion
% Calculamos Ax para ver si da aproximadamente b
Ax = A * x;

disp('Verificacion: A*x debe ser aproximadamente igual a b')
disp('A*x =')
disp(Ax)
disp('b =')
disp(b)
disp(' ')

%% Calculo del error residual
% El residual mide que tan bien se satisface el sistema
r = b - Ax;
norma_r = normap(r, 2);

fprintf('Norma del residual ||b - Ax||_2 = %.10e\n', norma_r)

disp(' ')
disp('========== FIN EJERCICIO 2b ==========')


% Actividad 5 - Ejercicio 2c
% Resolver SEL usando Gauss y comparar tiempos con Cramer
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 2c')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Sistema 3x3:
%   10x1 + 3x2 + x3 = 19
%   3x1 + 10x2 + 2x3 = 29
%   x1 + 2x2 + 10x3 = 35

% Matriz de coeficientes A
A = [10, 3, 1;
     3, 10, 2;
     1, 2, 10];

% Vector lado derecho b
b = [19; 29; 35];

disp('Sistema de ecuaciones lineales 3x3')
disp(' ')

%% Resolucion con metodo de Cramer y medicion de tiempo
% tic inicia el cronometro, toc lo detiene y muestra el tiempo

tic
x_cramer = Cramer(A, b);
tiempo_cramer = toc;

disp('Solucion con Cramer:')
disp(x_cramer)
fprintf('Tiempo de ejecucion Cramer: %.6f segundos\n', tiempo_cramer)
disp(' ')

%% Resolucion con metodo de Gauss y medicion de tiempo

tic
x_gauss = Gauss(A, b);
tiempo_gauss = toc;

disp('Solucion con Gauss:')
disp(x_gauss)
fprintf('Tiempo de ejecucion Gauss: %.6f segundos\n', tiempo_gauss)
disp(' ')

%% Comparacion de tiempos
% Calculamos cuantas veces mas rapido es un metodo respecto al otro

disp('========================================')
disp('COMPARACION DE TIEMPOS COMPUTACIONALES')
disp('========================================')
fprintf('Tiempo Cramer: %.6f segundos\n', tiempo_cramer)
fprintf('Tiempo Gauss:  %.6f segundos\n', tiempo_gauss)
disp(' ')

if tiempo_cramer > tiempo_gauss
    factor = tiempo_cramer / tiempo_gauss;
    fprintf('Gauss es %.2f veces mas rapido que Cramer\n', factor)
else
    factor = tiempo_gauss / tiempo_cramer;
    fprintf('Cramer es %.2f veces mas rapido que Gauss\n', factor)
end

disp(' ')

%% Verificacion de que ambas soluciones son iguales
% Calculamos la diferencia entre ambas soluciones
diferencia = normap(x_cramer - x_gauss, 2);

fprintf('Diferencia entre soluciones: ||x_cramer - x_gauss||_2 = %.10e\n', diferencia)

if diferencia < 1e-10
    disp('Ambas soluciones son practicamente identicas.')
else
    disp('Hay una diferencia apreciable entre las soluciones.')
end

disp(' ')
disp('========== FIN EJERCICIO 2c ==========')


% Actividad 5 - Ejercicio 2d
% Sistema 1000x1000 - Comparar Cramer vs Gauss
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 2d')
disp('===========================')
disp(' ')

%% Generacion de matriz 1000x1000 y vector lado derecho
% Generamos una matriz random entera de valores entre 1 y 1000
% El vector b se construye de modo que la solucion sea un vector de unos

disp('Generando matriz 1000x1000 con valores aleatorios...')

n = 1000;
A = randi([1, 1000], n, n);
b = A * ones(n, 1);

disp('Matriz generada.')
fprintf('Dimensiones de A: %d x %d\n', size(A, 1), size(A, 2))
fprintf('Dimension de b: %d x 1\n', length(b))
disp(' ')

%% Resolucion con metodo de Cramer y medicion de tiempo
% ADVERTENCIA: Cramer es muy lento para matrices grandes
% Puede tardar varios minutos o incluso horas

disp('Resolviendo con metodo de Cramer...')
disp('ADVERTENCIA: Este metodo es muy lento para n=1000')
disp('Puede tardar varios minutos...')

tic
x_cramer = Cramer(A, b);
tiempo_cramer = toc;

fprintf('Tiempo de ejecucion Cramer: %.6f segundos (%.2f minutos)\n', tiempo_cramer, tiempo_cramer/60)
disp(' ')

%% Resolucion con metodo de Gauss y medicion de tiempo

disp('Resolviendo con metodo de Gauss...')

tic
x_gauss = Gauss(A, b);
tiempo_gauss = toc;

fprintf('Tiempo de ejecucion Gauss: %.6f segundos\n', tiempo_gauss)
disp(' ')

%% Comparacion de tiempos
% Para matrices grandes, la diferencia de tiempos es enorme

disp('=========================================')
disp('COMPARACION DE TIEMPOS - SISTEMA 1000x1000')
disp('=========================================')
fprintf('Tiempo Cramer: %.6f segundos (%.2f minutos)\n', tiempo_cramer, tiempo_cramer/60)
fprintf('Tiempo Gauss:  %.6f segundos\n', tiempo_gauss)
disp(' ')

factor = tiempo_cramer / tiempo_gauss;
fprintf('Gauss es %.2f veces mas rapido que Cramer\n', factor)
disp(' ')

%% Verificacion de que la solucion es correcta
% Como construimos b = A*ones(n,1), la solucion deberia ser ones(n,1)

disp('Verificacion: la solucion deberia ser un vector de unos')

% Verificamos con Gauss (mas rapido)
error_gauss = normap(x_gauss - ones(n, 1), 2);
fprintf('Error Gauss: ||x_gauss - ones||_2 = %.10e\n', error_gauss)

% Verificamos con Cramer
error_cramer = normap(x_cramer - ones(n, 1), 2);
fprintf('Error Cramer: ||x_cramer - ones||_2 = %.10e\n', error_cramer)
disp(' ')

%% Conclusion
disp('CONCLUSION:')
disp('El metodo de Cramer tiene complejidad O(n!), por lo que es')
disp('extremadamente ineficiente para matrices grandes.')
disp('El metodo de Gauss tiene complejidad O(n^3) y es mucho mas rapido.')
disp('Para n=1000, Gauss es ordenes de magnitud mas eficiente.')

disp(' ')
disp('========== FIN EJERCICIO 2d ==========')


###NO CORRER!!!

