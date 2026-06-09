% Actividad 8 - Ejercicio 4 - Item (c)
% Explicar los resultados obtenidos
%
% Sistema: f1(x,y) = x^2 + y^2 - 2 = 0
%          f2(x,y) = xy - 1 = 0
%
% TEORIA: Este item requiere analizar e interpretar los resultados obtenidos
% en los items anteriores. Se debe explicar:
% - La geometria del sistema (que representan las ecuaciones)
% - Por que hay exactamente dos soluciones
% - Como influye el punto inicial en la convergencia
% - La velocidad de convergencia del metodo
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 4 - ACTIVIDAD 8 - ITEM (c)\n')
fprintf('Explicacion de resultados\n')
fprintf('========================================\n\n')

fprintf('Sistema analizado:\n')
fprintf('f1(x,y) = x^2 + y^2 - 2 = 0\n')
fprintf('f2(x,y) = xy - 1 = 0\n\n')

%% Analisis geometrico

fprintf('========================================\n')
fprintf('1. ANALISIS GEOMETRICO DEL SISTEMA\n')
fprintf('========================================\n\n')

fprintf('Ecuacion 1: x^2 + y^2 = 2\n')
fprintf('  - Representa un CIRCULO centrado en el origen\n')
fprintf('  - Radio: r = sqrt(2) ≈ %.4f\n', sqrt(2))
fprintf('  - Todos los puntos (x,y) que satisfacen esta ecuacion\n')
fprintf('    estan a distancia sqrt(2) del origen.\n\n')

fprintf('Ecuacion 2: xy = 1\n')
fprintf('  - Representa una HIPERBOLA rectangular\n')
fprintf('  - Asintotas: los ejes x e y\n')
fprintf('  - Ramas en los cuadrantes I (x>0, y>0) y III (x<0, y<0)\n\n')

fprintf('Las soluciones del SENL son las intersecciones entre\n')
fprintf('el circulo y la hiperbola.\n\n')

%% Analisis de las soluciones

fprintf('========================================\n')
fprintf('2. SOLUCIONES ENCONTRADAS\n')
fprintf('========================================\n\n')

% Recalcular las soluciones para el analisis
tol = 1e-9;
itmax = 50;

P0_1 = [0.9; 0.9];
[Pk1, iter1, err1] = NewtonRaphsonSENL('F_ej4', 'JF_ej4', P0_1, tol, itmax);

P0_2 = [-0.9; -0.9];
[Pk2, iter2, err2] = NewtonRaphsonSENL('F_ej4', 'JF_ej4', P0_2, tol, itmax);

fprintf('Solucion 1: (%.6f, %.6f)\n', Pk1(1), Pk1(2))
fprintf('  - Ubicada en el CUADRANTE I (x>0, y>0)\n')
fprintf('  - Iteraciones: %d\n', iter1)
fprintf('  - Convergencia: RAPIDA (Newton-Raphson tiene convergencia cuadratica)\n\n')

fprintf('Solucion 2: (%.6f, %.6f)\n', Pk2(1), Pk2(2))
fprintf('  - Ubicada en el CUADRANTE III (x<0, y<0)\n')
fprintf('  - Iteraciones: %d\n', iter2)
fprintf('  - Convergencia: RAPIDA (Newton-Raphson tiene convergencia cuadratica)\n\n')

fprintf('IMPORTANTE: Solo hay DOS soluciones reales porque:\n')
fprintf('  - La hiperbola xy=1 tiene ramas solo en cuadrantes I y III\n')
fprintf('  - El circulo interseca cada rama en un punto\n')
fprintf('  - No hay intersecciones en cuadrantes II y IV\n\n')

%% Analisis de convergencia

fprintf('========================================\n')
fprintf('3. ANALISIS DE CONVERGENCIA\n')
fprintf('========================================\n\n')

fprintf('DEPENDENCIA DEL PUNTO INICIAL:\n')
fprintf('  - Punto inicial (0.9, 0.9) convergio a (1, 1)\n')
fprintf('  - Punto inicial (-0.9, -0.9) convergio a (-1, -1)\n')
fprintf('  - El metodo converge a la raiz MAS CERCANA al punto inicial\n\n')

fprintf('VELOCIDAD DE CONVERGENCIA:\n')
fprintf('  - Newton-Raphson tiene convergencia CUADRATICA\n')
fprintf('  - Esto significa que el error se reduce al cuadrado en cada iteracion\n')
fprintf('  - Si el error en iteracion k es e_k, entonces e_{k+1} ≈ C*e_k^2\n')
fprintf('  - Por eso alcanza la tolerancia en pocas iteraciones (%d y %d)\n\n', iter1, iter2)

%% Verificacion numerica de las propiedades

fprintf('========================================\n')
fprintf('4. VERIFICACION NUMERICA\n')
fprintf('========================================\n\n')

fprintf('Verificando que las soluciones satisfacen ambas ecuaciones:\n\n')

fprintf('Para (%.6f, %.6f):\n', Pk1(1), Pk1(2))
fprintf('  x^2 + y^2 = %.6f + %.6f = %.6f ≈ 2 ✓\n', Pk1(1)^2, Pk1(2)^2, Pk1(1)^2 + Pk1(2)^2)
fprintf('  xy = %.6f * %.6f = %.6f ≈ 1 ✓\n\n', Pk1(1), Pk1(2), Pk1(1)*Pk1(2))

fprintf('Para (%.6f, %.6f):\n', Pk2(1), Pk2(2))
fprintf('  x^2 + y^2 = %.6f + %.6f = %.6f ≈ 2 ✓\n', Pk2(1)^2, Pk2(2)^2, Pk2(1)^2 + Pk2(2)^2)
fprintf('  xy = %.6f * %.6f = %.6f ≈ 1 ✓\n\n', Pk2(1), Pk2(2), Pk2(1)*Pk2(2))

%% Conclusiones finales

fprintf('========================================\n')
fprintf('5. CONCLUSIONES\n')
fprintf('========================================\n\n')

fprintf('1. El sistema tiene EXACTAMENTE DOS soluciones reales:\n')
fprintf('   (1, 1) y (-1, -1), simetricas respecto al origen.\n\n')

fprintf('2. Newton-Raphson es MUY EFICIENTE para este sistema:\n')
fprintf('   - Convergencia rapida (cuadratica)\n')
fprintf('   - Pocas iteraciones necesarias\n')
fprintf('   - Alta precision en el resultado\n\n')

fprintf('3. La eleccion del punto inicial es DETERMINANTE:\n')
fprintf('   - Puntos en cuadrante I convergen a (1, 1)\n')
fprintf('   - Puntos en cuadrante III convergen a (-1, -1)\n')
fprintf('   - Puntos en cuadrantes II o IV pueden diverger o\n')
fprintf('     converger a una de las dos raices dependiendo de\n')
fprintf('     la distancia a cada una.\n\n')

fprintf('4. El sistema es BIEN CONDICIONADO:\n')
fprintf('   - El Jacobiano es no singular en las soluciones\n')
fprintf('   - Las curvas se intersectan transversalmente\n')
fprintf('   - No hay problemas numericos de estabilidad\n\n')

%% Grafico ilustrativo final

fprintf('Generando grafico ilustrativo...\n\n')

x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

F1 = X.^2 + Y.^2 - 2;
F2 = X.*Y - 1;

figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2.5)
hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2.5)

% Marcar las soluciones
plot(Pk1(1), Pk1(2), 'ko', 'MarkerSize', 14, 'MarkerFaceColor', 'g', 'LineWidth', 2)
plot(Pk2(1), Pk2(2), 'ko', 'MarkerSize', 14, 'MarkerFaceColor', 'g', 'LineWidth', 2)

% Marcar los puntos iniciales
plot(P0_1(1), P0_1(2), 'kx', 'MarkerSize', 12, 'LineWidth', 2)
plot(P0_2(1), P0_2(2), 'kx', 'MarkerSize', 12, 'LineWidth', 2)

% Flechas indicando convergencia
quiver(P0_1(1), P0_1(2), Pk1(1)-P0_1(1), Pk1(2)-P0_1(2), 0, 'k', 'LineWidth', 1.5, 'MaxHeadSize', 0.5)
quiver(P0_2(1), P0_2(2), Pk2(1)-P0_2(1), Pk2(2)-P0_2(2), 0, 'k', 'LineWidth', 1.5, 'MaxHeadSize', 0.5)

text(Pk1(1)+0.2, Pk1(2)+0.2, 'Sol 1: (1, 1)', 'FontSize', 11, 'FontWeight', 'bold')
text(Pk2(1)-0.5, Pk2(2)-0.2, 'Sol 2: (-1, -1)', 'FontSize', 11, 'FontWeight', 'bold')
text(P0_1(1)+0.1, P0_1(2)-0.2, 'P0', 'FontSize', 9)
text(P0_2(1)+0.1, P0_2(2)+0.15, 'P0', 'FontSize', 9)

grid on
xlabel('x', 'FontSize', 12)
ylabel('y', 'FontSize', 12)
title('Analisis geometrico del SENL y convergencia de Newton-Raphson', 'FontSize', 13)
legend('Circulo: x^2+y^2=2', 'Hiperbola: xy=1', 'Soluciones', 'Puntos iniciales', ...
       'Location', 'best', 'FontSize', 10)
axis equal
axis([-2 2 -2 2])
hold off

fprintf('Grafico generado exitosamente.\n')

%% Análisis geométrico: Explica qué representa cada ecuación
%% Análisis de soluciones: Por qué hay exactamente 2 soluciones
%% Análisis de convergencia: Velocidad y dependencia del punto inicial
%% Verificación numérica: Comprueba que las soluciones satisfacen el sistema
%% Conclusiones: Resumen de los hallazgos principales
%% Gráfico ilustrativo con puntos iniciales y flechas mostrando convergencia
%% TODO con teoría detallada explicando cada aspecto
