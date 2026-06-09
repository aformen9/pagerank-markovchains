% Actividad 5 - Ejercicio 6 - Reconstruccion de matriz A
% Reconstruir la matriz A a partir de la factorizacion PA = LU
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 6')
disp('==========================')
disp('Reconstruccion de matriz A')
disp(' ')

%% Datos de la factorizacion PA = LU

% Matriz L (triangular inferior)
L = [1, 0, 0;
     0, 1, 0;
     1, -2, 1];

% Matriz U (triangular superior)
U = [2, 0, 1;
     0, 3, -1;
     0, 0, -2];

% Matriz de permutacion P
P = [0, 1, 0;
     1, 0, 0;
     0, 0, 1];

disp('Matriz L (triangular inferior):')
disp(L)
disp(' ')

disp('Matriz U (triangular superior):')
disp(U)
disp(' ')

disp('Matriz de permutacion P:')
disp(P)
disp(' ')

%% Reconstruccion de la matriz A
% De la factorizacion PA = LU, despejamos A:
% A = P^(-1) * L * U
% Como P es una matriz de permutacion, P^(-1) = P'

% Calculamos la inversa de P (que es su transpuesta)
P_inv = P';

% Reconstruimos A
A = P_inv * L * U;

disp('=========================================')
disp('MATRIZ A RECONSTRUIDA')
disp('=========================================')
disp(' ')
disp('A = P^(-1) * L * U =')
disp(A)
disp(' ')

%% Verificacion de la factorizacion
% Verificamos que PA = LU

PA = P * A;
LU = L * U;

disp('Verificacion de PA = LU:')
disp(' ')
disp('PA =')
disp(PA)
disp(' ')
disp('LU =')
disp(LU)
disp(' ')

% Calculamos el error usando norm para matrices (no normap)
diferencia = PA - LU;
error_factorizacion = norm(diferencia, 2);

fprintf('Error ||PA - LU||_2 = %.10e\n', error_factorizacion)

if error_factorizacion < 1e-10
    disp('VERIFICACION EXITOSA: PA = LU')
else
    disp('ERROR: PA no es igual a LU')
end

disp(' ')
disp('========== FIN RECONSTRUCCION ==========')


% Actividad 5 - Ejercicio 6a
% Resolver sistema Ax = b por metodo de Gauss
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 6a')
disp('===========================')
disp(' ')

%% Reconstruccion de matriz A a partir de PA = LU

% Matrices de la factorizacion
L = [1, 0, 0;
     0, 1, 0;
     1, -2, 1];

U = [2, 0, 1;
     0, 3, -1;
     0, 0, -2];

P = [0, 1, 0;
     1, 0, 0;
     0, 0, 1];

% Reconstruimos A = P^(-1) * L * U
A = P' * L * U;

% Vector lado derecho
b = [-0.2; 2.5; 1.9];

disp('Matriz de coeficientes A:')
disp(A)
disp(' ')
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Resolucion con metodo de Gauss con pivoteo parcial escalado

disp('Resolviendo con metodo de Gauss...')
disp(' ')

x_gauss = Gauss(A, b);

disp('Solucion con Gauss (x):')
disp(x_gauss)
disp(' ')

%% Verificacion de la solucion
% Calculamos el residual r = b - Ax

r = b - A*x_gauss;

disp('Vector residual r = b - Ax:')
disp(r)
disp(' ')

% Calculamos normas del residual
norma_1 = normap(r, 1);
norma_2 = normap(r, 2);
norma_inf = normap(r, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)

disp(' ')
disp('========== FIN EJERCICIO 6a ==========')


% Actividad 5 - Ejercicio 6b
% Resolver sistema por factorizacion LU incompleta
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 6b')
disp('===========================')
disp(' ')

%% Datos de la factorizacion PA = LU

% Matrices de la factorizacion
L = [1, 0, 0;
     0, 1, 0;
     1, -2, 1];

U = [2, 0, 1;
     0, 3, -1;
     0, 0, -2];

P = [0, 1, 0;
     1, 0, 0;
     0, 0, 1];

% Vector lado derecho
b = [-0.2; 2.5; 1.9];

disp('Metodo: Factorizacion LU incompleta')
disp(' ')
disp('Matriz L:')
disp(L)
disp('Matriz U:')
disp(U)
disp('Matriz P:')
disp(P)
disp('Vector b:')
disp(b)
disp(' ')

%% Resolucion usando factorizacion LU
% Para resolver Ax = b usando PA = LU:
% 1) PAx = Pb
% 2) LUx = Pb
% 3) Ly = Pb (resolvemos para y con sustitucion progresiva)
% 4) Ux = y (resolvemos para x con sustitucion regresiva)

% Paso 1: Calculamos Pb
Pb = P * b;

disp('Paso 1: Calcular Pb')
disp('Pb =')
disp(Pb)
disp(' ')

% Paso 2: Resolvemos Ly = Pb usando sustitucion progresiva
disp('Paso 2: Resolver Ly = Pb con sustitucion progresiva')

y = Progresiva(L, Pb);

disp('Solucion y:')
disp(y)
disp(' ')

% Paso 3: Resolvemos Ux = y usando sustitucion regresiva
disp('Paso 3: Resolver Ux = y con sustitucion regresiva')

x_lu = Regresiva(U, y);

disp('Solucion final x:')
disp(x_lu)
disp(' ')

%% Verificacion de la solucion
% Reconstruimos A y verificamos que Ax = b

A = P' * L * U;
r = b - A*x_lu;

disp('Verificacion: Vector residual r = b - Ax:')
disp(r)
disp(' ')

% Calculamos normas del residual
norma_1 = normap(r, 1);
norma_2 = normap(r, 2);
norma_inf = normap(r, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)

disp(' ')
disp('========== FIN EJERCICIO 6b ==========')


% Actividad 5 - Ejercicio 6c
% Comparar soluciones con solucion exacta y analizar errores
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 6c')
disp('===========================')
disp(' ')

%% Reconstruccion de matriz A

% Matrices de la factorizacion
L = [1, 0, 0;
     0, 1, 0;
     1, -2, 1];

U = [2, 0, 1;
     0, 3, -1;
     0, 0, -2];

P = [0, 1, 0;
     1, 0, 0;
     0, 0, 1];

% Reconstruimos A
A = P' * L * U;

% Vector lado derecho
b = [-0.2; 2.5; 1.9];

disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Solucion exacta usando operador backslash (mldivide)
% El operador \ usa metodos numericos muy precisos

disp('Calculando solucion exacta con A\\b...')
x_exacto = A \ b;

disp('Solucion exacta (x_exacto):')
disp(x_exacto)
disp(' ')

%% Solucion con metodo de Gauss

x_gauss = Gauss(A, b);

disp('Solucion con Gauss (x_gauss):')
disp(x_gauss)
disp(' ')

%% Solucion con factorizacion LU

% Resolvemos Ly = Pb y luego Ux = y
Pb = P * b;
y = Progresiva(L, Pb);
x_lu = Regresiva(U, y);

disp('Solucion con LU (x_lu):')
disp(x_lu)
disp(' ')

%% Comparacion de errores respecto a la solucion exacta

disp('=========================================')
disp('ANALISIS DE ERRORES DE REDONDEO')
disp('=========================================')
disp(' ')

% Error de Gauss
error_gauss = normap(x_exacto - x_gauss, 2);
fprintf('Error Gauss:  ||x_exacto - x_gauss||_2 = %.10e\n', error_gauss)

% Error de LU
error_lu = normap(x_exacto - x_lu, 2);
fprintf('Error LU:     ||x_exacto - x_lu||_2    = %.10e\n', error_lu)

disp(' ')

%% Interpretacion de errores

if error_gauss < 1e-10 && error_lu < 1e-10
    disp('CONCLUSION:')
    disp('Ambos metodos (Gauss y LU) producen soluciones muy')
    disp('cercanas a la solucion exacta.')
    disp('Los errores de redondeo son despreciables.')
elseif error_gauss < error_lu
    disp('CONCLUSION:')
    disp('El metodo de Gauss produjo un error menor que LU.')
    fprintf('Gauss es %.2f veces mas preciso.\n', error_lu/error_gauss)
else
    disp('CONCLUSION:')
    disp('El metodo LU produjo un error menor que Gauss.')
    fprintf('LU es %.2f veces mas preciso.\n', error_gauss/error_lu)
end

disp(' ')

%% Tabla comparativa de soluciones

disp('TABLA COMPARATIVA:')
disp('------------------------------------------------------------')
fprintf('%-15s %-15s %-15s %-15s\n', 'Componente', 'x_exacto', 'x_gauss', 'x_lu')
disp('------------------------------------------------------------')
for i = 1:length(x_exacto)
    fprintf('x(%d)            %.10f  %.10f  %.10f\n', i, x_exacto(i), x_gauss(i), x_lu(i))
end
disp('------------------------------------------------------------')

disp(' ')
disp('========== FIN EJERCICIO 6c ==========')
