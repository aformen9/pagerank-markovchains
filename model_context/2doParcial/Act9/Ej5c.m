%% Ejercicio 5c - Actividad 9: Estimación de población en mi año de nacimiento
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc, close all % Limpio variables, pantalla y figuras

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% Voy a estimar la población de Argentina en mi año de nacimiento (2001)
% usando el polinomio interpolante de Lagrange.
%
% Como nací el 6 de diciembre de 2001, voy a usar el año 2001.

fprintf('=== EJERCICIO 5c: Población en mi año de nacimiento ===\n\n');

%% ============================================================================
%% DATOS PERSONALES
%% ============================================================================

mi_nombre = 'Agustín Formenti';
fecha_nacimiento = '6 de diciembre de 2001';
mi_anio = 2001;

fprintf('Datos personales:\n');
fprintf('  Nombre: %s\n', mi_nombre);
fprintf('  Fecha de nacimiento: %s\n', fecha_nacimiento);
fprintf('  Año de nacimiento: %d\n\n', mi_anio);

%% ============================================================================
%% DATOS CENSALES
%% ============================================================================

% Datos de población
anios = [1778, 1869, 1895, 1914, 1947, 1960, 1970, 1980, 1991, 2001, 2010, 2022];
poblacion = [0.19, 1.88, 4.09, 7.89, 15.89, 20.01, 23.36, 27.95, 32.62, 36.26, 40.12, 45.89];

fprintf('Datos censales disponibles:\n');
fprintf('  Número de censos: %d\n', length(anios));
fprintf('  Período: %d - %d\n\n', anios(1), anios(end));

%% ============================================================================
%% VERIFICACIÓN: ¿ES UN AÑO CENSAL?
%% ============================================================================

fprintf('--- Verificación ---\n\n');

% Verifico si mi año de nacimiento coincide con algún censo
es_anio_censal = ismember(mi_anio, anios);

if es_anio_censal
    fprintf('🎉 ¡Mi año de nacimiento (%d) ES un año censal!\n\n', mi_anio);

    % Encuentro la posición en el vector
    idx_censo = find(anios == mi_anio);
    pob_censo = poblacion(idx_censo);

    fprintf('Según el censo de %d:\n', mi_anio);
    fprintf('  Población: %.2f millones de habitantes\n\n', pob_censo);

    fprintf('📌 DATO ADICIONAL:\n');
    fprintf('   El censo de 2001 fue realizado por el INDEC.\n');
    fprintf('   Fecha del censo: 18 de noviembre de 2001\n');
    fprintf('   Población registrada: 36,260,130 habitantes\n\n');

else
    fprintf('Mi año de nacimiento (%d) NO es un año censal.\n', mi_anio);
    fprintf('Necesito usar interpolación para estimarlo.\n\n');
end

%% ============================================================================
%% ESTIMACIÓN CON INTERPOLACIÓN DE LAGRANGE
%% ============================================================================

fprintf('--- Estimación con interpolación de Lagrange ---\n\n');

% Uso lagran.m para evaluar el polinomio en mi año
pob_estimada = lagran(mi_anio, anios, poblacion);

fprintf('Población estimada mediante interpolación:\n');
fprintf('  Año: %d\n', mi_anio);
fprintf('  Población: %.2f millones\n', pob_estimada);
fprintf('  En formato entero: %d millones\n\n', round(pob_estimada));

%% ============================================================================
%% COMPARACIÓN CON EL DATO CENSAL
%% ============================================================================

if es_anio_censal
    fprintf('=== COMPARACIÓN ===\n\n');

    fprintf('Dato censal:           %.2f millones\n', pob_censo);
    fprintf('Estimación (Lagrange): %.2f millones\n', pob_estimada);

    % Calculo el error
    error_abs = abs(pob_censo - pob_estimada);
    error_rel = error_abs / pob_censo;

    fprintf('\nError de la estimación:\n');
    fprintf('  Error absoluto: %.8f millones\n', error_abs);
    fprintf('  Error relativo: %.10f  (%.8f%%)\n\n', error_rel, error_rel*100);

    if error_rel < 1e-10
        fprintf('✓ El error es PRÁCTICAMENTE CERO!\n\n');
        fprintf('Explicación:\n');
        fprintf('  Como 2001 es uno de los nodos del polinomio interpolante,\n');
        fprintf('  el polinomio DEBE pasar exactamente por ese punto.\n');
        fprintf('  Por lo tanto, P(2001) = f(2001) = %.2f millones.\n\n', pob_censo);
        fprintf('  El pequeño error (%.2e) se debe a errores de redondeo\n', error_abs);
        fprintf('  numérico en las operaciones de punto flotante.\n\n');
    else
        fprintf('⚠️  Hay una diferencia entre el dato censal y la estimación.\n\n');
    end
end

%% ============================================================================
%% CONTEXTO HISTÓRICO
%% ============================================================================

fprintf('========================================\n');
fprintf('CONTEXTO HISTÓRICO DE 2001\n');
fprintf('========================================\n\n');

fprintf('En el año 2001:\n\n');

fprintf('Argentina:\n');
fprintf('  • Crisis económica y social profunda\n');
fprintf('  • Corralito financiero (diciembre 2001)\n');
fprintf('  • Renuncia del presidente Fernando de la Rúa\n');
fprintf('  • Población: %.2f millones de habitantes\n\n', pob_censo);

fprintf('Mundo:\n');
fprintf('  • Ataques terroristas del 11 de septiembre en EE.UU.\n');
fprintf('  • Primera edición de Wikipedia\n');
fprintf('  • Lanzamiento del iPod de Apple\n');
fprintf('  • Población mundial: ~6.1 mil millones\n\n');

fprintf('Tecnología:\n');
fprintf('  • Internet dial-up era lo común\n');
fprintf('  • Teléfonos móviles básicos (sin smartphones)\n');
fprintf('  • Windows XP se lanzó ese año\n\n');

%% ============================================================================
%% GRÁFICA ESPECIAL: ZOOM EN MI AÑO
%% ============================================================================

fprintf('Creando gráfica con zoom en mi año de nacimiento...\n\n');

% Rango de años alrededor de mi nacimiento
rango_zoom = [1990, 2012];
anios_zoom = linspace(rango_zoom(1), rango_zoom(2), 300);
poblacion_zoom = lagran(anios_zoom, anios, poblacion);

% Creo la figura
figure('Position', [150, 150, 1200, 700]);

% Grafico el polinomio interpolante
plot(anios_zoom, poblacion_zoom, 'b-', 'LineWidth', 2.5, ...
     'DisplayName', 'Interpolación de Lagrange');
hold on;

% Datos censales en el rango
idx_rango = (anios >= rango_zoom(1)) & (anios <= rango_zoom(2));
plot(anios(idx_rango), poblacion(idx_rango), 'ko', 'MarkerSize', 12, ...
     'MarkerFaceColor', 'r', 'LineWidth', 2, 'DisplayName', 'Censos');

% Marco especialmente el año 2001
plot(mi_anio, pob_estimada, 'gs', 'MarkerSize', 20, 'MarkerFaceColor', [0, 0.8, 0.2], ...
     'LineWidth', 3, 'DisplayName', sprintf('Mi nacimiento (%d)', mi_anio));

% Añado una flecha y texto especial
text(mi_anio, pob_estimada + 2, sprintf('  ⭐ %d\n  %.2f M\n  (Agustín nació aquí)', ...
     mi_anio, pob_estimada), 'FontSize', 13, 'FontWeight', 'bold', ...
     'Color', [0, 0.6, 0], 'HorizontalAlignment', 'center');

% Línea vertical en mi año
xline(mi_anio, 'g--', 'LineWidth', 2);

% Etiquetas para los otros censos
for i = find(idx_rango)
    if anios(i) ~= mi_anio  % No pongo etiqueta en 2001 porque ya está
        text(anios(i), poblacion(i) - 1.5, sprintf('%d\n%.1f M', anios(i), poblacion(i)), ...
             'FontSize', 9, 'HorizontalAlignment', 'center', 'Color', [0.5, 0, 0]);
    end
end

grid on;
xlabel('Año', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Población (millones)', 'FontSize', 14, 'FontWeight', 'bold');
title(sprintf('Población de Argentina alrededor de %d (mi nacimiento)', mi_anio), ...
      'FontSize', 16, 'FontWeight', 'bold');
legend('Location', 'northwest', 'FontSize', 12);
xlim(rango_zoom);
ylim([30, 48]);

hold off;

%% ============================================================================
%% REFLEXIÓN PERSONAL
%% ============================================================================

fprintf('========================================\n');
fprintf('REFLEXIÓN PERSONAL\n');
fprintf('========================================\n\n');

fprintf('Cuando nací en %d, Argentina tenía %.2f millones de habitantes.\n\n', ...
        mi_anio, pob_censo);

fprintf('Hoy en 2025, la población es aproximadamente %.2f millones.\n\n', ...
        poblacion(end));

crecimiento_desde_mi_nacimiento = poblacion(end) - pob_censo;
porcentaje_crecimiento = (crecimiento_desde_mi_nacimiento / pob_censo) * 100;

fprintf('Desde mi nacimiento hasta hoy:\n');
fprintf('  • Han pasado %d años\n', 2025 - mi_anio);
fprintf('  • La población aumentó %.2f millones\n', crecimiento_desde_mi_nacimiento);
fprintf('  • Crecimiento: %.1f%%\n', porcentaje_crecimiento);
fprintf('  • En promedio: %.3f millones/año\n\n', crecimiento_desde_mi_nacimiento / (2025 - mi_anio));

fprintf('💭 Esto significa que:\n');
fprintf('   Cuando nací, éramos ~%.0f millones de argentinos.\n', pob_censo);
fprintf('   Hoy somos ~%.0f millones.\n', poblacion(end));
fprintf('   ¡Crecimos casi un %.0f%% en mi vida!\n\n', porcentaje_crecimiento);

%% ============================================================================
%% RESUMEN
%% ============================================================================

fprintf('========================================\n');
fprintf('RESUMEN\n');
fprintf('========================================\n\n');

fprintf('Pregunta: ¿Qué población estima el año de mi nacimiento?\n\n');

fprintf('Respuesta:\n');
fprintf('  Mi año de nacimiento: %d\n', mi_anio);
fprintf('  Población estimada: %.2f millones de habitantes\n\n', pob_estimada);

fprintf('Observación especial:\n');
fprintf('  Como 2001 es un año censal, el valor estimado coincide\n');
fprintf('  EXACTAMENTE con el dato del censo (dentro del error numérico).\n\n');

fprintf('Dato curioso:\n');
fprintf('  Soy parte de la generación que vivió:\n');
fprintf('  • La transición a la era digital\n');
fprintf('  • El auge de las redes sociales\n');
fprintf('  • La transformación tecnológica acelerada\n\n');

fprintf('=== FIN EJERCICIO 5c ===\n');
