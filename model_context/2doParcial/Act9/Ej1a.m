%% Ejercicio 1a - Actividad 9: Interpolación de f(x) = cos(x)
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc % Limpio variables y pantalla

%% ============================================================================
%% ¿QUÉ ES LA INTERPOLACIÓN POLINOMIAL?
%% ============================================================================
% La interpolación polinomial consiste en encontrar un polinomio que pase
% EXACTAMENTE por un conjunto de puntos dados (llamados "nodos").
%
% Si tengo n+1 puntos, puedo encontrar un polinomio único de grado ≤ n
% que pase por todos esos puntos.
%
% Ejemplo: con 3 puntos puedo encontrar un polinomio de grado 2 (parábola)
%          con 4 puntos puedo encontrar un polinomio de grado 3 (cúbico)

%% ============================================================================
%% PROBLEMA A RESOLVER
%% ============================================================================
% Tengo la función f(x) = cos(x) y conozco su valor en algunos puntos.
% Quiero usar esos puntos para APROXIMAR f(0.45) sin calcular cos(0.45)
% directamente, sino usando un polinomio que pase por los puntos conocidos.

fprintf('=== EJERCICIO 1a: Interpolación de f(x) = cos(x) ===\n\n');

%% ============================================================================
%% CASO 1: INTERPOLACIÓN CUADRÁTICA (GRADO 2)
%% ============================================================================
% Voy a usar 3 nodos para construir un polinomio de grado 2
% P(x) = a0 + a1*x + a2*x^2

fprintf('--- CASO 1: Polinomio de grado 2 (3 nodos) ---\n\n');

%% Paso 1: Defino los nodos (puntos conocidos)
x_nodos = [0, 0.6, 1.2];  % Nodos en x
y_nodos = cos(x_nodos);   % Valores de f(x) = cos(x) en esos nodos

fprintf('Nodos de interpolación:\n');
for i = 1:3
    fprintf('  Punto %d: x = %.1f,  f(%.1f) = cos(%.1f) = %.8f\n', ...
            i, x_nodos(i), x_nodos(i), x_nodos(i), y_nodos(i));
end
fprintf('\n');

%% Paso 2: Construyo la matriz de Vandermonde
% La matriz de Vandermonde es una forma de resolver el sistema de ecuaciones
% para encontrar los coeficientes del polinomio.
%
% Si el polinomio es P(x) = a0 + a1*x + a2*x^2, entonces:
%   P(x0) = a0 + a1*x0 + a2*x0^2 = y0
%   P(x1) = a0 + a1*x1 + a2*x1^2 = y1
%   P(x2) = a0 + a1*x2 + a2*x2^2 = y2
%
% Esto forma un sistema de ecuaciones lineales: V * [a0; a1; a2] = [y0; y1; y2]
% donde V es la matriz de Vandermonde

V = [ones(3,1), x_nodos', x_nodos'.^2];  % Cada fila: [1, x_i, x_i^2]

fprintf('Matriz de Vandermonde V (cada fila representa un nodo):\n');
fprintf('     [1    x_i   x_i^2]\n');
disp(V);

%% Paso 3: Resuelvo el sistema para obtener los coeficientes
% Resuelvo V * a = y usando el operador "\" (división de matrices)
coef = V \ y_nodos';  % coef = [a0; a1; a2]

fprintf('Coeficientes del polinomio P(x) = a0 + a1*x + a2*x^2:\n');
fprintf('  a0 = %.10f  (término independiente)\n', coef(1));
fprintf('  a1 = %.10f  (coeficiente lineal)\n', coef(2));
fprintf('  a2 = %.10f  (coeficiente cuadrático)\n\n', coef(3));

%% Paso 4: Evalúo el polinomio en x = 0.45
% Ahora que tengo el polinomio, lo uso para aproximar f(0.45)
x_eval = 0.45;  % Punto donde quiero aproximar
P_aprox = coef(1) + coef(2)*x_eval + coef(3)*x_eval^2;  % P(0.45)

fprintf('Evaluación del polinomio en x = 0.45:\n');
fprintf('  P(0.45) = %.4f + %.4f*(0.45) + %.4f*(0.45)^2\n', ...
        coef(1), coef(2), coef(3));
fprintf('  P(0.45) = %.10f\n\n', P_aprox);

%% Paso 5: Calculo el error
% Comparo mi aproximación con el valor REAL de cos(0.45)
f_real = cos(x_eval);  % Valor real

error_abs = abs(f_real - P_aprox);      % Error absoluto
error_rel = error_abs / abs(f_real);    % Error relativo (en %)

fprintf('Comparación con el valor real:\n');
fprintf('  Valor aproximado: P(0.45)   = %.10f\n', P_aprox);
fprintf('  Valor real:       cos(0.45) = %.10f\n', f_real);
fprintf('  Error absoluto:              = %.10f\n', error_abs);
fprintf('  Error relativo:              = %.10f (%.6f%%)\n\n', ...
        error_rel, error_rel*100);

%% Guardamos los resultados para comparar después
resultados_grado2.P_aprox = P_aprox;
resultados_grado2.error_abs = error_abs;
resultados_grado2.error_rel = error_rel;

%% ============================================================================
%% CASO 2: INTERPOLACIÓN CÚBICA (GRADO 3)
%% ============================================================================
% Ahora voy a usar 4 nodos para construir un polinomio de grado 3
% P(x) = a0 + a1*x + a2*x^2 + a3*x^3
% Esto debería dar una mejor aproximación

fprintf('\n--- CASO 2: Polinomio de grado 3 (4 nodos) ---\n\n');

%% Paso 1: Defino los nuevos nodos
x_nodos_3 = [0, 0.4, 0.8, 1.2];  % 4 nodos
y_nodos_3 = cos(x_nodos_3);       % Valores de cos(x) en esos nodos

fprintf('Nodos de interpolación:\n');
for i = 1:4
    fprintf('  Punto %d: x = %.1f,  f(%.1f) = cos(%.1f) = %.8f\n', ...
            i, x_nodos_3(i), x_nodos_3(i), x_nodos_3(i), y_nodos_3(i));
end
fprintf('\n');

%% Paso 2: Construyo la matriz de Vandermonde 4x4
% Ahora tengo 4 ecuaciones y 4 incógnitas [a0, a1, a2, a3]
V3 = [ones(4,1), x_nodos_3', x_nodos_3'.^2, x_nodos_3'.^3];

fprintf('Matriz de Vandermonde V (4x4):\n');
fprintf('     [1    x_i   x_i^2   x_i^3]\n');
disp(V3);

%% Paso 3: Resuelvo el sistema
coef_3 = V3 \ y_nodos_3';  % coef_3 = [a0; a1; a2; a3]

fprintf('Coeficientes del polinomio P(x) = a0 + a1*x + a2*x^2 + a3*x^3:\n');
fprintf('  a0 = %.10f\n', coef_3(1));
fprintf('  a1 = %.10f\n', coef_3(2));
fprintf('  a2 = %.10f\n', coef_3(3));
fprintf('  a3 = %.10f\n\n', coef_3(4));

%% Paso 4: Evalúo el polinomio cúbico en x = 0.45
P_aprox_3 = coef_3(1) + coef_3(2)*x_eval + coef_3(3)*x_eval^2 + coef_3(4)*x_eval^3;

fprintf('Evaluación del polinomio en x = 0.45:\n');
fprintf('  P(0.45) = %.10f\n\n', P_aprox_3);

%% Paso 5: Calculo el error
error_abs_3 = abs(f_real - P_aprox_3);
error_rel_3 = error_abs_3 / abs(f_real);

fprintf('Comparación con el valor real:\n');
fprintf('  Valor aproximado: P(0.45)   = %.10f\n', P_aprox_3);
fprintf('  Valor real:       cos(0.45) = %.10f\n', f_real);
fprintf('  Error absoluto:              = %.10f\n', error_abs_3);
fprintf('  Error relativo:              = %.10f (%.6f%%)\n\n', ...
        error_rel_3, error_rel_3*100);

%% ============================================================================
%% COMPARACIÓN FINAL
%% ============================================================================
fprintf('\n=== COMPARACIÓN DE RESULTADOS ===\n\n');

fprintf('Polinomio de grado 2 (3 nodos):\n');
fprintf('  Aproximación: %.10f\n', resultados_grado2.P_aprox);
fprintf('  Error relativo: %.10f (%.6f%%)\n\n', ...
        resultados_grado2.error_rel, resultados_grado2.error_rel*100);

fprintf('Polinomio de grado 3 (4 nodos):\n');
fprintf('  Aproximación: %.10f\n', P_aprox_3);
fprintf('  Error relativo: %.10f (%.6f%%)\n\n', error_rel_3, error_rel_3*100);

fprintf('Mejora del error: %.2f veces\n', resultados_grado2.error_rel / error_rel_3);

fprintf('\n=== CONCLUSIÓN ===\n');
fprintf('El polinomio de grado 3 (con más nodos) da una aproximación\n');
fprintf('más precisa que el de grado 2. Esto es porque puede capturar\n');
fprintf('mejor el comportamiento de la función coseno.\n\n');

fprintf('=== FIN EJERCICIO 1a ===\n');
