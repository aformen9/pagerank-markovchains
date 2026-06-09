%% Ejercicio 1b - Actividad 9: Interpolación de f(x) = ln(x + 1)
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc % Limpio variables y pantalla

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% Voy a hacer LO MISMO que en el ejercicio 1a, pero ahora con la función
% f(x) = ln(x + 1) en lugar de cos(x).
%
% El logaritmo natural ln(x) es el logaritmo en base 'e' (≈ 2.71828)
% Usamos ln(x+1) en lugar de ln(x) para evitar problemas en x=0 (ln(0) no existe)

fprintf('=== EJERCICIO 1b: Interpolación de f(x) = ln(x + 1) ===\n\n');

%% ============================================================================
%% CASO 1: INTERPOLACIÓN CUADRÁTICA (GRADO 2)
%% ============================================================================
% Uso 3 nodos para construir un polinomio de grado 2

fprintf('--- CASO 1: Polinomio de grado 2 (3 nodos) ---\n\n');

%% Paso 1: Defino los nodos
x_nodos = [0, 0.6, 1.2];      % Mismos nodos que en 1a
y_nodos = log(x_nodos + 1);   % f(x) = ln(x+1), en MATLAB/Octave: log() = ln()

fprintf('Nodos de interpolación:\n');
for i = 1:3
    fprintf('  Punto %d: x = %.1f,  f(%.1f) = ln(%.1f + 1) = ln(%.1f) = %.8f\n', ...
            i, x_nodos(i), x_nodos(i), x_nodos(i), x_nodos(i)+1, y_nodos(i));
end
fprintf('\n');

fprintf('NOTA: En MATLAB/Octave, la función log() calcula el logaritmo natural (ln),\n');
fprintf('      no el logaritmo en base 10 (que sería log10()).\n\n');

%% Paso 2: Matriz de Vandermonde
% La matriz es la MISMA que en el ejercicio 1a porque uso los mismos nodos x
% Solo cambian los valores y porque ahora evalúo ln(x+1) en lugar de cos(x)

V = [ones(3,1), x_nodos', x_nodos'.^2];

fprintf('Matriz de Vandermonde V:\n');
disp(V);
fprintf('(Es la misma que en ej1a porque los nodos x son los mismos)\n\n');

%% Paso 3: Resuelvo el sistema para los coeficientes
coef = V \ y_nodos';  % coef = [a0; a1; a2]

fprintf('Coeficientes del polinomio P(x) = a0 + a1*x + a2*x^2:\n');
fprintf('  a0 = %.10f\n', coef(1));
fprintf('  a1 = %.10f\n', coef(2));
fprintf('  a2 = %.10f\n\n', coef(3));

%% Paso 4: Evalúo en x = 0.45
x_eval = 0.45;
P_aprox = coef(1) + coef(2)*x_eval + coef(3)*x_eval^2;

fprintf('Evaluación del polinomio en x = 0.45:\n');
fprintf('  P(0.45) = %.10f\n\n', P_aprox);

%% Paso 5: Calculo el error
f_real = log(x_eval + 1);  % Valor real de ln(0.45 + 1) = ln(1.45)

error_abs = abs(f_real - P_aprox);
error_rel = error_abs / abs(f_real);

fprintf('Comparación con el valor real:\n');
fprintf('  Valor aproximado: P(0.45)      = %.10f\n', P_aprox);
fprintf('  Valor real:       ln(1.45)     = %.10f\n', f_real);
fprintf('  Error absoluto:                 = %.10f\n', error_abs);
fprintf('  Error relativo:                 = %.10f (%.6f%%)\n\n', ...
        error_rel, error_rel*100);

%% Guardo resultados para comparar
resultados_grado2.P_aprox = P_aprox;
resultados_grado2.error_rel = error_rel;

%% ============================================================================
%% CASO 2: INTERPOLACIÓN CÚBICA (GRADO 3)
%% ============================================================================

fprintf('\n--- CASO 2: Polinomio de grado 3 (4 nodos) ---\n\n');

%% Paso 1: Defino 4 nodos
x_nodos_3 = [0, 0.4, 0.8, 1.2];
y_nodos_3 = log(x_nodos_3 + 1);

fprintf('Nodos de interpolación:\n');
for i = 1:4
    fprintf('  Punto %d: x = %.1f,  f(%.1f) = ln(%.1f + 1) = ln(%.1f) = %.8f\n', ...
            i, x_nodos_3(i), x_nodos_3(i), x_nodos_3(i), x_nodos_3(i)+1, y_nodos_3(i));
end
fprintf('\n');

%% Paso 2: Matriz de Vandermonde 4x4
V3 = [ones(4,1), x_nodos_3', x_nodos_3'.^2, x_nodos_3'.^3];

fprintf('Matriz de Vandermonde V (4x4):\n');
disp(V3);

%% Paso 3: Resuelvo el sistema
coef_3 = V3 \ y_nodos_3';

fprintf('Coeficientes del polinomio cúbico:\n');
fprintf('  a0 = %.10f\n', coef_3(1));
fprintf('  a1 = %.10f\n', coef_3(2));
fprintf('  a2 = %.10f\n', coef_3(3));
fprintf('  a3 = %.10f\n\n', coef_3(4));

%% Paso 4: Evalúo en x = 0.45
P_aprox_3 = coef_3(1) + coef_3(2)*x_eval + coef_3(3)*x_eval^2 + coef_3(4)*x_eval^3;

fprintf('Evaluación del polinomio en x = 0.45:\n');
fprintf('  P(0.45) = %.10f\n\n', P_aprox_3);

%% Paso 5: Calculo el error
error_abs_3 = abs(f_real - P_aprox_3);
error_rel_3 = error_abs_3 / abs(f_real);

fprintf('Comparación con el valor real:\n');
fprintf('  Valor aproximado: P(0.45)      = %.10f\n', P_aprox_3);
fprintf('  Valor real:       ln(1.45)     = %.10f\n', f_real);
fprintf('  Error absoluto:                 = %.10f\n', error_abs_3);
fprintf('  Error relativo:                 = %.10f (%.6f%%)\n\n', ...
        error_rel_3, error_rel_3*100);

%% ============================================================================
%% COMPARACIÓN FINAL
%% ============================================================================
fprintf('\n=== COMPARACIÓN DE RESULTADOS ===\n\n');

fprintf('Función: f(x) = ln(x + 1)\n');
fprintf('Punto a aproximar: x = 0.45  →  ln(1.45) = %.10f\n\n', f_real);

fprintf('Polinomio de grado 2 (3 nodos):\n');
fprintf('  Aproximación:   %.10f\n', resultados_grado2.P_aprox);
fprintf('  Error relativo: %.10f (%.6f%%)\n\n', ...
        resultados_grado2.error_rel, resultados_grado2.error_rel*100);

fprintf('Polinomio de grado 3 (4 nodos):\n');
fprintf('  Aproximación:   %.10f\n', P_aprox_3);
fprintf('  Error relativo: %.10f (%.6f%%)\n\n', error_rel_3, error_rel_3*100);

fprintf('Mejora del error: %.2f veces\n\n', resultados_grado2.error_rel / error_rel_3);

%% ============================================================================
%% EXPLICACIÓN ADICIONAL
%% ============================================================================
fprintf('=== ¿POR QUÉ EL POLINOMIO DE GRADO 3 ES MEJOR? ===\n\n');

fprintf('1. Tiene más nodos (4 vs 3), entonces:\n');
fprintf('   - Captura mejor el comportamiento de la función\n');
fprintf('   - Puede ajustarse con más flexibilidad\n\n');

fprintf('2. El polinomio de grado 3 puede representar curvas más complejas\n');
fprintf('   que el de grado 2 (parábola).\n\n');

fprintf('3. Sin embargo, usar MUCHOS nodos no siempre es mejor:\n');
fprintf('   - Puede causar oscilaciones (fenómeno de Runge)\n');
fprintf('   - Aumenta el costo computacional\n\n');

fprintf('=== FIN EJERCICIO 1b ===\n');
