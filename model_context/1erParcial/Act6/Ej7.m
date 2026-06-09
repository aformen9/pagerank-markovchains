% Actividad 6 - Ejercicio 7a
% Modificar SOR para usar criterio de Jacobi/GaussSeidel
% Comparar con el ejemplo de la Lectura 7
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 7a - ACTIVIDAD 6')
disp('SOR con Criterio de Jacobi/GaussSeidel')
disp('========================================')
disp(' ')

%% Ejemplo de la Lectura 7
A = [4 -1 1; 4 -8 1; -2 1 5];
b = [7; -21; 15];
x0 = [1; 2; 2];
tol = 1e-4;
itmax = 30;
omega = 1.05;

disp('Sistema de Ecuaciones (Ejemplo Lectura 7):')
disp('A =')
disp(A)
disp('b =')
disp(b)
disp(' ')
fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('tol = %.0e\n', tol)
fprintf('omega = %.2f\n', omega)
disp(' ')

%% SOR Original (criterio: residuo relativo)
disp('---------- SOR ORIGINAL (residuo relativo) ----------')
[x_orig, iter_orig, resrel_orig] = SOR(A, b, x0, omega, tol, itmax);

fprintf('Iteraciones: %d\n', iter_orig)
fprintf('Residuo relativo final: %.6e\n', resrel_orig)
disp('Solucion aproximada:')
disp(x_orig)
disp(' ')

%% SOR Modificado (criterio: diferencia entre iteraciones)
disp('---------- SOR MODIFICADO (diferencia iteraciones) ----------')
[x_mod, iter_mod, diff_mod] = SOR_diff(A, b, x0, omega, tol, itmax);

fprintf('Iteraciones: %d\n', iter_mod)
fprintf('Diferencia final ||x^(k) - x^(k-1)||: %.6e\n', diff_mod)
disp('Solucion aproximada:')
disp(x_mod)
disp(' ')

%% Calculo residuo relativo de la version modificada
resrel_mod = normap(b - A*x_mod, 2) / normap(b, 2);
fprintf('Residuo relativo de SOR modificado: %.6e\n', resrel_mod)
disp(' ')

%% Comparacion
disp('========== COMPARACION ==========')
fprintf('SOR Original:    %d iteraciones, resrel = %.6e\n', iter_orig, resrel_orig)
fprintf('SOR Modificado:  %d iteraciones, resrel = %.6e\n', iter_mod, resrel_mod)
disp(' ')

if iter_orig == iter_mod
    disp('Ambos metodos convergieron en el mismo numero de iteraciones.')
else
    disp('Los metodos convergieron en diferente numero de iteraciones.')
    if iter_orig < iter_mod
        fprintf('SOR original fue %d iteraciones mas rapido.\n', iter_mod - iter_orig)
    else
        fprintf('SOR modificado fue %d iteraciones mas rapido.\n', iter_orig - iter_mod)
    end
end
disp(' ')

disp('OBSERVACION:')
disp('El criterio de parada por residuo relativo ||b-Ax||/||b|| < tol')
disp('es generalmente mas costoso que ||x^(k)-x^(k-1)|| < tol porque')
disp('requiere calcular el producto matricial A*x en cada iteracion.')
disp(' ')

disp('========== FIN EJERCICIO 7a ==========')


% Actividad 6 - Ejercicio 7b
% Implementar residuo relativo en todos los metodos iterativos
% Comparar Jacobi, Gauss-Seidel y SOR con criterio de residuo relativo
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 7b - ACTIVIDAD 6')
disp('Residuo Relativo en Metodos Iterativos')
disp('========================================')
disp(' ')

%% Sistema de prueba
A = [4 -1 1; 4 -8 1; -2 1 5];
b = [7; -21; 15];
x0 = [1; 2; 2];
tol = 1e-6;
itmax = 1000;

disp('Sistema de Ecuaciones:')
disp('A =')
disp(A)
disp('b =')
disp(b)
disp(' ')
fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('tol = %.0e\n', tol)
disp(' ')

%% Jacobi con residuo relativo
disp('---------- JACOBI (residuo relativo) ----------')
[x_jacobi, iter_jacobi, resrel_jacobi] = Jacobi_resrel(A, b, x0, tol, itmax);

fprintf('Iteraciones: %d\n', iter_jacobi)
fprintf('Residuo relativo final: %.10e\n', resrel_jacobi)
disp('Solucion aproximada:')
disp(x_jacobi)
disp(' ')

%% Gauss-Seidel con residuo relativo
disp('---------- GAUSS-SEIDEL (residuo relativo) ----------')
[x_gs, iter_gs, resrel_gs] = GaussSeidel_resrel(A, b, x0, tol, itmax);

fprintf('Iteraciones: %d\n', iter_gs)
fprintf('Residuo relativo final: %.10e\n', resrel_gs)
disp('Solucion aproximada:')
disp(x_gs)
disp(' ')

%% SOR con residuo relativo (ya lo tiene por defecto)
omega = 1.1;
disp('---------- SOR (residuo relativo) ----------')
fprintf('Parametro omega = %.2f\n', omega)
[x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

fprintf('Iteraciones: %d\n', iter_sor)
fprintf('Residuo relativo final: %.10e\n', resrel_sor)
disp('Solucion aproximada:')
disp(x_sor)
disp(' ')

%% Tabla comparativa
disp('========== TABLA COMPARATIVA ==========')
disp(' ')
fprintf('%-15s | %-12s | %-15s\n', 'Metodo', 'Iteraciones', 'Residuo Relativo')
fprintf('--------------------------------------------------\n')
fprintf('%-15s | %12d | %15.6e\n', 'Jacobi', iter_jacobi, resrel_jacobi)
fprintf('%-15s | %12d | %15.6e\n', 'Gauss-Seidel', iter_gs, resrel_gs)
fprintf('%-15s | %12d | %15.6e\n', 'SOR (w=1.1)', iter_sor, resrel_sor)
disp(' ')

%% Analisis
disp('ANALISIS:')
disp(' ')
disp('1. CONVERGENCIA:')
fprintf('   - Gauss-Seidel convergio en %d iteraciones\n', iter_gs)
fprintf('   - Jacobi convergio en %d iteraciones\n', iter_jacobi)
fprintf('   - SOR convergio en %d iteraciones\n', iter_sor)
disp(' ')

disp('2. EFICIENCIA:')
if iter_sor < iter_gs && iter_sor < iter_jacobi
    disp('   - SOR es el metodo MAS RAPIDO (menos iteraciones)')
elseif iter_gs < iter_jacobi && iter_gs < iter_sor
    disp('   - Gauss-Seidel es el metodo MAS RAPIDO (menos iteraciones)')
else
    disp('   - Jacobi es el metodo MAS RAPIDO (menos iteraciones)')
end
disp(' ')

disp('3. RESIDUO RELATIVO:')
disp('   El criterio ||b - Ax^(k)||_2 / ||b|| < tol permite controlar')
disp('   directamente la calidad de la aproximacion en terminos del')
disp('   sistema original, pero es computacionalmente mas costoso.')
disp(' ')

disp('========== FIN EJERCICIO 7b ==========')
