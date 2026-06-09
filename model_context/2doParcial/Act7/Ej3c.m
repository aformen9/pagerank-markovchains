% Ejercicio 3c - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

%% Parametros del metodo
P0 = [1.1, 2.0];  % punto inicial (vector fila)
tol = 1e-9;       % tolerancia
itmax = 50;       % iteraciones maximas

fprintf('=== EJERCICIO 3c - Metodo de Punto Fijo ===\n\n')
fprintf('Punto inicial: (%.2f, %.2f)\n', P0(1), P0(2))
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Aplico Punto Fijo
% Nota: la funcion de generatrices esta en G_ej3.m
[Pk, iter] = PuntoFijo('G_ej3', P0, tol, itmax);

%% Muestro resultado final
fprintf('\n=== RESULTADO FINAL ===\n')
fprintf('Punto fijo encontrado: (%.8f, %.8f)\n', Pk(1), Pk(2))
fprintf('Numero de iteraciones: %d\n', iter)

%% Verifico que es punto fijo
% Evaluo las generatrices en el punto encontrado
Pk_verif = feval('G_ej3', Pk);

fprintf('\n=== VERIFICACION ===\n')
fprintf('Punto encontrado: (%.8f, %.8f)\n', Pk(1), Pk(2))
fprintf('g1(Pk): %.8f\n', Pk_verif(1))
fprintf('g2(Pk): %.8f\n', Pk_verif(2))
fprintf('Error en x: %.2e\n', abs(Pk(1) - Pk_verif(1)))
fprintf('Error en y: %.2e\n', abs(Pk(2) - Pk_verif(2)))
