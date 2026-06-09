%% Ejercicio 5b - Actividad 9: Gráfica de población Argentina y explicación
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% Voy a crear una gráfica que muestre:
%   1. Los datos censales originales (puntos)
%   2. Las dos estimaciones del ejercicio 5a (1905 y 2020)
%   3. El polinomio interpolante completo en [1800, 2022]
%
% Luego voy a explicar por qué hay errores cuando se intenta extrapolar

fprintf('=== EJERCICIO 5b: Gráfica y explicación del error ===\n\n');

%% ============================================================================
%% CARGO LOS DATOS
%% ============================================================================

% Datos censales
anios = [1778, 1869, 1895, 1914, 1947, 1960, 1970, 1980, 1991, 2001, 2010, 2022];
poblacion = [0.19, 1.88, 4.09, 7.89, 15.89, 20.01, 23.36, 27.95, 32.62, 36.26, 40.12, 45.89];

% Estimaciones del ejercicio 5a
anio_1905 = 1905;
anio_2020 = 2020;
pob_1905 = lagran(anio_1905, anios, poblacion);
pob_2020 = lagran(anio_2020, anios, poblacion);

fprintf('Datos cargados:\n');
fprintf('  %d censos desde %d hasta %d\n', length(anios), anios(1), anios(end));
fprintf('  Estimaciones: 1905 (%.2f M) y 2020 (%.2f M)\n\n', pob_1905, pob_2020);

%% ============================================================================
%% CREO LA GRÁFICA
%% ============================================================================

fprintf('Creando gráfica para el intervalo [1800, 2022]...\n\n');

% Genero puntos para graficar el polinomio interpolante
anios_plot = linspace(1800, 2022, 500);  % 500 puntos para curva suave
poblacion_plot = lagran(anios_plot, anios, poblacion);

% Creo la figura
figure('Position', [100, 100, 1400, 800]);

%% Grafico el polinomio interpolante
plot(anios_plot, poblacion_plot, 'b-', 'LineWidth', 2, ...
     'DisplayName', 'Polinomio interpolante (Lagrange)');
hold on;

%% Grafico los datos censales originales
plot(anios, poblacion, 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'r', ...
     'LineWidth', 2, 'DisplayName', 'Datos censales');

%% Marco las estimaciones de 1905 y 2020
plot(anio_1905, pob_1905, 'ms', 'MarkerSize', 18, 'MarkerFaceColor', 'm', ...
     'LineWidth', 2, 'DisplayName', sprintf('Estimación 1905: %.2f M', pob_1905));

plot(anio_2020, pob_2020, 'gs', 'MarkerSize', 18, 'MarkerFaceColor', 'g', ...
     'LineWidth', 2, 'DisplayName', sprintf('Estimación 2020: %.2f M', pob_2020));

%% Añado etiquetas a las estimaciones
text(anio_1905, pob_1905 + 3, sprintf(' 1905\n %.2f M', pob_1905), ...
     'FontSize', 12, 'Color', 'm', 'FontWeight', 'bold', ...
     'HorizontalAlignment', 'center');

text(anio_2020, pob_2020 + 3, sprintf(' 2020\n %.2f M', pob_2020), ...
     'FontSize', 12, 'Color', 'g', 'FontWeight', 'bold', ...
     'HorizontalAlignment', 'center');

%% Añado líneas verticales en las estimaciones
xline(anio_1905, 'm--', 'LineWidth', 1.5);
xline(anio_2020, 'g--', 'LineWidth', 1.5);

%% Zona de extrapolación (antes del primer censo)
% Resalto la zona [1800, 1778] como extrapolación
patch([1800, 1778, 1778, 1800], [0, 0, 60, 60], 'r', ...
      'FaceAlpha', 0.1, 'EdgeColor', 'none', ...
      'DisplayName', 'Zona de extrapolación');

%% Configuración de la gráfica
grid on;
xlabel('Año', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Población (millones)', 'FontSize', 14, 'FontWeight', 'bold');
title('Población de Argentina: Datos censales e interpolación de Lagrange', ...
      'FontSize', 16, 'FontWeight', 'bold');
legend('Location', 'northwest', 'FontSize', 12);
xlim([1800, 2022]);
ylim([0, max(poblacion_plot) + 5]);

% Añado una línea en y=0 para referencia
yline(0, 'k-', 'LineWidth', 1);

hold off;

fprintf('Gráfica creada.\n\n');

%% ============================================================================
%% EXPLICACIÓN DEL ERROR EN EXTRAPOLACIÓN
%% ============================================================================

fprintf('========================================\n');
fprintf('EXPLICACIÓN DEL ERROR\n');
fprintf('========================================\n\n');

fprintf('📊 OBSERVACIONES EN LA GRÁFICA:\n\n');

fprintf('1. ZONA ROJA (Extrapolación hacia el pasado):\n');
fprintf('   - Antes de 1778 (primer censo), el polinomio es una EXTRAPOLACIÓN\n');
fprintf('   - Se puede observar comportamiento errático del polinomio\n');
fprintf('   - ⚠️  El polinomio puede dar valores NEGATIVOS o absurdos\n\n');

fprintf('2. ZONA BLANCA (Interpolación):\n');
fprintf('   - Entre 1778 y 2022, el polinomio es una INTERPOLACIÓN\n');
fprintf('   - Pasa exactamente por todos los puntos censales\n');
fprintf('   - Las estimaciones 1905 y 2020 están en esta zona → son confiables\n\n');

fprintf('3. MÁS ALLÁ DE 2022 (Extrapolación hacia el futuro):\n');
fprintf('   - Después de 2022, sería extrapolación\n');
fprintf('   - No es confiable para predicciones a largo plazo\n\n');

%% Análisis cuantitativo de la extrapolación
fprintf('--- ¿QUÉ PASA SI EXTRAPOLAMOS? ---\n\n');

% Evalúo el polinomio en años fuera del rango
anios_extrapolar = [1700, 1750, 2030, 2050, 2100];
pob_extrapolada = lagran(anios_extrapolar, anios, poblacion);

fprintf('Ejemplo de extrapolaciones (NO CONFIABLES):\n\n');

for i = 1:length(anios_extrapolar)
    if anios_extrapolar(i) < anios(1)
        tipo = 'PASADO';
    else
        tipo = 'FUTURO';
    end

    fprintf('  Año %d: %.2f millones  [%s]\n', ...
            anios_extrapolar(i), pob_extrapolada(i), tipo);

    if pob_extrapolada(i) < 0
        fprintf('    ⚠️  POBLACIÓN NEGATIVA - Sin sentido físico!\n');
    elseif pob_extrapolada(i) > 100
        fprintf('    ⚠️  VALOR EXAGERADAMENTE ALTO - Poco realista!\n');
    end
    fprintf('\n');
end

%% ============================================================================
%% EXPLICACIÓN TEÓRICA
%% ============================================================================

fprintf('========================================\n');
fprintf('¿POR QUÉ FALLA LA EXTRAPOLACIÓN?\n');
fprintf('========================================\n\n');

fprintf('1. NATURALEZA DE LOS POLINOMIOS:\n');
fprintf('   - Los polinomios de alto grado tienden a oscilar mucho\n');
fprintf('   - Fuera del rango de datos, estas oscilaciones se amplifican\n');
fprintf('   - Un polinomio de grado 11 (12 puntos) es muy oscilatorio\n\n');

fprintf('2. EL POLINOMIO NO CONOCE EL FENÓMENO:\n');
fprintf('   - El crecimiento poblacional sigue leyes demográficas\n');
fprintf('   - El polinomio solo "conecta puntos" sin entender la física\n');
fprintf('   - No tiene información sobre nacimientos, mortalidad, etc.\n\n');

fprintf('3. FALTA DE DATOS:\n');
fprintf('   - En 1700 no hay censos → el polinomio "adivina"\n');
fprintf('   - En 2100 no hay datos → el polinomio "inventa"\n');
fprintf('   - Sin datos, cualquier predicción es especulación\n\n');

fprintf('4. MODELOS APROPIADOS:\n');
fprintf('   - Para población se usan modelos exponenciales o logísticos\n');
fprintf('   - Estos modelos SÍ capturan la dinámica poblacional\n');
fprintf('   - Ejemplo: P(t) = P_0 × e^(r×t)  (crecimiento exponencial)\n\n');

%% ============================================================================
%% CONCLUSIONES
%% ============================================================================

fprintf('========================================\n');
fprintf('CONCLUSIONES\n');
fprintf('========================================\n\n');

fprintf('✓ La interpolación de Lagrange funciona MUY BIEN dentro del rango\n');
fprintf('  de datos (1778-2022):\n');
fprintf('  - Estimación 1905: %.2f M (razonable)\n', pob_1905);
fprintf('  - Estimación 2020: %.2f M (precisa)\n\n', pob_2020);

fprintf('✗ La extrapolación de Lagrange NO ES CONFIABLE fuera del rango:\n');
fprintf('  - Puede dar valores negativos o exageradamente altos\n');
fprintf('  - No captura la dinámica real del fenómeno\n');
fprintf('  - No debe usarse para predicciones a largo plazo\n\n');

fprintf('💡 MORALEJA:\n');
fprintf('  La interpolación es una herramienta poderosa para ESTIMAR valores\n');
fprintf('  DENTRO del rango de datos conocidos, pero NO para PREDECIR el futuro\n');
fprintf('  o RECONSTRUIR el pasado lejano sin datos.\n\n');

fprintf('=== FIN EJERCICIO 5b ===\n');
