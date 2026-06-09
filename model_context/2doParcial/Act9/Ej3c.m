%% Ejercicio 3c - Actividad 9: Comparación de errores relativos
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% Voy a comparar los errores relativos obtenidos en:
%   - Ejercicio 3a: interpolación cuadrática (3 nodos)
%   - Ejercicio 3b: interpolación cúbica (4 nodos)
%
% Y voy a graficar ambos errores juntos para ver las diferencias visualmente

fprintf('=== EJERCICIO 3c: Comparación de errores relativos ===\n\n');

%% ============================================================================
%% CARGO LOS RESULTADOS DE 3a Y 3b
%% ============================================================================
% Si los ejercicios 3a y 3b no fueron ejecutados, ejecuto yo los cálculos aquí

fprintf('Cargando resultados de ejercicios anteriores...\n\n');

% Defino la función
f = @(x) x + 2./x;

%% Resultados del ejercicio 3a (interpolación cuadrática)
x_nodos_a = [1, 2, 2.5];
y_nodos_a = f(x_nodos_a);
x_eval = [0.75, 1.5];

% Evaluación con el polinomio cuadrático
P_aprox_a = lagran(x_eval, x_nodos_a, y_nodos_a);
f_real = f(x_eval);
error_rel_a = abs(f_real - P_aprox_a) ./ abs(f_real);

fprintf('Ejercicio 3a (3 nodos - grado 2):\n');
fprintf('  Error relativo en x=0.75: %.8f  (%.4f%%)\n', error_rel_a(1), error_rel_a(1)*100);
fprintf('  Error relativo en x=1.5:  %.8f  (%.4f%%)\n\n', error_rel_a(2), error_rel_a(2)*100);

%% Resultados del ejercicio 3b (interpolación cúbica)
x_nodos_b = [0.5, 1.5, 2, 2.5];
y_nodos_b = f(x_nodos_b);

% Evaluación con el polinomio cúbico
P_aprox_b = lagran(x_eval, x_nodos_b, y_nodos_b);
error_rel_b = abs(f_real - P_aprox_b) ./ abs(f_real);

fprintf('Ejercicio 3b (4 nodos - grado 3):\n');
fprintf('  Error relativo en x=0.75: %.8f  (%.4f%%)\n', error_rel_b(1), error_rel_b(1)*100);
fprintf('  Error relativo en x=1.5:  %.8f  (%.4f%%)\n\n', error_rel_b(2), error_rel_b(2)*100);

%% ============================================================================
%% COMPARACIÓN NUMÉRICA
%% ============================================================================
fprintf('=== COMPARACIÓN DETALLADA ===\n\n');

fprintf('EN x = 0.75:\n');
fprintf('  Interpolación cuadrática (3 nodos): %.8f\n', error_rel_a(1));
fprintf('  Interpolación cúbica (4 nodos):     %.8f\n', error_rel_b(1));
fprintf('  Mejora (factor): %.2f veces\n', error_rel_a(1) / error_rel_b(1));
fprintf('  Reducción: %.2f%%\n\n', (1 - error_rel_b(1)/error_rel_a(1))*100);

fprintf('EN x = 1.5:\n');
fprintf('  Interpolación cuadrática (3 nodos): %.8f\n', error_rel_a(2));
fprintf('  Interpolación cúbica (4 nodos):     %.8f\n', error_rel_b(2));

if error_rel_b(2) < 1e-10
    fprintf('  El error cúbico es prácticamente 0 (x=1.5 es un nodo)\n\n');
else
    fprintf('  Mejora (factor): %.2f veces\n\n', error_rel_a(2) / error_rel_b(2));
end

%% ============================================================================
%% GRÁFICA DE BARRAS COMPARATIVA
%% ============================================================================
fprintf('Creando gráfica comparativa...\n\n');

figure('Position', [100, 100, 1000, 600]);

% Datos para el gráfico de barras
categorias = {'x = 0.75', 'x = 1.5'};
errores_cuadratico = [error_rel_a(1), error_rel_a(2)];
errores_cubico = [error_rel_b(1), error_rel_b(2)];

% Posiciones de las barras
x_pos = 1:2;
ancho_barra = 0.35;

% Creo las barras
bar(x_pos - ancho_barra/2, errores_cuadratico, ancho_barra, ...
    'FaceColor', [0.8, 0.2, 0.2], 'DisplayName', 'Cuadrático (3 nodos)');
hold on;
bar(x_pos + ancho_barra/2, errores_cubico, ancho_barra, ...
    'FaceColor', [0.2, 0.6, 0.2], 'DisplayName', 'Cúbico (4 nodos)');

% Añado los valores encima de cada barra
for i = 1:2
    text(x_pos(i) - ancho_barra/2, errores_cuadratico(i) + 0.001, ...
         sprintf('%.4f', errores_cuadratico(i)), ...
         'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold');

    text(x_pos(i) + ancho_barra/2, errores_cubico(i) + 0.001, ...
         sprintf('%.4f', errores_cubico(i)), ...
         'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold');
end

% Configuración del gráfico
set(gca, 'XTick', x_pos, 'XTickLabel', categorias);
ylabel('Error relativo', 'FontSize', 13);
xlabel('Punto de evaluación', 'FontSize', 13);
title('Comparación de errores: Interpolación cuadrática vs cúbica', 'FontSize', 15);
legend('Location', 'northwest', 'FontSize', 12);
grid on;
hold off;

%% ============================================================================
%% GRÁFICA DE LÍNEAS: ERROR vs POSICIÓN
%% ============================================================================
% Voy a calcular el error en muchos puntos para ver cómo varía

fprintf('Creando gráfica de error continuo...\n\n');

% Genero muchos puntos para evaluar
x_continuo = linspace(0.5, 3, 200);

% Valores reales
f_real_cont = f(x_continuo);

% Aproximaciones con ambos polinomios
P_cuadratico = lagran(x_continuo, x_nodos_a, y_nodos_a);
P_cubico = lagran(x_continuo, x_nodos_b, y_nodos_b);

% Errores relativos
error_cuadratico = abs(f_real_cont - P_cuadratico) ./ abs(f_real_cont);
error_cubico = abs(f_real_cont - P_cubico) ./ abs(f_real_cont);

figure('Position', [150, 150, 1000, 600]);

% Grafico los errores
semilogy(x_continuo, error_cuadratico, 'r-', 'LineWidth', 2, ...
         'DisplayName', 'Error cuadrático (3 nodos)');
hold on;
semilogy(x_continuo, error_cubico, 'g-', 'LineWidth', 2, ...
         'DisplayName', 'Error cúbico (4 nodos)');

% Marco los nodos con líneas verticales
for i = 1:length(x_nodos_a)
    xline(x_nodos_a(i), 'r--', sprintf('Nodo %.1f', x_nodos_a(i)), ...
          'LineWidth', 1.5, 'LabelOrientation', 'horizontal', 'FontSize', 9);
end

for i = 1:length(x_nodos_b)
    xline(x_nodos_b(i), 'g:', sprintf('Nodo %.1f', x_nodos_b(i)), ...
          'LineWidth', 1.5, 'LabelOrientation', 'horizontal', 'FontSize', 9);
end

% Marco los puntos evaluados
plot(x_eval, error_rel_a, 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r', ...
     'DisplayName', 'Puntos eval. (cuadrático)');
plot(x_eval, error_rel_b, 'go', 'MarkerSize', 12, 'MarkerFaceColor', 'g', ...
     'DisplayName', 'Puntos eval. (cúbico)');

grid on;
xlabel('x', 'FontSize', 13);
ylabel('Error relativo (escala logarítmica)', 'FontSize', 13);
title('Error relativo vs posición para ambas interpolaciones', 'FontSize', 15);
legend('Location', 'best', 'FontSize', 11);
xlim([0.5, 3]);
hold off;

%% ============================================================================
%% CONCLUSIONES
%% ============================================================================
fprintf('=== CONCLUSIONES ===\n\n');

fprintf('1. EN x = 0.75:\n');
fprintf('   - El polinomio cúbico tiene ERROR %.2f VECES MENOR\n', error_rel_a(1)/error_rel_b(1));
fprintf('   - Razón: en el cuadrático es extrapolación, en el cúbico es interpolación\n\n');

fprintf('2. EN x = 1.5:\n');
fprintf('   - El polinomio cúbico tiene ERROR PRÁCTICAMENTE NULO\n');
fprintf('   - Razón: x=1.5 es uno de los nodos del polinomio cúbico\n\n');

fprintf('3. OBSERVACIÓN GENERAL:\n');
fprintf('   - Más nodos NO siempre significa menor error en todos lados\n');
fprintf('   - Lo importante es la DISTRIBUCIÓN de los nodos\n');
fprintf('   - El error es menor cerca de los nodos\n');
fprintf('   - El error puede crecer mucho en extrapolación\n\n');

fprintf('=== FIN EJERCICIO 3c ===\n');
