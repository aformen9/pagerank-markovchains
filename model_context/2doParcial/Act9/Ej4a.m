%% Ejercicio 4a - Actividad 9: Gráfica de sen(x) y su interpolante
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% Voy a aproximar la función sen(x) en el intervalo [0, 2π] usando:
%   - Un polinomio interpolante de grado ≤ 4
%   - 5 nodos equiespaciados (5 puntos → polinomio de grado 4)
%
% Luego voy a graficar:
%   - La función seno real
%   - El polinomio interpolante
%   - Los 5 nodos usados

fprintf('=== EJERCICIO 4a: Aproximación de sen(x) en [0, 2π] ===\n\n');

%% ============================================================================
%% PASO 1: DEFINO EL INTERVALO Y LOS NODOS
%% ============================================================================

fprintf('--- Configuración del problema ---\n\n');

a = 0;      % Límite inferior del intervalo
b = 2*pi;   % Límite superior (2π ≈ 6.2832)
n = 5;      % Número de nodos

fprintf('Intervalo: [0, 2π] = [0, %.4f]\n', b);
fprintf('Número de nodos: %d\n', n);
fprintf('Grado del polinomio: %d (máximo)\n\n', n-1);

%% Genero los 5 nodos equiespaciados
% "Equiespaciados" significa que están distribuidos uniformemente
% con la misma distancia entre nodos consecutivos

x_nodos = linspace(a, b, n);  % linspace genera n puntos equiespaciados

fprintf('Nodos equiespaciados:\n');
for i = 1:n
    fprintf('  Nodo %d: x = %.6f  (%.4f×π)\n', i, x_nodos(i), x_nodos(i)/pi);
end
fprintf('\n');

%% Calculo la distancia entre nodos
distancia = x_nodos(2) - x_nodos(1);
fprintf('Distancia entre nodos consecutivos: %.6f  (π/2)\n\n', distancia);

%% ============================================================================
%% PASO 2: EVALÚO LA FUNCIÓN SENO EN LOS NODOS
%% ============================================================================

y_nodos = sin(x_nodos);  % sen(x) en cada nodo

fprintf('Valores de sen(x) en los nodos:\n');
for i = 1:n
    fprintf('  sen(%.6f) = %.8f\n', x_nodos(i), y_nodos(i));
end
fprintf('\n');

%% ============================================================================
%% PASO 3: CONSTRUYO EL POLINOMIO INTERPOLANTE
%% ============================================================================

fprintf('Construyendo el polinomio interpolante de Lagrange...\n');
fprintf('(usando la función lagran.m)\n\n');

%% Para graficar, necesito evaluar el polinomio en muchos puntos
x_plot = linspace(a, b, 500);  % 500 puntos para una curva suave

% Función seno real
y_seno = sin(x_plot);

% Polinomio interpolante evaluado en todos los puntos
y_poly = lagran(x_plot, x_nodos, y_nodos);

fprintf('Polinomio interpolante construido.\n');
fprintf('Evaluado en 500 puntos para graficar suavemente.\n\n');

%% ============================================================================
%% PASO 4: CREO LA GRÁFICA
%% ============================================================================

fprintf('Creando gráfica...\n\n');

figure('Position', [100, 100, 1200, 700]);

%% Grafico la función seno (línea azul continua)
plot(x_plot, y_seno, 'b-', 'LineWidth', 3, 'DisplayName', 'sen(x) - Función real');
hold on;

%% Grafico el polinomio interpolante (línea roja punteada)
plot(x_plot, y_poly, 'r--', 'LineWidth', 2.5, 'DisplayName', 'P_4(x) - Polinomio interpolante');

%% Marco los 5 nodos con círculos grandes
plot(x_nodos, y_nodos, 'ko', 'MarkerSize', 14, 'MarkerFaceColor', 'g', ...
     'DisplayName', 'Nodos de interpolación', 'LineWidth', 2);

%% Añado etiquetas a cada nodo
for i = 1:n
    % Calculo la posición de la etiqueta (un poco arriba del punto)
    offset = 0.12;
    if y_nodos(i) < 0
        offset = -0.18;  % Si el punto está abajo, la etiqueta va más abajo
    end

    % Creo el texto de la etiqueta
    if x_nodos(i) == 0
        texto_label = 'x_0 = 0';
    elseif abs(x_nodos(i) - pi) < 0.01
        texto_label = 'x_2 = π';
    elseif abs(x_nodos(i) - 2*pi) < 0.01
        texto_label = 'x_4 = 2π';
    else
        texto_label = sprintf('x_%d = %.2fπ', i-1, x_nodos(i)/pi);
    end

    text(x_nodos(i), y_nodos(i) + offset, texto_label, ...
         'FontSize', 11, 'HorizontalAlignment', 'center', ...
         'FontWeight', 'bold', 'Color', [0, 0.5, 0]);
end

%% Añado líneas verticales en los nodos para mejor visualización
for i = 1:n
    plot([x_nodos(i), x_nodos(i)], [-1.2, 1.2], 'k:', 'LineWidth', 0.8);
end

%% Marco puntos especiales: π/2, π, 3π/2
xline(pi/2, '--', 'π/2', 'LineWidth', 1, 'LabelOrientation', 'horizontal', ...
      'Color', [0.5, 0.5, 0.5], 'FontSize', 10);
xline(pi, '--', 'π', 'LineWidth', 1, 'LabelOrientation', 'horizontal', ...
      'Color', [0.5, 0.5, 0.5], 'FontSize', 10);
xline(3*pi/2, '--', '3π/2', 'LineWidth', 1, 'LabelOrientation', 'horizontal', ...
      'Color', [0.5, 0.5, 0.5], 'FontSize', 10);

%% Línea horizontal en y = 0
yline(0, 'k-', 'LineWidth', 1);

%% Configuración de los ejes y leyenda
grid on;
xlabel('x', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('y', 'FontSize', 14, 'FontWeight', 'bold');
title('Aproximación de sen(x) mediante interpolación polinomial de grado 4', ...
      'FontSize', 16, 'FontWeight', 'bold');
legend('Location', 'southeast', 'FontSize', 13);
xlim([a, b]);
ylim([-1.3, 1.3]);

% Configuro los ticks del eje x para mostrar múltiplos de π
set(gca, 'XTick', [0, pi/2, pi, 3*pi/2, 2*pi]);
set(gca, 'XTickLabel', {'0', 'π/2', 'π', '3π/2', '2π'});

hold off;

%% ============================================================================
%% OBSERVACIONES EN LA GRÁFICA
%% ============================================================================
fprintf('=== OBSERVACIONES EN LA GRÁFICA ===\n\n');

fprintf('1. ✓ El polinomio interpolante (línea roja) pasa EXACTAMENTE\n');
fprintf('     por los 5 nodos (círculos verdes).\n\n');

fprintf('2. ⚠️  El polinomio se aproxima bien a sen(x) CERCA de los nodos,\n');
fprintf('     pero puede tener mayor error LEJOS de los nodos.\n\n');

fprintf('3. 📊 Entre x = 0 y x = π/2, la aproximación es bastante buena.\n\n');

fprintf('4. ⚠️  Entre x = π y x = 2π, se observa que el polinomio\n');
fprintf('     se "aleja" un poco más de la función seno.\n\n');

fprintf('5. 🔍 Un polinomio de grado 4 NO puede capturar perfectamente\n');
fprintf('     el comportamiento oscilatorio completo de sen(x) en [0, 2π].\n\n');

fprintf('6. 💡 Si quisiéramos mejor aproximación, necesitaríamos:\n');
fprintf('     - Más nodos (polinomio de mayor grado), o\n');
fprintf('     - Usar interpolación a trozos (splines), o\n');
fprintf('     - Distribuir los nodos de otra forma (nodos de Chebyshev)\n\n');

%% Guardo datos para el ejercicio 4b
save('datos_ej4.mat', 'x_nodos', 'y_nodos', 'a', 'b', 'n');

fprintf('Datos guardados para usar en el ejercicio 4b.\n\n');

fprintf('=== FIN EJERCICIO 4a ===\n');
