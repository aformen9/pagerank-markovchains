%% Ejercicio 4b - Actividad 9: Error de interpolación y su cota teórica
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% En el ejercicio 4a grafiqué sen(x) y su polinomio interpolante.
% Ahora voy a:
%   1. Calcular el ERROR cometido: |sen(x) - P(x)|
%   2. Calcular una COTA TEÓRICA del error
%   3. Graficar ambos para compararlos

fprintf('=== EJERCICIO 4b: Error de interpolación y cota teórica ===\n\n');

%% ============================================================================
%% CARGO LOS DATOS DEL EJERCICIO 4a
%% ============================================================================

fprintf('Cargando datos del ejercicio 4a...\n\n');

% Si el ejercicio 4a no fue ejecutado, defino los datos aquí
a = 0;
b = 2*pi;
n = 5;
x_nodos = linspace(a, b, n);
y_nodos = sin(x_nodos);

fprintf('Intervalo: [0, 2π]\n');
fprintf('Nodos: %d puntos equiespaciados\n', n);
fprintf('Grado del polinomio: %d\n\n', n-1);

%% ============================================================================
%% PASO 1: CALCULO EL ERROR REAL
%% ============================================================================

fprintf('--- Cálculo del error real ---\n\n');

% Genero muchos puntos para calcular el error en todo el intervalo
x_continuo = linspace(a, b, 500);

% Valores reales de sen(x)
y_real = sin(x_continuo);

% Valores del polinomio interpolante
y_poly = lagran(x_continuo, x_nodos, y_nodos);

% ERROR ABSOLUTO: |f(x) - P(x)|
error_real = abs(y_real - y_poly);

fprintf('Error calculado en 500 puntos del intervalo.\n\n');

%% Encuentro el error máximo
[error_max, idx_max] = max(error_real);
x_error_max = x_continuo(idx_max);

fprintf('Error máximo:\n');
fprintf('  |sen(x) - P_4(x)|_max = %.8f\n', error_max);
fprintf('  Ocurre aproximadamente en x = %.6f  (%.4f×π)\n\n', ...
        x_error_max, x_error_max/pi);

%% ============================================================================
%% PASO 2: CALCULO LA COTA TEÓRICA DEL ERROR
%% ============================================================================

fprintf('--- Cálculo de la cota teórica del error ---\n\n');

fprintf('📚 TEORÍA DEL ERROR DE INTERPOLACIÓN:\n\n');
fprintf('Para un polinomio interpolante P_n(x) de grado n:\n\n');
fprintf('  |f(x) - P_n(x)| ≤ (M_{n+1} / (n+1)!) × |ω(x)|\n\n');
fprintf('donde:\n');
fprintf('  - M_{n+1} = max |f^(n+1)(x)| en [a,b]\n');
fprintf('  - ω(x) = (x - x_0)(x - x_1)...(x - x_n)\n');
fprintf('  - (n+1)! es el factorial de n+1\n\n');

%% Paso 2a: Calculo M_5 (máximo de la derivada de orden 5)
fprintf('Paso 1: Calcular M_5\n\n');

fprintf('Para f(x) = sen(x), las derivadas son:\n');
fprintf('  f(x)      = sen(x)\n');
fprintf('  f''(x)     = cos(x)\n');
fprintf('  f''''(x)    = -sen(x)\n');
fprintf('  f''''''(x)   = -cos(x)\n');
fprintf('  f^(4)(x)  = sen(x)\n');
fprintf('  f^(5)(x)  = cos(x)  <- Esta es la derivada de orden n+1 = 5\n\n');

fprintf('El máximo de |cos(x)| en cualquier intervalo es 1.\n');
fprintf('Por lo tanto: M_5 = 1\n\n');

M_5 = 1;

%% Paso 2b: Calculo (n+1)!
fprintf('Paso 2: Calcular (n+1)!\n\n');

n_grado = 4;  % Grado del polinomio
factorial_n1 = factorial(n_grado + 1);

fprintf('  n = %d (grado del polinomio)\n', n_grado);
fprintf('  (n+1)! = %d! = %d\n\n', n_grado+1, factorial_n1);

%% Paso 2c: Calculo ω(x) = producto de (x - x_i)
fprintf('Paso 3: Calcular ω(x) = (x - x_0)(x - x_1)(x - x_2)(x - x_3)(x - x_4)\n\n');

fprintf('Para cada punto x en el intervalo, calculo:\n');
fprintf('  ω(x) = |x - %.4f| × |x - %.4f| × ... × |x - %.4f|\n\n', ...
        x_nodos(1), x_nodos(2), x_nodos(5));

% Calculo el producto para cada x
omega = ones(size(x_continuo));  % Inicializo en 1
for i = 1:n
    omega = omega .* abs(x_continuo - x_nodos(i));
end

fprintf('Producto ω(x) calculado en 500 puntos.\n\n');

%% Paso 2d: Calculo la cota
fprintf('Paso 4: Calcular la cota del error\n\n');

cota_error = (M_5 / factorial_n1) * omega;

fprintf('  Cota = (M_5 / (n+1)!) × |ω(x)|\n');
fprintf('  Cota = (1 / %d) × |ω(x)|\n', factorial_n1);
fprintf('  Cota = |ω(x)| / %d\n\n', factorial_n1);

% Encuentro el máximo de la cota
[cota_max, idx_cota_max] = max(cota_error);
x_cota_max = x_continuo(idx_cota_max);

fprintf('Cota máxima:\n');
fprintf('  Cota_max = %.8f\n', cota_max);
fprintf('  Ocurre aproximadamente en x = %.6f  (%.4f×π)\n\n', ...
        x_cota_max, x_cota_max/pi);

%% ============================================================================
%% PASO 3: VERIFICO QUE LA COTA ES VÁLIDA
%% ============================================================================

fprintf('--- Verificación ---\n\n');

fprintf('La cota DEBE ser mayor o igual que el error real en todos los puntos.\n\n');

% Verifico si la cota es mayor que el error en todos los puntos
diferencia = cota_error - error_real;
diferencia_min = min(diferencia);

if diferencia_min >= -1e-10  % Considero errores de redondeo numérico
    fprintf('✓ Verificación exitosa: Cota ≥ Error en todos los puntos.\n');
    fprintf('  Diferencia mínima: %.2e\n\n', diferencia_min);
else
    fprintf('⚠️  Advertencia: En algunos puntos el error supera la cota.\n');
    fprintf('  Esto puede deberse a errores numéricos.\n\n');
end

%% ============================================================================
%% PASO 4: CREO LA GRÁFICA DEL ERROR Y LA COTA
%% ============================================================================

fprintf('Creando gráfica del error y su cota...\n\n');

figure('Position', [150, 150, 1200, 700]);

%% Grafico el error real
plot(x_continuo, error_real, 'r-', 'LineWidth', 2.5, ...
     'DisplayName', 'Error real: |sen(x) - P_4(x)|');
hold on;

%% Grafico la cota teórica
plot(x_continuo, cota_error, 'b--', 'LineWidth', 2, ...
     'DisplayName', 'Cota teórica: M_5/(n+1)! × |ω(x)|');

%% Marco el error máximo
plot(x_error_max, error_max, 'ro', 'MarkerSize', 14, 'MarkerFaceColor', 'r', ...
     'DisplayName', sprintf('Error máximo = %.4f', error_max));
text(x_error_max, error_max + 0.01, sprintf('  Error max\n  x≈%.2fπ', x_error_max/pi), ...
     'FontSize', 11, 'Color', 'r', 'FontWeight', 'bold');

%% Marco los nodos (donde el error es 0)
plot(x_nodos, zeros(size(x_nodos)), 'go', 'MarkerSize', 12, 'MarkerFaceColor', 'g', ...
     'DisplayName', 'Nodos (error = 0)');

%% Añado líneas verticales en los nodos
for i = 1:n
    xline(x_nodos(i), 'g:', 'LineWidth', 1.2);
end

%% Líneas de referencia
xline(pi/2, '--', 'π/2', 'LineWidth', 0.8, 'Color', [0.6, 0.6, 0.6], ...
      'LabelOrientation', 'horizontal', 'FontSize', 9);
xline(pi, '--', 'π', 'LineWidth', 0.8, 'Color', [0.6, 0.6, 0.6], ...
      'LabelOrientation', 'horizontal', 'FontSize', 9);
xline(3*pi/2, '--', '3π/2', 'LineWidth', 0.8, 'Color', [0.6, 0.6, 0.6], ...
      'LabelOrientation', 'horizontal', 'FontSize', 9);

%% Configuración de ejes y leyenda
grid on;
xlabel('x', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Error', 'FontSize', 14, 'FontWeight', 'bold');
title('Error de interpolación y cota teórica para sen(x)', 'FontSize', 16, 'FontWeight', 'bold');
legend('Location', 'north', 'FontSize', 12);
xlim([a, b]);
ylim([0, max(cota_error)*1.1]);

% Configuro ticks del eje x
set(gca, 'XTick', [0, pi/2, pi, 3*pi/2, 2*pi]);
set(gca, 'XTickLabel', {'0', 'π/2', 'π', '3π/2', '2π'});

hold off;

%% ============================================================================
%% OBSERVACIONES
%% ============================================================================
fprintf('=== OBSERVACIONES DE LA GRÁFICA ===\n\n');

fprintf('1. ✓ La cota teórica (línea azul) está SIEMPRE por encima\n');
fprintf('     del error real (línea roja). Esto confirma la teoría.\n\n');

fprintf('2. 🎯 El error es CERO en los 5 nodos (círculos verdes).\n');
fprintf('     Esto es correcto porque el polinomio pasa por esos puntos.\n\n');

fprintf('3. 📈 El error es MAYOR en las regiones ALEJADAS de los nodos.\n');
fprintf('     Por ejemplo, entre nodos consecutivos.\n\n');

fprintf('4. 🔍 El error máximo (%.4f) ocurre alrededor de x ≈ %.2fπ\n', ...
        error_max, x_error_max/pi);
fprintf('     que está aproximadamente a mitad de camino entre dos nodos.\n\n');

fprintf('5. 📊 La cota no es muy "ajustada" (tight) al error real:\n');
fprintf('     - Cota máxima: %.4f\n', cota_max);
fprintf('     - Error máximo: %.4f\n', error_max);
fprintf('     - Ratio cota/error: %.2f\n\n', cota_max/error_max);

fprintf('6. 💡 Para reducir el error podríamos:\n');
fprintf('     a) Usar más nodos (mayor grado de polinomio)\n');
fprintf('     b) Usar nodos de Chebyshev en lugar de equiespaciados\n');
fprintf('     c) Usar interpolación a trozos (splines)\n\n');

fprintf('=== FIN EJERCICIO 4b ===\n');
