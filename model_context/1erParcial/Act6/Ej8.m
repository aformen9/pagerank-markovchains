% Actividad 6 - Ejercicio 8a
% Metodo SOR con omega = 1.1
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 8a - ACTIVIDAD 6')
disp('Metodo SOR con omega = 1.1')
disp('========================================')
disp(' ')

%% Datos del sistema
A = [1 1 1; 1 2 1; 1 1 3];
b = [-1; 5; 7];
x_exacto = [-11; 6; 4];

disp('Sistema de Ecuaciones:')
disp('A =')
disp(A)
disp('b =')
disp(b)
disp('Solucion exacta:')
disp(x_exacto)
disp(' ')

%% Parametros
x0 = zeros(3, 1);
omega = 1.1;
tol = 1e-9;
itmax = 1000;

fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('omega = %.1f\n', omega)
fprintf('tol = %.0e\n', tol)
fprintf('itmax = %d\n', itmax)
disp(' ')

%% Aplicar SOR
disp('Resolviendo con SOR...')
[x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

fprintf('Iteraciones: %d\n', iter_sor)
fprintf('Residuo relativo: %.10e\n', resrel_sor)
disp(' ')

disp('Solucion aproximada:')
disp(x_sor)
disp(' ')

%% Calcular error
error = x_exacto - x_sor;
norma_error = normap(error, 2);

disp('Error e = x_exacto - x_aproximado:')
disp(error)
fprintf('||error||_2 = %.10e\n', norma_error)
disp(' ')

%% Verificacion
residual = b - A * x_sor;
disp('Verificacion: residual r = b - A*x_aproximado:')
disp(residual)
fprintf('||residual||_2 = %.10e\n', normap(residual, 2))
disp(' ')

disp('========== FIN EJERCICIO 8a ==========')


% Actividad 6 - Ejercicio 8b
% Metodo SOR con omega = 1.2
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 8b - ACTIVIDAD 6')
disp('Metodo SOR con omega = 1.2')
disp('========================================')
disp(' ')

%% Datos del sistema
A = [1 1 1; 1 2 1; 1 1 3];
b = [-1; 5; 7];
x_exacto = [-11; 6; 4];

disp('Sistema de Ecuaciones:')
disp('A =')
disp(A)
disp('b =')
disp(b)
disp('Solucion exacta:')
disp(x_exacto)
disp(' ')

%% Parametros
x0 = zeros(3, 1);
omega = 1.2;
tol = 1e-9;
itmax = 1000;

fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('omega = %.1f\n', omega)
fprintf('tol = %.0e\n', tol)
fprintf('itmax = %d\n', itmax)
disp(' ')

%% Aplicar SOR
disp('Resolviendo con SOR...')
[x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

fprintf('Iteraciones: %d\n', iter_sor)
fprintf('Residuo relativo: %.10e\n', resrel_sor)
disp(' ')

disp('Solucion aproximada:')
disp(x_sor)
disp(' ')

%% Calcular error
error = x_exacto - x_sor;
norma_error = normap(error, 2);

disp('Error e = x_exacto - x_aproximado:')
disp(error)
fprintf('||error||_2 = %.10e\n', norma_error)
disp(' ')

%% Verificacion
residual = b - A * x_sor;
disp('Verificacion: residual r = b - A*x_aproximado:')
disp(residual)
fprintf('||residual||_2 = %.10e\n', normap(residual, 2))
disp(' ')

disp('========== FIN EJERCICIO 8b ==========')


% Actividad 6 - Ejercicio 8c
% Comparacion de Jacobi, Gauss-Seidel y SOR
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 8c - ACTIVIDAD 6')
disp('Comparacion de Metodos Iterativos')
disp('========================================')
disp(' ')

%% Datos del sistema
A = [1 1 1; 1 2 1; 1 1 3];
b = [-1; 5; 7];
x_exacto = [-11; 6; 4];

disp('Sistema de Ecuaciones:')
disp('A =')
disp(A)
disp('b =')
disp(b)
disp('Solucion exacta:')
disp(x_exacto)
disp(' ')

%% Parametros comunes
x0 = zeros(3, 1);
tol = 1e-9;
itmax = 1000;

fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('tol = %.0e\n', tol)
fprintf('itmax = %d\n', itmax)
disp(' ')

%% Jacobi
disp('---------- METODO DE JACOBI ----------')
x_jacobi = Jacobi(A, b, x0, tol, itmax);
disp(' ')
disp('Solucion aproximada:')
disp(x_jacobi)

% Calculo residuo relativo
residual_jacobi = b - A * x_jacobi;
resrel_jacobi = normap(residual_jacobi, 2) / normap(b, 2);
fprintf('Residuo relativo: %.10e\n', resrel_jacobi)

% Calculo error
error_jacobi = x_exacto - x_jacobi;
norma_error_jacobi = normap(error_jacobi, 2);
fprintf('||error||_2 = %.10e\n', norma_error_jacobi)
disp(' ')

%% Gauss-Seidel
disp('---------- METODO DE GAUSS-SEIDEL ----------')
x_gs = GaussSeidel(A, b, x0, tol, itmax);
disp(' ')
disp('Solucion aproximada:')
disp(x_gs)

% Calculo residuo relativo
residual_gs = b - A * x_gs;
resrel_gs = normap(residual_gs, 2) / normap(b, 2);
fprintf('Residuo relativo: %.10e\n', resrel_gs)

% Calculo error
error_gs = x_exacto - x_gs;
norma_error_gs = normap(error_gs, 2);
fprintf('||error||_2 = %.10e\n', norma_error_gs)
disp(' ')

%% SOR con omega = 1.1
omega_1 = 1.1;
disp('---------- METODO SOR (omega = 1.1) ----------')
[x_sor1, iter_sor1, resrel_sor1] = SOR(A, b, x0, omega_1, tol, itmax);
fprintf('Iteraciones: %d\n', iter_sor1)
disp('Solucion aproximada:')
disp(x_sor1)
fprintf('Residuo relativo: %.10e\n', resrel_sor1)

% Calculo error
error_sor1 = x_exacto - x_sor1;
norma_error_sor1 = normap(error_sor1, 2);
fprintf('||error||_2 = %.10e\n', norma_error_sor1)
disp(' ')

%% SOR con omega = 1.2
omega_2 = 1.2;
disp('---------- METODO SOR (omega = 1.2) ----------')
[x_sor2, iter_sor2, resrel_sor2] = SOR(A, b, x0, omega_2, tol, itmax);
fprintf('Iteraciones: %d\n', iter_sor2)
disp('Solucion aproximada:')
disp(x_sor2)
fprintf('Residuo relativo: %.10e\n', resrel_sor2)

% Calculo error
error_sor2 = x_exacto - x_sor2;
norma_error_sor2 = normap(error_sor2, 2);
fprintf('||error||_2 = %.10e\n', norma_error_sor2)
disp(' ')

%% Tabla comparativa
disp('========== TABLA COMPARATIVA ==========')
disp(' ')
fprintf('%-18s | %-15s | %-15s\n', 'Metodo', 'Residuo Relativo', 'Error ||e||_2')
fprintf('-------------------------------------------------------\n')
fprintf('%-18s | %15.6e | %15.6e\n', 'Jacobi', resrel_jacobi, norma_error_jacobi)
fprintf('%-18s | %15.6e | %15.6e\n', 'Gauss-Seidel', resrel_gs, norma_error_gs)
fprintf('%-18s | %15.6e | %15.6e\n', 'SOR (omega=1.1)', resrel_sor1, norma_error_sor1)
fprintf('%-18s | %15.6e | %15.6e\n', 'SOR (omega=1.2)', resrel_sor2, norma_error_sor2)
disp(' ')

%% Analisis de resultados
disp('ANALISIS DE RESULTADOS:')
disp(' ')

% Buscar el metodo con menor residuo relativo
metodos = {'Jacobi', 'Gauss-Seidel', 'SOR (omega=1.1)', 'SOR (omega=1.2)'};
resrels = [resrel_jacobi, resrel_gs, resrel_sor1, resrel_sor2];
errores = [norma_error_jacobi, norma_error_gs, norma_error_sor1, norma_error_sor2];

[min_resrel, idx_resrel] = min(resrels);
[min_error, idx_error] = min(errores);

fprintf('Menor residuo relativo: %s (%.6e)\n', metodos{idx_resrel}, min_resrel)
fprintf('Menor error: %s (%.6e)\n', metodos{idx_error}, min_error)
disp(' ')

disp('OBSERVACIONES:')
disp('- SOR con omega bien elegido converge mas rapido que Jacobi y Gauss-Seidel')
disp('- El residuo relativo y el error estan relacionados pero no son iguales')
disp('- Un residuo relativo pequeno indica una buena aproximacion')
disp(' ')

disp('========== FIN EJERCICIO 8c ==========')
