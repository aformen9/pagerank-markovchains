% Actividad 6 - Ejercicio 10a
% Matriz pentadiagonal 20x20 con SOR (omega = 1.3)
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 10a - ACTIVIDAD 6')
disp('Matriz Pentadiagonal 20x20 - SOR con omega = 1.3')
disp('========================================')
disp(' ')

%% Construccion de la matriz pentadiagonal 20x20
n = 20;

% Creo la matriz usando diag
% Diagonal principal: 6
% Primera diagonal superior e inferior: -2
% Segunda diagonal superior e inferior: -1
A = 6 * eye(n) + ...
    -2 * diag(ones(n-1, 1), 1) + ...
    -2 * diag(ones(n-1, 1), -1) + ...
    -1 * diag(ones(n-2, 1), 2) + ...
    -1 * diag(ones(n-2, 1), -2);

disp('Matriz pentadiagonal A de 20x20:')
disp('(mostrando solo las primeras 5 filas y columnas)')
disp(A(1:5, 1:5))
disp(' ')

%% Vector lado derecho
b = ones(n, 1);

disp('Vector b = [1, 1, ..., 1]^T')
disp(' ')

%% Parametros
x0 = zeros(n, 1);
omega = 1.3;
tol = 1e-14;
itmax = 10000;

fprintf('Parametros:\n')
fprintf('  n = %d\n', n)
fprintf('  x0 = vector cero\n')
fprintf('  omega = %.1f\n', omega)
fprintf('  tol = %.0e\n', tol)
fprintf('  itmax = %d\n', itmax)
disp(' ')

%% Aplicar SOR
disp('Resolviendo con SOR...')
[x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

if iter_sor == -1
    disp('ERROR: El metodo SOR no convergio.')
else
    fprintf('Convergencia alcanzada en %d iteraciones\n', iter_sor)
    fprintf('Residuo relativo final: %.15e\n', resrel_sor)
    disp(' ')

    disp('Solucion aproximada (primeros 10 elementos):')
    disp(x_sor(1:10))
    disp(' ')

    %% Verificacion
    residual = b - A * x_sor;
    norma_residual = normap(residual, 2);

    fprintf('Verificacion:\n')
    fprintf('  ||residual||_2 = %.15e\n', norma_residual)
    fprintf('  ||residual||_2 / ||b|| = %.15e\n', norma_residual / normap(b, 2))
end

disp(' ')
disp('========== FIN EJERCICIO 10a ==========')


% Actividad 6 - Ejercicio 10b
% Encontrar otro omega que converja mas rapido
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 10b - ACTIVIDAD 6')
disp('Busqueda de omega optimo')
disp('========================================')
disp(' ')

%% Construccion de la matriz pentadiagonal 20x20
n = 20;

A = 6 * eye(n) + ...
    -2 * diag(ones(n-1, 1), 1) + ...
    -2 * diag(ones(n-1, 1), -1) + ...
    -1 * diag(ones(n-2, 1), 2) + ...
    -1 * diag(ones(n-2, 1), -2);

b = ones(n, 1);

%% Parametros
x0 = zeros(n, 1);
tol = 1e-14;
itmax = 10000;

%% Probar diferentes valores de omega
disp('Probando diferentes valores de omega...')
disp(' ')

% Valores de omega a probar alrededor de 1.0 a 1.9
omega_vals = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9];
n_omega = length(omega_vals);

iteraciones = zeros(n_omega, 1);
residuos = zeros(n_omega, 1);

fprintf('%-10s | %-12s | %-15s\n', 'omega', 'Iteraciones', 'Residuo Relativo')
fprintf('------------------------------------------------\n')

for i = 1:n_omega
    omega = omega_vals(i);
    [x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

    iteraciones(i) = iter_sor;
    residuos(i) = resrel_sor;

    if iter_sor == -1
        fprintf('%-10.1f | %12s | %15s\n', omega, 'NO CONVERG.', '-')
    else
        fprintf('%-10.1f | %12d | %15.6e\n', omega, iter_sor, resrel_sor)
    end
end

disp(' ')

%% Encontrar el omega optimo (minimo numero de iteraciones)
% Excluir casos donde no convergio (iter = -1)
iter_validas = iteraciones(iteraciones > 0);
omega_validas = omega_vals(iteraciones > 0);

if ~isempty(iter_validas)
    [min_iter, idx_min] = min(iter_validas);
    omega_opt = omega_validas(idx_min);

    disp('========== RESULTADO ==========')
    fprintf('Omega con MENOS iteraciones: %.1f (%d iteraciones)\n', omega_opt, min_iter)
    fprintf('Omega usado en ejercicio 10a: %.1f (%d iteraciones)\n', 1.3, iteraciones(omega_vals == 1.3))
    disp(' ')

    if omega_opt < 1.3
        fprintf('El omega optimo %.1f es MEJOR que 1.3\n', omega_opt)
        fprintf('Reduce el numero de iteraciones en %d\n', iteraciones(omega_vals == 1.3) - min_iter)
    elseif omega_opt > 1.3
        fprintf('El omega optimo %.1f es MEJOR que 1.3\n', omega_opt)
        fprintf('Reduce el numero de iteraciones en %d\n', iteraciones(omega_vals == 1.3) - min_iter)
    else
        disp('El omega = 1.3 ya es optimo entre los valores probados')
    end
else
    disp('ERROR: Ningun valor de omega convergio.')
end

disp(' ')
disp('========== FIN EJERCICIO 10b ==========')


% Actividad 6 - Ejercicio 10c
% Graficar omega vs residuo relativo para omega en (0, 2)
% Visualizar omega optimo
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 10c - ACTIVIDAD 6')
disp('Grafica: omega vs Residuo Relativo')
disp('========================================')
disp(' ')

%% Construccion de la matriz pentadiagonal 20x20
n = 20;

A = 6 * eye(n) + ...
    -2 * diag(ones(n-1, 1), 1) + ...
    -2 * diag(ones(n-1, 1), -1) + ...
    -1 * diag(ones(n-2, 1), 2) + ...
    -1 * diag(ones(n-2, 1), -2);

b = ones(n, 1);

%% Parametros
x0 = zeros(n, 1);
tol = 1e-14;
itmax = 10000;

%% Valores de omega en el intervalo (0, 2)
% Uso un paso pequeño para tener una curva suave
omega_vals = 0.1:0.05:1.95;
n_omega = length(omega_vals);

iteraciones = zeros(n_omega, 1);
residuos_relativos = zeros(n_omega, 1);

disp('Calculando resultados para todos los valores de omega...')
disp('(Esto puede tomar unos segundos)')
disp(' ')

%% Loop sobre los valores de omega
for i = 1:n_omega
    omega = omega_vals(i);
    [x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

    iteraciones(i) = iter_sor;

    if iter_sor == -1
        % No convergio, asigno un valor alto
        residuos_relativos(i) = NaN;
    else
        residuos_relativos(i) = resrel_sor;
    end
end

disp('Calculo completado.')
disp(' ')

%% Encontrar omega optimo (minimo numero de iteraciones)
iter_validas = iteraciones(iteraciones > 0);
omega_validas = omega_vals(iteraciones > 0);
resrel_validas = residuos_relativos(iteraciones > 0);

[min_iter, idx_min_iter] = min(iter_validas);
omega_opt_iter = omega_validas(idx_min_iter);

[min_resrel, idx_min_resrel] = min(resrel_validas);
omega_opt_resrel = omega_validas(idx_min_resrel);

fprintf('Omega optimo (min iteraciones): %.2f (%d iteraciones)\n', omega_opt_iter, min_iter)
fprintf('Omega optimo (min residuo): %.2f (resrel = %.6e)\n', omega_opt_resrel, min_resrel)
disp(' ')

%% Grafica 1: omega vs residuo relativo
figure(1)
plot(omega_vals, residuos_relativos, 'b-', 'LineWidth', 2)
hold on
plot(omega_opt_resrel, min_resrel, 'r*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Residuo Relativo ||b - Ax||_2 / ||b||', 'FontSize', 12)
title('SOR: omega vs Residuo Relativo (Matriz Pentadiagonal 20x20)', 'FontSize', 13)
legend('Residuo Relativo', ...
       sprintf('Optimo: omega = %.2f', omega_opt_resrel), ...
       'Location', 'best')

%% Grafica 2: omega vs iteraciones
figure(2)
% Reemplazo -1 (no convergio) con NaN para que no se grafique
iter_plot = iteraciones;
iter_plot(iter_plot == -1) = NaN;

plot(omega_vals, iter_plot, 'g-', 'LineWidth', 2)
hold on
plot(omega_opt_iter, min_iter, 'r*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Numero de Iteraciones', 'FontSize', 12)
title('SOR: omega vs Iteraciones (Matriz Pentadiagonal 20x20)', 'FontSize', 13)
legend('Iteraciones', ...
       sprintf('Optimo: omega = %.2f', omega_opt_iter), ...
       'Location', 'best')

%% Grafica 3: Subplot con ambas graficas
figure(3)

% Subplot 1: Residuo relativo
subplot(2, 1, 1)
plot(omega_vals, residuos_relativos, 'b-', 'LineWidth', 2)
hold on
plot(omega_opt_resrel, min_resrel, 'r*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
ylabel('Residuo Relativo', 'FontSize', 11)
title('SOR - Matriz Pentadiagonal 20x20: Analisis del parametro omega', 'FontSize', 13)
legend('Residuo', sprintf('Optimo: ω = %.2f', omega_opt_resrel), 'Location', 'best')

% Subplot 2: Iteraciones
subplot(2, 1, 2)
plot(omega_vals, iter_plot, 'g-', 'LineWidth', 2)
hold on
plot(omega_opt_iter, min_iter, 'r*', 'MarkerSize', 15, 'LineWidth', 2)
hold off
grid on
xlabel('omega', 'FontSize', 12)
ylabel('Iteraciones', 'FontSize', 11)
legend('Iteraciones', sprintf('Optimo: ω = %.2f', omega_opt_iter), 'Location', 'best')

%% Observaciones
disp('OBSERVACIONES:')
disp('- La matriz es simetrica y positiva definida, por lo que SOR')
disp('  converge para cualquier omega en (0, 2) segun la teoria.')
disp('- El omega optimo minimiza el numero de iteraciones necesarias.')
disp('- Para matrices pentadiagonales bien condicionadas como esta,')
disp('  el omega optimo suele estar entre 1.0 y 1.5.')
disp(' ')

disp('========== FIN EJERCICIO 10c ==========')
