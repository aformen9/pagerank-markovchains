% Actividad 5 - Ejercicio 5a
% Prueba de la funcion Regresiva para sistemas triangulares superiores
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 5a')
disp('===========================')
disp(' ')

%% Ejemplo 1: Sistema triangular superior 3x3
% Sistema:
%   2x1 + 3x2 + x3 = 11
%        5x2 + 2x3 = 17
%             4x3 = 12

disp('EJEMPLO 1: Sistema triangular superior 3x3')
disp(' ')

% Matriz triangular superior U
U = [2, 3, 1;
     0, 5, 2;
     0, 0, 4];

% Vector lado derecho b
b = [11; 17; 12];

disp('Matriz triangular superior U:')
disp(U)
disp('Vector b:')
disp(b)
disp(' ')

%% Resolucion con sustitucion regresiva
x = Regresiva(U, b);

disp('Solucion usando Regresiva:')
disp(x)
disp(' ')

%% Verificacion de la solucion
% Calculamos U*x y comparamos con b

Ux = U * x;

disp('Verificacion: U*x debe ser igual a b')
disp('U*x =')
disp(Ux)
disp('b =')
disp(b)
disp(' ')

%% Calculo del residual
r = b - Ux;
norma_r = normap(r, 2);

fprintf('Norma del residual ||b - U*x||_2 = %.10e\n', norma_r)
disp(' ')

%% Ejemplo 2: Sistema triangular superior 4x4
disp('=========================================')
disp('EJEMPLO 2: Sistema triangular superior 4x4')
disp(' ')

U2 = [3, 1, 2, 1;
      0, 2, 1, 3;
      0, 0, 4, 2;
      0, 0, 0, 5];

b2 = [15; 12; 18; 10];

disp('Matriz triangular superior U2:')
disp(U2)
disp('Vector b2:')
disp(b2)
disp(' ')

x2 = Regresiva(U2, b2);

disp('Solucion usando Regresiva:')
disp(x2)
disp(' ')

% Verificacion
r2 = b2 - U2*x2;
norma_r2 = normap(r2, 2);
fprintf('Norma del residual ||b2 - U2*x2||_2 = %.10e\n', norma_r2)

disp(' ')
disp('========== FIN EJERCICIO 5a ==========')


% Actividad 5 - Ejercicio 5b
% Prueba de la funcion Progresiva para sistemas triangulares inferiores
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 5b')
disp('===========================')
disp(' ')

%% Ejemplo 1: Sistema triangular inferior 3x3
% Sistema:
%   2x1              = 6
%   3x1 + 4x2        = 18
%   1x1 + 2x2 + 5x3  = 20

disp('EJEMPLO 1: Sistema triangular inferior 3x3')
disp(' ')

% Matriz triangular inferior L
L = [2, 0, 0;
     3, 4, 0;
     1, 2, 5];

% Vector lado derecho b
b = [6; 18; 20];

disp('Matriz triangular inferior L:')
disp(L)
disp('Vector b:')
disp(b)
disp(' ')

%% Resolucion con sustitucion progresiva
x = Progresiva(L, b);

disp('Solucion usando Progresiva:')
disp(x)
disp(' ')

%% Verificacion de la solucion
% Calculamos L*x y comparamos con b

Lx = L * x;

disp('Verificacion: L*x debe ser igual a b')
disp('L*x =')
disp(Lx)
disp('b =')
disp(b)
disp(' ')

%% Calculo del residual
r = b - Lx;
norma_r = normap(r, 2);

fprintf('Norma del residual ||b - L*x||_2 = %.10e\n', norma_r)
disp(' ')

%% Ejemplo 2: Sistema triangular inferior 4x4
disp('=========================================')
disp('EJEMPLO 2: Sistema triangular inferior 4x4')
disp(' ')

L2 = [3, 0, 0, 0;
      1, 2, 0, 0;
      2, 1, 4, 0;
      1, 3, 2, 5];

b2 = [9; 7; 18; 30];

disp('Matriz triangular inferior L2:')
disp(L2)
disp('Vector b2:')
disp(b2)
disp(' ')

x2 = Progresiva(L2, b2);

disp('Solucion usando Progresiva:')
disp(x2)
disp(' ')

% Verificacion
r2 = b2 - L2*x2;
norma_r2 = normap(r2, 2);
fprintf('Norma del residual ||b2 - L2*x2||_2 = %.10e\n', norma_r2)

disp(' ')
disp('========== FIN EJERCICIO 5b ==========')
