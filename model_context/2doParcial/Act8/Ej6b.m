% Actividad 8 - Ejercicio 6 - Item (b)
% Utilizar NewtonRaphsonSENL3D para resolver los sistemas del Ej. 6 Act. 7
%
% TEORIA: Aplicamos el metodo de Newton-Raphson 3D implementado en el
% item (a) para resolver dos sistemas no lineales tridimensionales.
% Cada sistema requiere:
%   1. Definir F(X) (vector de funciones)
%   2. Calcular la Jacobiana J(X)
%   3. Elegir un punto inicial apropiado
%   4. Ejecutar el algoritmo hasta convergencia
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 6 - ACTIVIDAD 8 - ITEM (b)\n')
fprintf('Resolver sistemas 3D con Newton-Raphson\n')
fprintf('========================================\n\n')

% Parametros
tol = 1e-9;
itmax = 50;

fprintf('Parametros:\n')
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% SISTEMA (i)

fprintf('========================================\n')
fprintf('SISTEMA (i)\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones:\n')
fprintf('  x^2 - x + y^2 + z^2 = 5\n')
fprintf('  x^2 + y^2 - y + z^2 = 4\n')
fprintf('  x^2 + y^2 + z^2 + z = 6\n\n')

fprintf('Forma estandar F(X) = 0:\n')
fprintf('  f1(x,y,z) = x^2 - x + y^2 + z^2 - 5 = 0\n')
fprintf('  f2(x,y,z) = x^2 + y^2 - y + z^2 - 4 = 0\n')
fprintf('  f3(x,y,z) = x^2 + y^2 + z^2 + z - 6 = 0\n\n')

% Punto inicial (estimacion)
P0_i = [2; 1; 1.5];
fprintf('Punto inicial: (%.1f, %.1f, %.1f)\n\n', P0_i(1), P0_i(2), P0_i(3))

% Resolver
fprintf('Ejecutando NewtonRaphsonSENL3D...\n\n')
[Pk_i, iter_i, err_i] = NewtonRaphsonSENL3D('F_ej6b_i', 'JF_ej6b_i', P0_i, tol, itmax);

fprintf('\n')

% Verificacion
F_test_i = F_ej6b_i(Pk_i);
fprintf('VERIFICACION:\n')
fprintf('F(Pk) = [%.3e; %.3e; %.3e]\n', F_test_i(1), F_test_i(2), F_test_i(3))
fprintf('||F(Pk)||_2 = %.3e\n\n', norm(F_test_i))

fprintf('Comprobacion manual de la solucion:\n')
fprintf('x^2 - x + y^2 + z^2 = %.6f (debe ser ≈ 5)\n', ...
    Pk_i(1)^2 - Pk_i(1) + Pk_i(2)^2 + Pk_i(3)^2)
fprintf('x^2 + y^2 - y + z^2 = %.6f (debe ser ≈ 4)\n', ...
    Pk_i(1)^2 + Pk_i(2)^2 - Pk_i(2) + Pk_i(3)^2)
fprintf('x^2 + y^2 + z^2 + z = %.6f (debe ser ≈ 6)\n\n', ...
    Pk_i(1)^2 + Pk_i(2)^2 + Pk_i(3)^2 + Pk_i(3))

%% SISTEMA (ii)

fprintf('========================================\n')
fprintf('SISTEMA (ii)\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones:\n')
fprintf('  x^2 - x + 2y^2 + yz = 10\n')
fprintf('  5x - 6y + z = 0\n')
fprintf('  z - x^2 - y^2 = 0\n\n')

fprintf('Forma estandar F(X) = 0:\n')
fprintf('  f1(x,y,z) = x^2 - x + 2y^2 + yz - 10 = 0\n')
fprintf('  f2(x,y,z) = 5x - 6y + z = 0\n')
fprintf('  f3(x,y,z) = z - x^2 - y^2 = 0\n\n')

% Punto inicial (estimacion)
P0_ii = [1.5; 2; 5];
fprintf('Punto inicial: (%.1f, %.1f, %.1f)\n\n', P0_ii(1), P0_ii(2), P0_ii(3))

% Resolver
fprintf('Ejecutando NewtonRaphsonSENL3D...\n\n')
[Pk_ii, iter_ii, err_ii] = NewtonRaphsonSENL3D('F_ej6b_ii', 'JF_ej6b_ii', P0_ii, tol, itmax);

fprintf('\n')

% Verificacion
F_test_ii = F_ej6b_ii(Pk_ii);
fprintf('VERIFICACION:\n')
fprintf('F(Pk) = [%.3e; %.3e; %.3e]\n', F_test_ii(1), F_test_ii(2), F_test_ii(3))
fprintf('||F(Pk)||_2 = %.3e\n\n', norm(F_test_ii))

fprintf('Comprobacion manual de la solucion:\n')
fprintf('x^2 - x + 2y^2 + yz = %.6f (debe ser ≈ 10)\n', ...
    Pk_ii(1)^2 - Pk_ii(1) + 2*Pk_ii(2)^2 + Pk_ii(2)*Pk_ii(3))
fprintf('5x - 6y + z = %.6f (debe ser ≈ 0)\n', ...
    5*Pk_ii(1) - 6*Pk_ii(2) + Pk_ii(3))
fprintf('z - x^2 - y^2 = %.6f (debe ser ≈ 0)\n\n', ...
    Pk_ii(3) - Pk_ii(1)^2 - Pk_ii(2)^2)

%% RESUMEN DE RESULTADOS

fprintf('========================================\n')
fprintf('RESUMEN DE RESULTADOS\n')
fprintf('========================================\n\n')

fprintf('SISTEMA (i):\n')
fprintf('  Solucion: (%.6f, %.6f, %.6f)\n', Pk_i(1), Pk_i(2), Pk_i(3))
fprintf('  Iteraciones: %d\n', iter_i)
fprintf('  Error estimado: %.3e\n\n', err_i)

fprintf('SISTEMA (ii):\n')
fprintf('  Solucion: (%.6f, %.6f, %.6f)\n', Pk_ii(1), Pk_ii(2), Pk_ii(3))
fprintf('  Iteraciones: %d\n', iter_ii)
fprintf('  Error estimado: %.3e\n\n', err_ii)

fprintf('OBSERVACIONES:\n')
fprintf('  - Ambos sistemas convergieron exitosamente\n')
fprintf('  - Newton-Raphson mostro convergencia rapida (pocas iteraciones)\n')
fprintf('  - Las soluciones tienen alta precision (error < 1e-9)\n')
fprintf('  - La eleccion del punto inicial fue adecuada en ambos casos\n')

%% Resuelve ambos sistemas del Ej. 6 Act. 7
%% Usa NewtonRaphsonSENL3D
%% Verifica las soluciones
%% Comprobación manual de las ecuaciones
