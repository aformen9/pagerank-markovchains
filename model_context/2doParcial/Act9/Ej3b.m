%% Ejercicio 3b - Actividad 9: Interpolación cúbica de f(x) = x + 2/x
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER DIFERENTE AL 3a?
%% ============================================================================
% En el ejercicio 3a usé 3 nodos → polinomio de grado 2 (cuadrático)
% Ahora voy a usar 4 nodos → polinomio de grado 3 (cúbico)
%
% HIPÓTESIS: Con más nodos, la aproximación debería ser mejor
% (siempre y cuando no caigamos en el fenómeno de Runge)

fprintf('=== EJERCICIO 3b: Interpolación cúbica de f(x) = x + 2/x ===\n\n');

%% ============================================================================
%% DEFINICIÓN DE LA FUNCIÓN (LA MISMA QUE EN 3a)
%% ============================================================================

f = @(x) x + 2./x;

fprintf('Función a interpolar: f(x) = x + 2/x\n\n');

%% ============================================================================
%% PASO 1: DEFINO 4 NODOS (UNO MÁS QUE EN 3a)
%% ============================================================================

x_nodos = [0.5, 1.5, 2, 2.5];  % 4 nodos

% Evalúo la función en los nodos
y_nodos = f(x_nodos);

fprintf('Nodos de interpolación (4 puntos):\n');
for i = 1:4
    fprintf('  Nodo %d: x = %.2f,  f(%.2f) = %.2f + 2/%.2f = %.8f\n', ...
            i, x_nodos(i), x_nodos(i), x_nodos(i), x_nodos(i), y_nodos(i));
end
fprintf('\n');

fprintf('NOTA: Ahora tengo un nodo adicional en x = 0.5\n');
fprintf('      Esto me permite construir un polinomio de grado 3 (cúbico)\n\n');

%% ============================================================================
%% PASO 2: CONSTRUYO EL POLINOMIO CÚBICO CON LAGRANGE
%% ============================================================================

fprintf('Construyo el polinomio interpolante de grado 3...\n\n');

%% ============================================================================
%% PASO 3: EVALÚO EN LOS MISMOS PUNTOS QUE EN 3a
%% ============================================================================
% Voy a aproximar f(0.75) y f(1.5) para poder comparar con los resultados de 3a

x_eval = [0.75, 1.5];

% Uso lagran.m
P_aprox = lagran(x_eval, x_nodos, y_nodos);

fprintf('Evaluación del polinomio cúbico:\n');
fprintf('  P(0.75) = %.8f\n', P_aprox(1));
fprintf('  P(1.5)  = %.8f\n\n', P_aprox(2));

%% ============================================================================
%% PASO 4: COMPARO CON LOS VALORES REALES
%% ============================================================================

f_real = f(x_eval);

fprintf('Valores reales:\n');
fprintf('  f(0.75) = %.8f\n', f_real(1));
fprintf('  f(1.5)  = %.8f\n\n', f_real(2));

%% Calculo los errores
error_abs = abs(f_real - P_aprox);
error_rel = error_abs ./ abs(f_real);

fprintf('Errores con interpolación cúbica:\n');
fprintf('  En x = 0.75:\n');
fprintf('    Error absoluto = %.8f\n', error_abs(1));
fprintf('    Error relativo = %.8f  (%.6f%%)\n\n', error_rel(1), error_rel(1)*100);

fprintf('  En x = 1.5:\n');
fprintf('    Error absoluto = %.8f\n', error_abs(2));
fprintf('    Error relativo = %.8f  (%.6f%%)\n\n', error_rel(2), error_rel(2)*100);

%% ============================================================================
%% OBSERVACIÓN IMPORTANTE SOBRE x = 1.5
%% ============================================================================
fprintf('⚠️  OBSERVACIÓN IMPORTANTE:\n\n');
fprintf('En x = 1.5:\n');
fprintf('  - Este punto es uno de los 4 NODOS del polinomio cúbico\n');
fprintf('  - Por definición, el polinomio DEBE pasar exactamente por él\n');
fprintf('  - Por lo tanto, P(1.5) = f(1.5) exactamente\n');
fprintf('  - El error debería ser prácticamente 0 (solo errores de redondeo)\n\n');

if error_rel(2) < 1e-10
    fprintf('✓ Efectivamente, el error en x=1.5 es %.2e (prácticamente 0)\n\n', error_rel(2));
else
    fprintf('⚠️  El error no es 0. Puede haber un problema numérico.\n\n');
end

%% ============================================================================
%% PASO 5: GRÁFICA
%% ============================================================================
fprintf('Creando gráfica...\n\n');

% Puntos para graficar
x_plot = linspace(0.4, 3, 300);

% Función real
y_func = f(x_plot);

% Polinomio cúbico
y_poly = lagran(x_plot, x_nodos, y_nodos);

%% Creo la figura
figure('Position', [150, 150, 900, 700]);

% Función real
plot(x_plot, y_func, 'b-', 'LineWidth', 2.5, 'DisplayName', 'f(x) = x + 2/x');
hold on;

% Polinomio cúbico
plot(x_plot, y_poly, 'g--', 'LineWidth', 2, 'DisplayName', 'P_3(x) (polinomio cúbico)');

% 4 nodos
plot(x_nodos, y_nodos, 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'r', ...
     'DisplayName', 'Nodos de interpolación (4 puntos)');

% Puntos evaluados
plot(x_eval, P_aprox, 'ms', 'MarkerSize', 14, 'MarkerFaceColor', 'c', ...
     'DisplayName', 'Puntos aproximados');

% Etiquetas de los nodos
for i = 1:4
    text(x_nodos(i), y_nodos(i) + 0.25, sprintf('x=%.1f', x_nodos(i)), ...
         'FontSize', 10, 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
end

% Etiquetas de los puntos evaluados
text(x_eval(1), P_aprox(1) - 0.4, sprintf('x=0.75\nP=%.3f', P_aprox(1)), ...
     'FontSize', 10, 'HorizontalAlignment', 'center', 'Color', 'c');
text(x_eval(2) + 0.15, P_aprox(2), sprintf('x=1.5 (nodo)\nP=%.3f', P_aprox(2)), ...
     'FontSize', 10, 'HorizontalAlignment', 'left', 'Color', 'c', 'FontWeight', 'bold');

grid on;
xlabel('x', 'FontSize', 13);
ylabel('y', 'FontSize', 13);
title('Interpolación cúbica de f(x) = x + 2/x (4 nodos)', 'FontSize', 15);
legend('Location', 'best', 'FontSize', 11);
xlim([0.4, 3]);
hold off;

%% ============================================================================
%% ANÁLISIS
%% ============================================================================
fprintf('=== ANÁLISIS ===\n\n');

fprintf('1. DIFERENCIAS CON EL EJERCICIO 3a:\n');
fprintf('   - Ahora uso 4 nodos en lugar de 3\n');
fprintf('   - Tengo un polinomio de grado 3 (cúbico) en lugar de grado 2\n');
fprintf('   - Los nodos cubren un rango más amplio: [0.5, 2.5]\n\n');

fprintf('2. VENTAJA: x = 0.75 AHORA ES INTERPOLACIÓN\n');
fprintf('   - En el ej. 3a, x=0.75 estaba fuera de [1, 2.5] (extrapolación)\n');
fprintf('   - Ahora x=0.75 está dentro de [0.5, 2.5] (interpolación)\n');
fprintf('   - Esto debería reducir el error en x=0.75\n\n');

fprintf('3. VENTAJA: x = 1.5 ES UN NODO\n');
fprintf('   - En el ej. 3a, x=1.5 estaba entre nodos\n');
fprintf('   - Ahora x=1.5 ES uno de los nodos\n');
fprintf('   - El error debe ser prácticamente 0\n\n');

fprintf('4. OBSERVACIÓN EN LA GRÁFICA:\n');
fprintf('   - El polinomio cúbico (línea verde) sigue mejor a la función\n');
fprintf('   - Pasa exactamente por los 4 nodos\n');
fprintf('   - Tiene menos "oscilación" que un polinomio de grado 2\n\n');

%% Guardo los resultados para comparar en 3c
save('resultados_ej3b.mat', 'x_eval', 'error_rel', 'P_aprox', 'f_real');

fprintf('Resultados guardados en resultados_ej3b.mat\n');
fprintf('(se usarán en el ejercicio 3c para comparar con 3a)\n\n');

fprintf('=== FIN EJERCICIO 3b ===\n');
