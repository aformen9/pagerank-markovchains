% Ejercicio 5c - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== EJERCICIO 5c - Punto Fijo desde (-0.2, -0.2) ===\n\n')

%% Parametros del metodo
P0 = [-0.2, -0.2];  % punto inicial
tol = 1e-9;         % tolerancia
itmax = 50;         % iteraciones maximas

fprintf('Punto inicial: (%.2f, %.2f)\n', P0(1), P0(2))
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Aplico Punto Fijo
[Pk, iter] = PuntoFijo('G_ej5', P0, tol, itmax);

%% Resultado
fprintf('\n=== RESULTADO ===\n')
fprintf('Punto fijo encontrado: (%.8f, %.8f)\n', Pk(1), Pk(2))
fprintf('Numero de iteraciones: %d\n', iter)

%% Verifico
Pk_verif = feval('G_ej5', Pk);

fprintf('\n=== VERIFICACION ===\n')
fprintf('x = %.8f,  g1(x,y) = %.8f\n', Pk(1), Pk_verif(1))
fprintf('y = %.8f,  g2(x,y) = %.8f\n', Pk(2), Pk_verif(2))
fprintf('Error en x: %.2e\n', abs(Pk(1) - Pk_verif(1)))
fprintf('Error en y: %.2e\n', abs(Pk(2) - Pk_verif(2)))
