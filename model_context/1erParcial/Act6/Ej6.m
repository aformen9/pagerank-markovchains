% Actividad 6 - Ejercicio 6c
% Comparacion de tiempos computacionales
% Comparar metodos originales vs metodos con criterio de parada por residual
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 6c - ACTIVIDAD 6')
disp('Comparacion de Tiempos Computacionales')
disp('========================================')
disp(' ')

%% Sistema del Ejercicio 1 de la Actividad 6
% Sistema: 3x1 - x2 + x3 = 1
%          3x1 + 6x2 + 2x3 = 0
%          3x1 + 3x2 + 7x3 = 4

A = [3 -1 1; 3 6 2; 3 3 7];
b = [1; 0; 4];

disp('Sistema de Ecuaciones Lineales:')
disp('A =')
disp(A)
disp('b =')
disp(b)
disp(' ')

% Parametros
x0 = zeros(3, 1);
tol = 1e-6;
itmax = 1000;

disp('Parametros:')
fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('tol = %.0e\n', tol)
fprintf('itmax = %d\n', itmax)
disp(' ')
disp('==================================================')
disp(' ')

%% Metodo de Jacobi - Version Original
disp('---------- JACOBI ORIGINAL (criterio: ||x^(k) - x^(k-1)|| < tol) ----------')
tic
x_jacobi_orig = Jacobi(A, b, x0, tol, itmax);
tiempo_jacobi_orig = toc;

fprintf('Tiempo de ejecucion: %.6f segundos\n', tiempo_jacobi_orig)
disp('Solucion aproximada:')
disp(x_jacobi_orig)
disp(' ')

%% Metodo de Jacobi - Version con Residual
disp('---------- JACOBI RESIDUAL (criterio: ||b - Ax^(k)|| < tol) ----------')
tic
x_jacobi_res = Jacobi_residual(A, b, x0, tol, itmax);
tiempo_jacobi_res = toc;

fprintf('Tiempo de ejecucion: %.6f segundos\n', tiempo_jacobi_res)
disp('Solucion aproximada:')
disp(x_jacobi_res)
disp(' ')

%% Comparacion Jacobi
disp('--- COMPARACION JACOBI ---')
fprintf('Tiempo Jacobi Original:  %.6f segundos\n', tiempo_jacobi_orig)
fprintf('Tiempo Jacobi Residual:  %.6f segundos\n', tiempo_jacobi_res)
fprintf('Diferencia de tiempo:    %.6f segundos\n', abs(tiempo_jacobi_res - tiempo_jacobi_orig))

if tiempo_jacobi_res > tiempo_jacobi_orig
    porcentaje = ((tiempo_jacobi_res - tiempo_jacobi_orig) / tiempo_jacobi_orig) * 100;
    fprintf('El metodo con residual es %.2f%% mas lento\n', porcentaje)
else
    porcentaje = ((tiempo_jacobi_orig - tiempo_jacobi_res) / tiempo_jacobi_orig) * 100;
    fprintf('El metodo con residual es %.2f%% mas rapido\n', porcentaje)
end
disp(' ')
disp('==================================================')
disp(' ')

%% Metodo de Gauss-Seidel - Version Original
disp('---------- GAUSS-SEIDEL ORIGINAL (criterio: ||x^(k) - x^(k-1)|| < tol) ----------')
tic
x_gs_orig = GaussSeidel(A, b, x0, tol, itmax);
tiempo_gs_orig = toc;

fprintf('Tiempo de ejecucion: %.6f segundos\n', tiempo_gs_orig)
disp('Solucion aproximada:')
disp(x_gs_orig)
disp(' ')

%% Metodo de Gauss-Seidel - Version con Residual
disp('---------- GAUSS-SEIDEL RESIDUAL (criterio: ||b - Ax^(k)|| < tol) ----------')
tic
x_gs_res = GaussSeidel_residual(A, b, x0, tol, itmax);
tiempo_gs_res = toc;

fprintf('Tiempo de ejecucion: %.6f segundos\n', tiempo_gs_res)
disp('Solucion aproximada:')
disp(x_gs_res)
disp(' ')

%% Comparacion Gauss-Seidel
disp('--- COMPARACION GAUSS-SEIDEL ---')
fprintf('Tiempo G-S Original:  %.6f segundos\n', tiempo_gs_orig)
fprintf('Tiempo G-S Residual:  %.6f segundos\n', tiempo_gs_res)
fprintf('Diferencia de tiempo: %.6f segundos\n', abs(tiempo_gs_res - tiempo_gs_orig))

if tiempo_gs_res > tiempo_gs_orig
    porcentaje = ((tiempo_gs_res - tiempo_gs_orig) / tiempo_gs_orig) * 100;
    fprintf('El metodo con residual es %.2f%% mas lento\n', porcentaje)
else
    porcentaje = ((tiempo_gs_orig - tiempo_gs_res) / tiempo_gs_orig) * 100;
    fprintf('El metodo con residual es %.2f%% mas rapido\n', porcentaje)
end
disp(' ')
disp('==================================================')
disp(' ')

%% Analisis General
disp('ANALISIS DE RESULTADOS')
disp('======================')
disp(' ')
disp('OBSERVACION IMPORTANTE:')
disp('El criterio de parada por residual ||b - Ax^(k)|| < tol es MAS COSTOSO')
disp('computacionalmente que el criterio original ||x^(k) - x^(k-1)|| < tol')
disp(' ')
disp('RAZON:')
disp('- El criterio por residual requiere calcular el producto matricial A*x^(k)')
disp('  en CADA iteracion, lo cual tiene un costo de O(n^2) operaciones.')
disp('- El criterio original solo requiere calcular ||x^(k) - x^(k-1)||, que')
disp('  tiene un costo de O(n) operaciones.')
disp(' ')
disp('CONCLUSION:')
disp('Aunque el criterio por residual puede ser mas preciso en algunos casos,')
disp('el costo computacional adicional hace que sea menos eficiente.')
disp(' ')

disp('========== FIN EJERCICIO 6c ==========')
