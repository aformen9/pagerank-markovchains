### NO CORRER MAC ###

% Actividad 6 - Ejercicio 3a
% Resolver sistema 5x5 con metodo iterativo
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 3a')
disp('===========================')
disp(' ')

%% Definicion del sistema 5x5 con estructura de banda
% Sistema:
%  10x1 - x2 + x3 = 5
%  -x1 + 10x2 - x3 + x4 = 5
%   x1 - x2 + 10x3 - x4 + x5 = 5
%        x2 - x3 + 10x4 - x5 = 5
%             x3 - x4 + 10x5 = 5

A = [10, -1,  1,  0,  0;
     -1, 10, -1,  1,  0;
      1, -1, 10, -1,  1;
      0,  1, -1, 10, -1;
      0,  0,  1, -1, 10];

b = [5; 5; 5; 5; 5];

disp('Matriz A (estructura de banda):')
disp(A)
disp(' ')
disp('Vector b:')
disp(b)
disp(' ')

%% Verificacion de la estructura

disp('ESTRUCTURA DE LA MATRIZ:')
disp('Esta matriz tiene estructura de banda (tridiagonal ampliada)')
disp('Los elementos no nulos estan cerca de la diagonal principal')
disp(' ')

%% Verificar diagonal dominante

disp('Verificacion: diagonal dominante')
disp(' ')

for i = 1:size(A, 1)
    diagonal = abs(A(i, i));
    suma_resto = sum(abs(A(i, :))) - diagonal;

    fprintf('Fila %d: |a_%d%d| = %.1f, suma_resto = %.1f', i, i, i, diagonal, suma_resto);

    if diagonal > suma_resto
        fprintf(' => CUMPLE\n');
    else
        fprintf(' => NO CUMPLE\n');
    end
end

disp(' ')

if diagdom(A)
    disp('A es DIAGONALMENTE DOMINANTE')
    disp('=> Los metodos iterativos CONVERGEN')
else
    disp('A NO es diagonalmente dominante')
    disp('=> No se garantiza convergencia')
end

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Parametros del metodo iterativo

x0 = zeros(5, 1);
tol = 1e-9;
itmax = 100;

fprintf('Aproximacion inicial: x^(0) = [0; 0; 0; 0; 0]\n')
fprintf('Tolerancia: %.0e\n', tol)
fprintf('Iteraciones maximas: %d\n', itmax)
disp(' ')

%% Resolucion con Gauss-Seidel (mas rapido que Jacobi)

disp('=========================================')
disp('Resolviendo con metodo de GAUSS-SEIDEL')
disp('=========================================')
disp(' ')

x_gs = GaussSeidel(A, b, x0, tol, itmax);

disp(' ')
disp('Solucion con Gauss-Seidel (x):')
disp(x_gs)
disp(' ')

%% Verificacion de la solucion

r_gs = b - A*x_gs;

disp('Vector residual r = b - Ax:')
disp(r_gs)
disp(' ')

% Normas del residual
norma_1 = normap(r_gs, 1);
norma_2 = normap(r_gs, 2);
norma_inf = normap(r_gs, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)
disp(' ')

if norma_2 < 1e-8
    disp('La solucion es muy precisa')
else
    disp('Hay un error residual apreciable')
end

disp(' ')
disp('========== FIN EJERCICIO 3a ==========')


% Actividad 6 - Ejercicio 3b
% Resolver sistema 5x5 con metodo directo
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 3b')
disp('===========================')
disp(' ')

%% Definicion del sistema 5x5

A = [10, -1,  1,  0,  0;
     -1, 10, -1,  1,  0;
      1, -1, 10, -1,  1;
      0,  1, -1, 10, -1;
      0,  0,  1, -1, 10];

b = [5; 5; 5; 5; 5];

disp('Matriz A:')
disp(A)
disp(' ')
disp('Vector b:')
disp(b)
disp(' ')

%% Resolucion con metodo directo (Gauss)

disp('=========================================')
disp('Resolviendo con metodo directo (GAUSS)')
disp('=========================================')
disp(' ')

x_gauss = Gauss(A, b);

disp('Solucion con Gauss (x):')
disp(x_gauss)
disp(' ')

%% Verificacion de la solucion

r_gauss = b - A*x_gauss;

disp('Vector residual r = b - Ax:')
disp(r_gauss)
disp(' ')

% Normas del residual
norma_1 = normap(r_gauss, 1);
norma_2 = normap(r_gauss, 2);
norma_inf = normap(r_gauss, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)
disp(' ')

if norma_2 < 1e-10
    disp('La solucion es muy precisa')
else
    disp('Hay un error residual apreciable')
end

disp(' ')
disp('========== FIN EJERCICIO 3b ==========')


% Actividad 6 - Ejercicio 3c
% Verificar que ambas soluciones aproximan la solucion
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 3c')
disp('===========================')
disp(' ')

%% Definicion del sistema 5x5

A = [10, -1,  1,  0,  0;
     -1, 10, -1,  1,  0;
      1, -1, 10, -1,  1;
      0,  1, -1, 10, -1;
      0,  0,  1, -1, 10];

b = [5; 5; 5; 5; 5];

disp('Sistema 5x5 con estructura de banda')
disp(' ')

%% Solucion con metodo iterativo (Gauss-Seidel)

x0 = zeros(5, 1);
tol = 1e-9;
itmax = 100;

disp('Metodo iterativo: Gauss-Seidel')
x_iterativo = GaussSeidel(A, b, x0, tol, itmax);

disp(' ')
disp('Solucion iterativa (x_iterativo):')
disp(x_iterativo)
disp(' ')

%% Solucion con metodo directo (Gauss)

disp('Metodo directo: Gauss')
x_directo = Gauss(A, b);

disp(' ')
disp('Solucion directa (x_directo):')
disp(x_directo)
disp(' ')

%% Solucion exacta con backslash

x_exacto = A \ b;

disp('Solucion exacta (A\\b):')
disp(x_exacto)
disp(' ')

%% Comparacion de soluciones

disp('=========================================')
disp('COMPARACION DE SOLUCIONES')
disp('=========================================')
disp(' ')

% Error del metodo iterativo respecto a exacto
error_iterativo = normap(x_exacto - x_iterativo, 2);
fprintf('Error metodo iterativo: ||x_exacto - x_iterativo||_2 = %.10e\n', error_iterativo)

% Error del metodo directo respecto a exacto
error_directo = normap(x_exacto - x_directo, 2);
fprintf('Error metodo directo:   ||x_exacto - x_directo||_2   = %.10e\n', error_directo)

disp(' ')

% Diferencia entre ambas soluciones
diferencia = normap(x_iterativo - x_directo, 2);
fprintf('Diferencia entre metodos: ||x_iterativo - x_directo||_2 = %.10e\n', diferencia)

disp(' ')

%% Residuales

r_iterativo = b - A*x_iterativo;
r_directo = b - A*x_directo;

norma_r_iterativo = normap(r_iterativo, 2);
norma_r_directo = normap(r_directo, 2);

fprintf('Residual metodo iterativo: ||b - Ax_iterativo||_2 = %.10e\n', norma_r_iterativo)
fprintf('Residual metodo directo:   ||b - Ax_directo||_2   = %.10e\n', norma_r_directo)

disp(' ')

%% Conclusion

disp('=========================================')
disp('CONCLUSION')
disp('=========================================')
disp(' ')

if error_iterativo < 1e-8 && error_directo < 1e-8
    disp('VERIFICACION EXITOSA:')
    disp('Ambos metodos (iterativo y directo) aproximan')
    disp('correctamente la solucion del sistema.')
    disp(' ')
    disp('Los errores son despreciables y ambas soluciones')
    disp('son practicamente identicas.')
else
    disp('Hay diferencias apreciables en las soluciones')
end

disp(' ')
disp('========== FIN EJERCICIO 3c ==========')


% Actividad 6 - Ejercicio 3d
% Sistema 10x10 con estructura de banda
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 3d')
disp('===========================')
disp(' ')

%% Construccion del sistema 10x10 con estructura de banda
% Estructura similar al sistema 5x5:
% - Diagonal principal: 10
% - Diagonales adyacentes: -1, 1, etc.

n = 10;

% Crear diagonal principal con 10's
diagonal_principal = 10 * ones(n, 1);

% Crear diagonales secundarias
% Super-diagonal 1 (encima de la diagonal): -1
super_diag1 = -1 * ones(n-1, 1);

% Super-diagonal 2 (dos encima): 1
super_diag2 = 1 * ones(n-2, 1);

% Sub-diagonal 1 (debajo de la diagonal): -1
sub_diag1 = -1 * ones(n-1, 1);

% Sub-diagonal 2 (dos debajo): 1
sub_diag2 = 1 * ones(n-2, 1);

% Construir matriz usando diag
A = diag(diagonal_principal, 0) + ...
    diag(super_diag1, 1) + ...
    diag(super_diag2, 2) + ...
    diag(sub_diag1, -1) + ...
    diag(sub_diag2, -2);

% Vector b: todos 5's
b = 5 * ones(n, 1);

disp('Sistema 10x10 con estructura de banda construido')
disp(' ')
disp('Matriz A (primeras 5 filas y columnas):')
disp(A(1:5, 1:5))
disp('...')
disp(' ')

%% Verificar diagonal dominante

disp('Verificacion: diagonal dominante')

if diagdom(A)
    disp('A es DIAGONALMENTE DOMINANTE')
    disp('=> Los metodos iterativos CONVERGEN')
else
    disp('A NO es diagonalmente dominante')
end

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Inciso (a): Metodo iterativo

disp('INCISO (a): METODO ITERATIVO (Gauss-Seidel)')
disp(' ')

x0 = zeros(n, 1);
tol = 1e-9;
itmax = 200;

x_iterativo = GaussSeidel(A, b, x0, tol, itmax);

disp(' ')
disp('Solucion iterativa (x_iterativo):')
disp(x_iterativo)
disp(' ')

% Verificar
r_iterativo = b - A*x_iterativo;
norma_r_iterativo = normap(r_iterativo, 2);
fprintf('||residual||_2 = %.10e\n', norma_r_iterativo)

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Inciso (b): Metodo directo

disp('INCISO (b): METODO DIRECTO (Gauss)')
disp(' ')

x_directo = Gauss(A, b);

disp('Solucion directa (x_directo):')
disp(x_directo)
disp(' ')

% Verificar
r_directo = b - A*x_directo;
norma_r_directo = normap(r_directo, 2);
fprintf('||residual||_2 = %.10e\n', norma_r_directo)

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Inciso (c): Verificacion

disp('INCISO (c): VERIFICACION')
disp(' ')

% Solucion exacta
x_exacto = A \ b;

% Errores
error_iterativo = normap(x_exacto - x_iterativo, 2);
error_directo = normap(x_exacto - x_directo, 2);

fprintf('Error metodo iterativo: ||x_exacto - x_iterativo||_2 = %.10e\n', error_iterativo)
fprintf('Error metodo directo:   ||x_exacto - x_directo||_2   = %.10e\n', error_directo)
disp(' ')

diferencia = normap(x_iterativo - x_directo, 2);
fprintf('Diferencia entre metodos: ||x_iterativo - x_directo||_2 = %.10e\n', diferencia)

disp(' ')

%% Conclusion

disp('=========================================')
disp('CONCLUSION')
disp('=========================================')
disp(' ')

if error_iterativo < 1e-8 && error_directo < 1e-8
    disp('VERIFICACION EXITOSA:')
    disp('Para el sistema 10x10, ambos metodos aproximan')
    disp('correctamente la solucion.')
    disp(' ')
    disp('OBSERVACION:')
    disp('Las matrices con estructura de banda y diagonal')
    disp('dominante son ideales para metodos iterativos.')
else
    disp('Hay diferencias apreciables en las soluciones')
end

disp(' ')
disp('========== FIN EJERCICIO 3d ==========')
