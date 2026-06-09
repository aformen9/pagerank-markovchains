% Ejercicio 7a (modelo Wilson) - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== EJERCICIO 7a - Modelo de Wilson ===\n\n')

% Datos del problema
gamma1 = 7.20;
gamma2 = 2.74;

fprintf('Datos del problema:\n')
fprintf('gamma1 = %.2f\n', gamma1)
fprintf('gamma2 = %.2f\n\n', gamma2)

fprintf('Sistema a resolver:\n')
fprintf('ln(gamma1) = 1 - ln(Lambda1) - Lambda2\n')
fprintf('ln(gamma2) = 1 - ln(Lambda2) - Lambda1\n\n')

%% Parametros del metodo
P0 = [0.5, 0.5];  % punto inicial
tol = 1e-9;
itmax = 50;

fprintf('Punto inicial: (%.2f, %.2f)\n', P0(1), P0(2))
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Aplico Punto Fijo
[Pk, iter] = PuntoFijo('G_ej7_a', P0, tol, itmax);

%% Resultado
fprintf('\n=== RESULTADO ===\n')
fprintf('Lambda1 = %.8f\n', Pk(1))
fprintf('Lambda2 = %.8f\n', Pk(2))
fprintf('Numero de iteraciones: %d\n\n', iter)

%% Verifico
L1 = Pk(1);
L2 = Pk(2);

% Calculo gamma1 y gamma2 con los valores encontrados
gamma1_calc = exp(1 - log(L1) - L2);
gamma2_calc = exp(1 - log(L2) - L1);

fprintf('=== VERIFICACION ===\n')
fprintf('gamma1 esperado: %.2f\n', gamma1)
fprintf('gamma1 calculado: %.2f\n', gamma1_calc)
fprintf('Error: %.2e\n\n', abs(gamma1 - gamma1_calc))

fprintf('gamma2 esperado: %.2f\n', gamma2)
fprintf('gamma2 calculado: %.2f\n', gamma2_calc)
fprintf('Error: %.2e\n', abs(gamma2 - gamma2_calc))

%% El método de Punto Fijo SÍ converge para el sistema original.
%% Solución encontrada: Λ₁ = 0.1624, Λ₂ = 0.8433
%% Converge en 20 iteraciones.
