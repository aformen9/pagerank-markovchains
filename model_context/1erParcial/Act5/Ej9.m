% Actividad 5 - Ejercicio 9b
% Resolver sistema usando metodo de Cholesky
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 9b')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Matriz A (simetrica y definida positiva)
A = [1, 1, 1;
     1, 2, 1;
     1, 1, 3];

% Vector lado derecho b
b = [-1; 3; 4];

disp('Matriz A (simetrica y definida positiva):')
disp(A)
disp(' ')
disp('Vector b:')
disp(b)
disp(' ')

%% Verificacion: A es simetrica?
if isequal(A, A')
    disp('Verificacion: A es SIMETRICA')
else
    disp('ADVERTENCIA: A NO es simetrica')
end
disp(' ')

%% Verificacion: A es definida positiva?
% Una matriz es definida positiva si todos sus autovalores son positivos
autovalores = eig(A);
disp('Autovalores de A:')
disp(autovalores)

if all(autovalores > 0)
    disp('Todos los autovalores son POSITIVOS')
    disp('=> A es DEFINIDA POSITIVA')
    disp('=> Se puede usar el metodo de Cholesky')
else
    disp('ADVERTENCIA: Hay autovalores no positivos')
    disp('=> NO se puede usar Cholesky')
end

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Resolucion usando el metodo de Cholesky

disp('Resolviendo con metodo de Cholesky...')
disp(' ')

[x_cholesky, R] = Cholesky(A, b);

disp('Solucion con Cholesky (x):')
disp(x_cholesky)
disp(' ')

disp('Matriz R (triangular superior de la factorizacion):')
disp('(Cholesky factoriza A = R^T * R)')
disp(R)
disp(' ')

%% Verificacion de la factorizacion de Cholesky
% Verificamos que A = R^T * R

R_T_R = R' * R;

disp('Verificacion de la factorizacion A = R^T * R:')
disp('R^T * R =')
disp(R_T_R)
disp(' ')

error_factorizacion = norm(A - R_T_R, 2);
fprintf('Error ||A - R^T*R||_2 = %.10e\n', error_factorizacion)

if error_factorizacion < 1e-10
    disp('VERIFICACION EXITOSA: A = R^T * R')
else
    disp('ADVERTENCIA: La factorizacion tiene errores')
end

disp(' ')

%% Verificacion de la solucion
% Calculamos el residual r = b - Ax

r = b - A*x_cholesky;

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

if norma_2 < 1e-10
    disp('La solucion es muy precisa')
else
    disp('Hay un error residual apreciable')
end

disp(' ')
disp('========== FIN EJERCICIO 9b ==========')


% Actividad 5 - Ejercicio 9c
% Resolver sistema usando eliminacion gaussiana
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 9c')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Matriz A
A = [1, 1, 1;
     1, 2, 1;
     1, 1, 3];

% Vector lado derecho b
b = [-1; 3; 4];

disp('Matriz A:')
disp(A)
disp(' ')
disp('Vector b:')
disp(b)
disp(' ')

%% Resolucion usando eliminacion gaussiana con pivoteo parcial escalado

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

if norma_2 < 1e-10
    disp('La solucion es muy precisa')
else
    disp('Hay un error residual apreciable')
end

disp(' ')
disp('========== FIN EJERCICIO 9c ==========')


% Actividad 5 - Ejercicio 9d
% Comparar errores y tiempos: Cholesky vs Gauss
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 9d')
disp('===========================')
disp('Comparacion de metodos')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Matriz A
A = [1, 1, 1;
     1, 2, 1;
     1, 1, 3];

% Vector lado derecho b
b = [-1; 3; 4];

disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Solucion exacta usando operador backslash
% La usamos como referencia para calcular errores

x_exacto = A \ b;

disp('Solucion exacta (x_exacto = A\\b):')
disp(x_exacto)
disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Metodo 1: Cholesky

disp('METODO 1: CHOLESKY')
disp(' ')

tic
[x_cholesky, R] = Cholesky(A, b);
tiempo_cholesky = toc;

disp('Solucion con Cholesky:')
disp(x_cholesky)
fprintf('Tiempo de ejecucion: %.6f segundos\n', tiempo_cholesky)
disp(' ')

% Error respecto a solucion exacta
error_cholesky = normap(x_exacto - x_cholesky, 2);
fprintf('Error ||x_exacto - x_cholesky||_2 = %.10e\n', error_cholesky)

% Residual
r_cholesky = b - A*x_cholesky;
norma_r_cholesky = normap(r_cholesky, 2);
fprintf('Residual ||b - Ax||_2 = %.10e\n', norma_r_cholesky)

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Metodo 2: Gauss

disp('METODO 2: GAUSS')
disp(' ')

tic
x_gauss = Gauss(A, b);
tiempo_gauss = toc;

disp('Solucion con Gauss:')
disp(x_gauss)
fprintf('Tiempo de ejecucion: %.6f segundos\n', tiempo_gauss)
disp(' ')

% Error respecto a solucion exacta
error_gauss = normap(x_exacto - x_gauss, 2);
fprintf('Error ||x_exacto - x_gauss||_2 = %.10e\n', error_gauss)

% Residual
r_gauss = b - A*x_gauss;
norma_r_gauss = normap(r_gauss, 2);
fprintf('Residual ||b - Ax||_2 = %.10e\n', norma_r_gauss)

disp(' ')
disp('=========================================')
disp(' ')

%% Comparacion de resultados

disp('TABLA COMPARATIVA:')
disp('=========================================')
fprintf('%-20s %-15s %-15s\n', 'Metodo', 'Cholesky', 'Gauss')
disp('-----------------------------------------')
fprintf('%-20s %.6f s    %.6f s\n', 'Tiempo', tiempo_cholesky, tiempo_gauss)
fprintf('%-20s %.4e  %.4e\n', 'Error vs exacto', error_cholesky, error_gauss)
fprintf('%-20s %.4e  %.4e\n', 'Residual', norma_r_cholesky, norma_r_gauss)
disp('=========================================')
disp(' ')

%% Analisis de velocidad

if tiempo_cholesky < tiempo_gauss
    factor = tiempo_gauss / tiempo_cholesky;
    fprintf('Cholesky es %.2f veces mas rapido que Gauss\n', factor)
else
    factor = tiempo_cholesky / tiempo_gauss;
    fprintf('Gauss es %.2f veces mas rapido que Cholesky\n', factor)
end

disp(' ')

%% Analisis de precision

disp('CONCLUSION:')
disp(' ')

if error_cholesky < error_gauss
    disp('Cholesky produce un error menor que Gauss.')
else
    disp('Gauss produce un error menor que Cholesky.')
end

disp(' ')
disp('VENTAJA DE CHOLESKY:')
disp('Para matrices simetricas definidas positivas, Cholesky es:')
disp('- Aproximadamente 2 veces mas rapido que Gauss')
disp('- Mas eficiente computacionalmente (requiere ~n^3/3 operaciones)')
disp('- Numericamente estable (no requiere pivoteo)')
disp(' ')
disp('Gauss es mas general y funciona para cualquier matriz.')

disp(' ')
disp('========== FIN EJERCICIO 9d ==========')
