% Ejercicio 7b (modelo Wilson) - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== EJERCICIO 7b - Modelo de Wilson (transformado) ===\n\n')

% Datos del problema
gamma1 = 7.20;
gamma2 = 2.74;

fprintf('Datos del problema:\n')
fprintf('gamma1 = %.2f\n', gamma1)
fprintf('gamma2 = %.2f\n\n', gamma2)

fprintf('Cambio de variable:\n')
fprintf('alpha = ln(Lambda1)\n')
fprintf('beta = ln(Lambda2)\n\n')

fprintf('Sistema transformado:\n')
fprintf('ln(gamma1) = 1 - alpha - exp(beta)\n')
fprintf('ln(gamma2) = 1 - beta - exp(alpha)\n\n')

fprintf('Generatrices:\n')
fprintf('alpha = 1 - ln(gamma1) - exp(beta)\n')
fprintf('beta = 1 - ln(gamma2) - exp(alpha)\n\n')

%% Parametros del metodo
P0 = [0.0, 0.0];  % punto inicial
tol = 1e-9;
itmax = 50;

fprintf('Punto inicial: (%.2f, %.2f)\n', P0(1), P0(2))
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Aplico Punto Fijo
[Pk, iter] = PuntoFijo('G_ej7_b', P0, tol, itmax);

%% Resultado
fprintf('\n=== RESULTADO ===\n')
fprintf('alpha = %.8f\n', Pk(1))
fprintf('beta = %.8f\n\n', Pk(2))

% Calculo Lambda1 y Lambda2
L1 = exp(Pk(1));
L2 = exp(Pk(2));

fprintf('Lambda1 = exp(alpha) = %.8f\n', L1)
fprintf('Lambda2 = exp(beta) = %.8f\n', L2)
fprintf('Numero de iteraciones: %d\n\n', iter)

%% Verifico
alpha = Pk(1);
beta = Pk(2);

% Calculo gamma1 y gamma2 con los valores encontrados
gamma1_calc = exp(1 - alpha - exp(beta));
gamma2_calc = exp(1 - beta - exp(alpha));

fprintf('=== VERIFICACION ===\n')
fprintf('gamma1 esperado: %.2f\n', gamma1)
fprintf('gamma1 calculado: %.2f\n', gamma1_calc)
fprintf('Error: %.2e\n\n', abs(gamma1 - gamma1_calc))

fprintf('gamma2 esperado: %.2f\n', gamma2)
fprintf('gamma2 calculado: %.2f\n', gamma2_calc)
fprintf('Error: %.2e\n', abs(gamma2 - gamma2_calc))

%% Verifico ecuaciones originales
fprintf('=== VERIFICACION EN ECUACIONES ORIGINALES ===\n')
fprintf('ln(gamma1) = %.8f\n', log(gamma1))
fprintf('1 - ln(Lambda1) - Lambda2 = %.8f\n', 1 - log(L1) - L2)
fprintf('Diferencia: %.2e\n\n', abs(log(gamma1) - (1 - log(L1) - L2)))

fprintf('ln(gamma2) = %.8f\n', log(gamma2))
fprintf('1 - ln(Lambda2) - Lambda1 = %.8f\n', 1 - log(L2) - L1)
fprintf('Diferencia: %.2e\n', abs(log(gamma2) - (1 - log(L2) - L1)))

%% Con el cambio de variable α = ln(Λ₁) y β = ln(Λ₂),
%% el sistema también converge exitosamente.
%% Solución: α = -1.8174, β = -0.1704
%% Que corresponden a: Λ₁ = 0.1624, Λ₂ = 0.8433
%% Converge en 22 iteraciones.

% Ambos métodos dan la misma solución.
