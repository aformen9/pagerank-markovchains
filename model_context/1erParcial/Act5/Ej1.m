% Actividad 5 - Ejercicio 1a (Sistema i)
% Resolver SEL usando eliminacion gaussiana con pivote parcial escalado
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 1a (Sistema i)')
disp('=========================================')
disp(' ')

%% Definicion del sistema i) de ecuaciones lineales
% Sistema 3x3:
%   2x1 - 3x2 + 100x3 = 1
%   x1 + 10x2 - 0.001x3 = 0
%   3x1 - 100x2 + 0.01x3 = 0

% Matriz de coeficientes A
A = [2, -3, 100;
     1, 10, -0.001;
     3, -100, 0.01];

% Vector lado derecho b
b = [1; 0; 0];

disp('Matriz de coeficientes A:')
disp(A)
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Resolucion usando eliminacion gaussiana con pivote parcial escalado
% Usamos la funcion Gauss.m que implementa este metodo
x = Gauss(A, b);

disp('Solucion del sistema (x):')
disp(x)
disp(' ')

%% Verificacion de dimensiones
% Comprobamos que la solucion tenga las dimensiones correctas
[m, n] = size(x);
fprintf('Dimensiones de la solucion: %d x %d\n', m, n)

disp(' ')
disp('========== FIN EJERCICIO 1a (Sistema i) ==========')


% Actividad 5 - Ejercicio 1b (Sistema i)
% Verificar solucion usando vector residual r = b - Ax
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 1b (Sistema i)')
disp('=========================================')
disp(' ')

%% Definicion del sistema i) de ecuaciones lineales
% Sistema 3x3:
%   2x1 - 3x2 + 100x3 = 1
%   x1 + 10x2 - 0.001x3 = 0
%   3x1 - 100x2 + 0.01x3 = 0

% Matriz de coeficientes A
A = [2, -3, 100;
     1, 10, -0.001;
     3, -100, 0.01];

% Vector lado derecho b
b = [1; 0; 0];

%% Resolucion del sistema
% Obtenemos la solucion con el metodo de Gauss
x = Gauss(A, b);

disp('Solucion obtenida (x):')
disp(x)
disp(' ')

%% Calculo del vector residual
% El vector residual mide que tan bien la solucion aproximada
% satisface el sistema original: r = b - Ax
% Si r es cercano a cero, la solucion es buena

r = b - A*x;

disp('Vector residual r = b - Ax:')
disp(r)
disp(' ')

%% Calculo de normas del vector residual
% Calculamos diferentes normas para medir el error
norma_1 = normap(r, 1);
norma_2 = normap(r, 2);
norma_inf = normap(r, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)
disp(' ')

%% Interpretacion
% Si las normas son muy pequenas (cercanas a cero), significa que
% la solucion aproxima bien la solucion exacta del sistema

if norma_2 < 1e-10
    disp('La solucion obtenida aproxima muy bien la solucion exacta.')
else
    disp('Hay un error residual apreciable en la solucion.')
end

disp(' ')
disp('========== FIN EJERCICIO 1b (Sistema i) ==========')


% Actividad 5 - Ejercicio 1a (Sistema ii)
% Resolver SEL usando eliminacion gaussiana con pivote parcial escalado
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 1a (Sistema ii)')
disp('==========================================')
disp(' ')

%% Definicion del sistema ii) de ecuaciones lineales
% Sistema 4x4:
%   x1 + 20x2 - x3 + 0.001x4 = 0
%   2x1 - 5x2 + 30x3 - 0.1x4 = 1
%   5x1 + x2 - 100x3 - 10x4 = 0
%   2x1 - 100x2 - x3 + x4 = 0

% Matriz de coeficientes A
A = [1, 20, -1, 0.001;
     2, -5, 30, -0.1;
     5, 1, -100, -10;
     2, -100, -1, 1];

% Vector lado derecho b
b = [0; 1; 0; 0];

disp('Matriz de coeficientes A:')
disp(A)
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Resolucion usando eliminacion gaussiana con pivote parcial escalado
% Usamos la funcion Gauss.m que implementa este metodo
x = Gauss(A, b);

disp('Solucion del sistema (x):')
disp(x)
disp(' ')

%% Verificacion de dimensiones
% Comprobamos que la solucion tenga las dimensiones correctas
[m, n] = size(x);
fprintf('Dimensiones de la solucion: %d x %d\n', m, n)

disp(' ')
disp('========== FIN EJERCICIO 1a (Sistema ii) ==========')


% Actividad 5 - Ejercicio 1b (Sistema ii)
% Verificar solucion usando vector residual r = b - Ax
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 1b (Sistema ii)')
disp('==========================================')
disp(' ')

%% Definicion del sistema ii) de ecuaciones lineales
% Sistema 4x4:
%   x1 + 20x2 - x3 + 0.001x4 = 0
%   2x1 - 5x2 + 30x3 - 0.1x4 = 1
%   5x1 + x2 - 100x3 - 10x4 = 0
%   2x1 - 100x2 - x3 + x4 = 0

% Matriz de coeficientes A
A = [1, 20, -1, 0.001;
     2, -5, 30, -0.1;
     5, 1, -100, -10;
     2, -100, -1, 1];

% Vector lado derecho b
b = [0; 1; 0; 0];

%% Resolucion del sistema
% Obtenemos la solucion con el metodo de Gauss
x = Gauss(A, b);

disp('Solucion obtenida (x):')
disp(x)
disp(' ')

%% Calculo del vector residual
% El vector residual mide que tan bien la solucion aproximada
% satisface el sistema original: r = b - Ax
% Si r es cercano a cero, la solucion es buena

r = b - A*x;

disp('Vector residual r = b - Ax:')
disp(r)
disp(' ')

%% Calculo de normas del vector residual
% Calculamos diferentes normas para medir el error
norma_1 = normap(r, 1);
norma_2 = normap(r, 2);
norma_inf = normap(r, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)
disp(' ')

%% Interpretacion
% Si las normas son muy pequenas (cercanas a cero), significa que
% la solucion aproxima bien la solucion exacta del sistema

if norma_2 < 1e-10
    disp('La solucion obtenida aproxima muy bien la solucion exacta.')
else
    disp('Hay un error residual apreciable en la solucion.')
end

disp(' ')
disp('========== FIN EJERCICIO 1b (Sistema ii) ==========')
