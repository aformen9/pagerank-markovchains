%% Ejercicio 3a - Actividad 9: Interpolación cuadrática de f(x) = x + 2/x
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% Tengo la función f(x) = x + 2/x
%
% Voy a:
%   1. Tomar 3 nodos (puntos) de esta función
%   2. Construir un polinomio de grado 2 (cuadrático) que pase por esos puntos
%   3. Usar ese polinomio para aproximar f(0.75) y f(1.5)
%   4. Comparar con los valores reales
%   5. Hacer una gráfica para visualizar

fprintf('=== EJERCICIO 3a: Interpolación cuadrática de f(x) = x + 2/x ===\n\n');

%% ============================================================================
%% DEFINICIÓN DE LA FUNCIÓN
%% ============================================================================
% La función es f(x) = x + 2/x
% Esta función tiene una forma interesante: decrece hasta x=√2 y luego crece

f = @(x) x + 2./x;  % El "./" es para que funcione con vectores

fprintf('Función a interpolar: f(x) = x + 2/x\n\n');

%% ============================================================================
%% PASO 1: DEFINO LOS NODOS
%% ============================================================================
% Uso 3 nodos para construir un polinomio de grado 2 (parábola)

x_nodos = [1, 2, 2.5];  % Tres puntos en x

% Evalúo la función en esos nodos
y_nodos = f(x_nodos);  % f(1) = 1 + 2/1 = 3
                        % f(2) = 2 + 2/2 = 3
                        % f(2.5) = 2.5 + 2/2.5 = 3.3

fprintf('Nodos de interpolación (puntos conocidos):\n');
for i = 1:3
    fprintf('  Nodo %d: x = %.2f,  f(%.2f) = %.2f + 2/%.2f = %.8f\n', ...
            i, x_nodos(i), x_nodos(i), x_nodos(i), x_nodos(i), y_nodos(i));
end
fprintf('\n');

%% ============================================================================
%% PASO 2: CONSTRUYO EL POLINOMIO INTERPOLANTE DE LAGRANGE
%% ============================================================================
% Voy a usar la función lagran.m que creamos antes
% Esta función construye el polinomio de Lagrange automáticamente

fprintf('Construyo el polinomio interpolante usando Lagrange...\n\n');

%% ============================================================================
%% PASO 3: EVALÚO EL POLINOMIO EN LOS PUNTOS DE INTERÉS
%% ============================================================================
% Quiero aproximar f(0.75) y f(1.5) usando el polinomio

x_eval = [0.75, 1.5];  % Puntos donde quiero aproximar

% Uso lagran.m para evaluar el polinomio interpolante
P_aprox = lagran(x_eval, x_nodos, y_nodos);

fprintf('Evaluación del polinomio interpolante:\n');
fprintf('  P(0.75) = %.8f\n', P_aprox(1));
fprintf('  P(1.5)  = %.8f\n\n', P_aprox(2));

%% ============================================================================
%% PASO 4: COMPARO CON LOS VALORES REALES
%% ============================================================================
% Calculo los valores reales de la función

f_real = f(x_eval);  % f(0.75) y f(1.5) reales

fprintf('Valores reales de la función:\n');
fprintf('  f(0.75) = 0.75 + 2/0.75 = %.8f\n', f_real(1));
fprintf('  f(1.5)  = 1.5  + 2/1.5  = %.8f\n\n', f_real(2));

%% Calculo los errores
error_abs = abs(f_real - P_aprox);  % Error absoluto
error_rel = error_abs ./ abs(f_real);  % Error relativo

fprintf('Errores:\n');
fprintf('  En x = 0.75:\n');
fprintf('    Error absoluto = %.8f\n', error_abs(1));
fprintf('    Error relativo = %.8f  (%.4f%%)\n\n', error_rel(1), error_rel(1)*100);

fprintf('  En x = 1.5:\n');
fprintf('    Error absoluto = %.8f\n', error_abs(2));
fprintf('    Error relativo = %.8f  (%.4f%%)\n\n', error_rel(2), error_rel(2)*100);

%% ============================================================================
%% PASO 5: GRÁFICA
%% ============================================================================
fprintf('Creando gráfica...\n\n');

% Genero muchos puntos para graficar suavemente
x_plot = linspace(0.5, 3, 300);  % 300 puntos desde 0.5 hasta 3

% Función real
y_func = f(x_plot);

% Polinomio interpolante
y_poly = lagran(x_plot, x_nodos, y_nodos);

%% Creo la figura
figure('Position', [100, 100, 900, 700]);

% Grafico la función real
plot(x_plot, y_func, 'b-', 'LineWidth', 2.5, 'DisplayName', 'f(x) = x + 2/x (función real)');
hold on;

% Grafico el polinomio interpolante
plot(x_plot, y_poly, 'r--', 'LineWidth', 2, 'DisplayName', 'P_2(x) (polinomio interpolante)');

% Marco los 3 nodos con círculos
plot(x_nodos, y_nodos, 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'g', ...
     'DisplayName', 'Nodos de interpolación');

% Marco los puntos evaluados con cuadrados
plot(x_eval, P_aprox, 'ms', 'MarkerSize', 14, 'MarkerFaceColor', 'm', ...
     'DisplayName', 'Puntos aproximados');

% Añado etiquetas a los nodos
text(x_nodos(1), y_nodos(1) + 0.2, 'x=1', 'FontSize', 11, ...
     'HorizontalAlignment', 'center', 'FontWeight', 'bold');
text(x_nodos(2), y_nodos(2) + 0.2, 'x=2', 'FontSize', 11, ...
     'HorizontalAlignment', 'center', 'FontWeight', 'bold');
text(x_nodos(3), y_nodos(3) + 0.2, 'x=2.5', 'FontSize', 11, ...
     'HorizontalAlignment', 'center', 'FontWeight', 'bold');

% Añado etiquetas a los puntos evaluados
text(x_eval(1), P_aprox(1) - 0.3, sprintf('x=0.75\nP=%.3f', P_aprox(1)), ...
     'FontSize', 10, 'HorizontalAlignment', 'center', 'Color', 'm');
text(x_eval(2), P_aprox(2) - 0.3, sprintf('x=1.5\nP=%.3f', P_aprox(2)), ...
     'FontSize', 10, 'HorizontalAlignment', 'center', 'Color', 'm');

grid on;
xlabel('x', 'FontSize', 13);
ylabel('y', 'FontSize', 13);
title('Interpolación cuadrática de f(x) = x + 2/x (3 nodos)', 'FontSize', 15);
legend('Location', 'best', 'FontSize', 11);
xlim([0.5, 3]);
hold off;

%% ============================================================================
%% ANÁLISIS
%% ============================================================================
fprintf('=== ANÁLISIS ===\n\n');

fprintf('1. OBSERVACIÓN EN LA GRÁFICA:\n');
fprintf('   - El polinomio cuadrático (línea roja punteada) pasa EXACTAMENTE\n');
fprintf('     por los 3 nodos (círculos verdes).\n');
fprintf('   - Cerca de los nodos, el polinomio aproxima bien a la función real.\n');
fprintf('   - Lejos de los nodos, el error puede ser mayor.\n\n');

fprintf('2. ERROR EN x = 0.75:\n');
if x_eval(1) < min(x_nodos)
    fprintf('   - x = 0.75 está FUERA del rango de nodos [1, 2.5]\n');
    fprintf('   - Esto se llama EXTRAPOLACIÓN (menos confiable)\n');
    fprintf('   - Por eso el error es mayor: %.4f%%\n\n', error_rel(1)*100);
else
    fprintf('   - x = 0.75 está dentro del rango de nodos\n');
end

fprintf('3. ERROR EN x = 1.5:\n');
if x_eval(2) >= min(x_nodos) && x_eval(2) <= max(x_nodos)
    fprintf('   - x = 1.5 está DENTRO del rango de nodos [1, 2.5]\n');
    fprintf('   - Esto se llama INTERPOLACIÓN (más confiable)\n');
    fprintf('   - El error es menor: %.4f%%\n\n', error_rel(2)*100);
end

fprintf('4. CONCLUSIÓN:\n');
fprintf('   - La interpolación funciona mejor DENTRO del rango de nodos\n');
fprintf('   - La extrapolación (fuera del rango) puede tener más error\n\n');

%% Guardo los resultados para usar en ejercicio 3c
save('resultados_ej3a.mat', 'x_eval', 'error_rel', 'P_aprox', 'f_real');

fprintf('Resultados guardados en resultados_ej3a.mat\n');
fprintf('(se usarán en el ejercicio 3c para comparar)\n\n');

fprintf('=== FIN EJERCICIO 3a ===\n');
