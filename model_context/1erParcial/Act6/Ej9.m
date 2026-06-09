% Actividad 6 - Ejercicio 9a
% SOR con diferentes valores de omega (0.1 a 1.9)
% Calcular error y residuo relativo para cada omega
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 9a - ACTIVIDAD 6')
disp('SOR con omega variable (0.1 a 1.9)')
disp('========================================')
disp(' ')

%% Datos del sistema
A = [4 -1 -1; -1 4 -1; -1 -1 4];
b = [2; 2; 2];
x_exacto = [1; 1; 1];

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
tol = 1e-9;
itmax = 1000;

fprintf('x0 = [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('tol = %.0e\n', tol)
fprintf('itmax = %d\n', itmax)
disp(' ')

%% Valores de omega a probar
omega_vals = 0.1:0.1:1.9;
n_omega = length(omega_vals);

% Vectores para almacenar resultados
errores = zeros(n_omega, 1);
residuos_relativos = zeros(n_omega, 1);
iteraciones = zeros(n_omega, 1);

disp('Resolviendo con diferentes valores de omega...')
disp(' ')

%% Loop sobre los valores de omega
for i = 1:n_omega
    omega = omega_vals(i);

    % Aplicar SOR
    [x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

    % Calcular error ||x_exacto - x_aproximado||_2
    error = x_exacto - x_sor;
    norma_error = normap(error, 2);

    % Guardar resultados
    errores(i) = norma_error;
    residuos_relativos(i) = resrel_sor;
    iteraciones(i) = iter_sor;

    % Mostrar resultados para este omega
    fprintf('omega = %.1f: iter = %4d, error = %.6e, resrel = %.6e\n', ...
            omega, iter_sor, norma_error, resrel_sor);
end

disp(' ')

%% Encontrar el omega optimo
[min_error, idx_min_error] = min(errores);
omega_opt_error = omega_vals(idx_min_error);

[min_resrel, idx_min_resrel] = min(residuos_relativos);
omega_opt_resrel = omega_vals(idx_min_resrel);

[min_iter, idx_min_iter] = min(iteraciones);
omega_opt_iter = omega_vals(idx_min_iter);

disp('========== VALORES OPTIMOS ==========')
fprintf('Omega que minimiza el error: %.1f (error = %.6e)\n', omega_opt_error, min_error)
fprintf('Omega que minimiza el residuo relativo: %.1f (resrel = %.6e)\n', omega_opt_resrel, min_resrel)
fprintf('Omega que minimiza iteraciones: %.1f (iter = %d)\n', omega_opt_iter, min_iter)
disp(' ')

disp('========== FIN EJERCICIO 9a ==========')


% Actividad 6 - Ejercicio 9b
% Graficar omega vs error y omega vs residuo relativo
% Visualizar el omega optimo
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 9b - ACTIVIDAD 6')
disp('Graficas: omega vs error y residuo')
disp('========================================')
disp(' ')

%% Datos del sistema
A = [4 -1 -1; -1 4 -1; -1 -1 4];
b = [2; 2; 2];
x_exacto = [1; 1; 1];

%% Parametros
x0 = zeros(3, 1);
tol = 1e-9;
itmax = 1000;

%% Valores de omega a probar
omega_vals = 0.1:0.1:1.9;
n_omega = length(omega_vals);

% Vectores para almacenar resultados
errores = zeros(n_omega, 1);
residuos_relativos = zeros(n_omega, 1);
iteraciones = zeros(n_omega, 1);

disp('Calculando resultados para todos los valores de omega...')

%% Loop sobre los valores de omega
for i = 1:n_omega
    omega = omega_vals(i);

    % Aplicar SOR
    [x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

    % Calcular error ||x_exacto - x_aproximado||_2
    error = x_exacto - x_sor;
    norma_error = normap(error, 2);

    % Guardar resultados
    errores(i) = norma_error;
    residuos_relativos(i) = resrel_sor;
    iteraciones(i) = iter_sor;
end

disp('Calculo completado.')
disp(' ')

%% Encontrar valores optimos
[min_error, idx_min_error] = min(errores);
omega_opt_error = omega_vals(idx_min_error);

[min_resrel, idx_min_resrel] = min(residuos_relativos);
omega_opt_resrel = omega_vals(idx_min_resrel);

%% Grafica 1: omega vs error
figure(1)
plot(omega_vals, errores, 'b-o', 'LineWidth', 2, 'MarkerSize', 6)
hold on
plot(omega_opt_error, min_error, 'r*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Error ||x_{exacto} - x_{aprox}||_2', 'FontSize', 12)
title('SOR: omega vs Error', 'FontSize', 14)
legend(['Error'], ...
       sprintf('Optimo: omega=%.1f', omega_opt_error), ...
       'Location', 'best')

%% Grafica 2: omega vs residuo relativo
figure(2)
plot(omega_vals, residuos_relativos, 'r-o', 'LineWidth', 2, 'MarkerSize', 6)
hold on
plot(omega_opt_resrel, min_resrel, 'b*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Residuo Relativo ||b - Ax||_2 / ||b||', 'FontSize', 12)
title('SOR: omega vs Residuo Relativo', 'FontSize', 14)
legend(['Residuo Relativo'], ...
       sprintf('Optimo: omega=%.1f', omega_opt_resrel), ...
       'Location', 'best')

%% Grafica 3: omega vs iteraciones (grafica adicional)
figure(3)
plot(omega_vals, iteraciones, 'g-o', 'LineWidth', 2, 'MarkerSize', 6)
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Numero de Iteraciones', 'FontSize', 12)
title('SOR: omega vs Iteraciones', 'FontSize', 14)

%% Grafica 4: Comparacion en una sola figura con subplots
figure(4)

% Subplot 1: Error
subplot(3, 1, 1)
plot(omega_vals, errores, 'b-o', 'LineWidth', 2, 'MarkerSize', 6)
hold on
plot(omega_opt_error, min_error, 'r*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
ylabel('Error ||e||_2', 'FontSize', 11)
title('Metodo SOR: Analisis del parametro omega', 'FontSize', 13)
legend('Error', sprintf('Optimo: ω=%.1f', omega_opt_error), 'Location', 'best')

% Subplot 2: Residuo relativo
subplot(3, 1, 2)
plot(omega_vals, residuos_relativos, 'r-o', 'LineWidth', 2, 'MarkerSize', 6)
hold on
plot(omega_opt_resrel, min_resrel, 'b*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
ylabel('Residuo Relativo', 'FontSize', 11)
legend('Residuo', sprintf('Optimo: ω=%.1f', omega_opt_resrel), 'Location', 'best')

% Subplot 3: Iteraciones
subplot(3, 1, 3)
plot(omega_vals, iteraciones, 'g-o', 'LineWidth', 2, 'MarkerSize', 6)
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Iteraciones', 'FontSize', 11)

%% Mostrar resultados en pantalla
disp('========== RESULTADOS ==========')
fprintf('Omega optimo (error): %.1f con error = %.6e\n', omega_opt_error, min_error)
fprintf('Omega optimo (residuo): %.1f con resrel = %.6e\n', omega_opt_resrel, min_resrel)
disp(' ')

disp('OBSERVACIONES:')
disp('- El parametro omega optimo se encuentra tipicamente entre 1.0 y 2.0')
disp('- Un omega muy pequeno (< 1) hace que la convergencia sea muy lenta')
disp('- Un omega demasiado grande (> 2) puede causar divergencia')
disp('- El omega optimo minimiza tanto el error como el numero de iteraciones')
disp(' ')

disp('========== FIN EJERCICIO 9b ==========')
