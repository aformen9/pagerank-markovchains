%% Ejercicio 2b - Actividad 9: Término independiente usando Lagrange
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc % Limpio variables y pantalla

%% ============================================================================
%% ¿QUÉ VOY A HACER DIFERENTE?
%% ============================================================================
% En el ejercicio 2a encontré el término independiente (a0) resolviendo
% un sistema de ecuaciones completo para obtener TODOS los coeficientes.
%
% Ahora voy a usar un método más directo: como el término independiente
% es el valor del polinomio en x=0, es decir P(0) = a0, simplemente
% voy a evaluar el polinomio interpolante de Lagrange en x = 0.
%
% ¡Esto es más eficiente si solo me interesa a0!

fprintf('=== EJERCICIO 2b: Término independiente usando Lagrange ===\n\n');

%% ============================================================================
%% DATOS DEL PROBLEMA (LOS MISMOS QUE EN 2a)
%% ============================================================================

x_nodos = [-1, 1, 2];   % Coordenadas x
y_nodos = [16, 6, 10];  % Coordenadas y

fprintf('Puntos dados:\n');
for i = 1:3
    fprintf('  Punto %d: (x, y) = (%.0f, %.0f)\n', i, x_nodos(i), y_nodos(i));
end
fprintf('\n');

%% ============================================================================
%% RECORDATORIO: ¿QUÉ ES EL MÉTODO DE LAGRANGE?
%% ============================================================================
fprintf('=== MÉTODO DE LAGRANGE ===\n\n');

fprintf('El método de Lagrange construye el polinomio interpolante como:\n\n');
fprintf('  P(x) = L0(x)*y0 + L1(x)*y1 + L2(x)*y2\n\n');

fprintf('donde cada Li(x) es un polinomio base de Lagrange que cumple:\n');
fprintf('  Li(xj) = 1  si i = j\n');
fprintf('  Li(xj) = 0  si i ≠ j\n\n');

fprintf('La fórmula para Li(x) es:\n');
fprintf('  Li(x) = producto[(x - xj) / (xi - xj)]  para todo j ≠ i\n\n');

fprintf('En nuestro caso (3 puntos):\n\n');

fprintf('  L0(x) = [(x - x1)(x - x2)] / [(x0 - x1)(x0 - x2)]\n');
fprintf('  L1(x) = [(x - x0)(x - x2)] / [(x1 - x0)(x1 - x2)]\n');
fprintf('  L2(x) = [(x - x0)(x - x1)] / [(x2 - x0)(x2 - x1)]\n\n');

%% ============================================================================
%% ESTRATEGIA
%% ============================================================================
fprintf('=== ESTRATEGIA ===\n\n');
fprintf('Como queremos el término independiente, que es P(0), simplemente\n');
fprintf('voy a evaluar el polinomio de Lagrange en x = 0.\n\n');

fprintf('  P(0) = L0(0)*y0 + L1(0)*y1 + L2(0)*y2\n');
fprintf('  P(0) = L0(0)*16 + L1(0)*6 + L2(0)*10\n\n');

%% ============================================================================
%% CÁLCULO USANDO LA FUNCIÓN lagran.m
%% ============================================================================
fprintf('--- Cálculo usando lagran.m ---\n\n');

x_eval = 0;  % Quiero evaluar en x = 0

% Uso la función lagran.m que ya creamos
P_0 = lagran(x_eval, x_nodos, y_nodos);

fprintf('Usando la función lagran.m:\n');
fprintf('  P(0) = %.8f\n\n', P_0);

%% ============================================================================
%% CÁLCULO MANUAL (PASO A PASO)
%% ============================================================================
fprintf('--- Cálculo manual (para entender el proceso) ---\n\n');

% Calculo cada polinomio base de Lagrange evaluado en x = 0

fprintf('Paso 1: Calculo L0(0)\n');
fprintf('  L0(x) = [(x - x1)(x - x2)] / [(x0 - x1)(x0 - x2)]\n');
fprintf('  L0(0) = [(0 - 1)(0 - 2)] / [(-1 - 1)(-1 - 2)]\n');
fprintf('  L0(0) = [(-1)(-2)] / [(-2)(-3)]\n');
fprintf('  L0(0) = 2 / 6\n');

L0 = ((x_eval - x_nodos(2)) * (x_eval - x_nodos(3))) / ...
     ((x_nodos(1) - x_nodos(2)) * (x_nodos(1) - x_nodos(3)));

fprintf('  L0(0) = %.8f\n\n', L0);

fprintf('Paso 2: Calculo L1(0)\n');
fprintf('  L1(x) = [(x - x0)(x - x2)] / [(x1 - x0)(x1 - x2)]\n');
fprintf('  L1(0) = [(0 - (-1))(0 - 2)] / [(1 - (-1))(1 - 2)]\n');
fprintf('  L1(0) = [(1)(-2)] / [(2)(-1)]\n');
fprintf('  L1(0) = -2 / -2\n');

L1 = ((x_eval - x_nodos(1)) * (x_eval - x_nodos(3))) / ...
     ((x_nodos(2) - x_nodos(1)) * (x_nodos(2) - x_nodos(3)));

fprintf('  L1(0) = %.8f\n\n', L1);

fprintf('Paso 3: Calculo L2(0)\n');
fprintf('  L2(x) = [(x - x0)(x - x1)] / [(x2 - x0)(x2 - x1)]\n');
fprintf('  L2(0) = [(0 - (-1))(0 - 1)] / [(2 - (-1))(2 - 1)]\n');
fprintf('  L2(0) = [(1)(-1)] / [(3)(1)]\n');
fprintf('  L2(0) = -1 / 3\n');

L2 = ((x_eval - x_nodos(1)) * (x_eval - x_nodos(2))) / ...
     ((x_nodos(3) - x_nodos(1)) * (x_nodos(3) - x_nodos(2)));

fprintf('  L2(0) = %.8f\n\n', L2);

%% Verifico que suman 1 (propiedad de los polinomios de Lagrange)
suma_L = L0 + L1 + L2;
fprintf('Verificación: L0(0) + L1(0) + L2(0) = %.8f  (debe ser 1)\n\n', suma_L);

%% Calculo P(0)
fprintf('Paso 4: Calculo P(0)\n');
fprintf('  P(0) = L0(0)*y0 + L1(0)*y1 + L2(0)*y2\n');
fprintf('  P(0) = %.8f * 16 + %.8f * 6 + %.8f * 10\n', L0, L1, L2);
fprintf('  P(0) = %.8f + %.8f + %.8f\n', L0*16, L1*6, L2*10);

P_0_manual = L0*y_nodos(1) + L1*y_nodos(2) + L2*y_nodos(3);

fprintf('  P(0) = %.8f\n\n', P_0_manual);

%% ============================================================================
%% VERIFICACIÓN CON EL RESULTADO DE 2a
%% ============================================================================
fprintf('=== COMPARACIÓN CON EJERCICIO 2a ===\n\n');

% En el ejercicio 2a, usando Vandermonde, obtuvimos a0
% Aquí debería dar el mismo resultado

fprintf('Resultado ejercicio 2a (Vandermonde): a0 = %.8f\n', 5.0);
fprintf('  (ejecutar ej2a_act9.m para obtener el valor exacto)\n\n');

fprintf('Resultado ejercicio 2b (Lagrange):    P(0) = %.8f\n\n', P_0);

fprintf('Diferencia entre métodos: %.10e\n', abs(5.0 - P_0));
fprintf('  (debería ser prácticamente 0)\n\n');

%% ============================================================================
%% VENTAJAS DEL MÉTODO DE LAGRANGE PARA ESTE PROBLEMA
%% ============================================================================
fprintf('=== VENTAJAS DE USAR LAGRANGE AQUÍ ===\n\n');

fprintf('1. MÁS DIRECTO: \n');
fprintf('   - No necesito resolver un sistema de ecuaciones\n');
fprintf('   - Solo evalúo una fórmula en x = 0\n\n');

fprintf('2. MÁS EFICIENTE:\n');
fprintf('   - Si solo necesito P(0) y no los demás coeficientes\n');
fprintf('   - Menos operaciones matemáticas\n\n');

fprintf('3. MENOS PROPENSO A ERRORES NUMÉRICOS:\n');
fprintf('   - No hay inversión de matrices\n');
fprintf('   - Cálculos más simples\n\n');

%% ============================================================================
%% CUÁNDO USAR CADA MÉTODO
%% ============================================================================
fprintf('=== ¿CUÁNDO USAR CADA MÉTODO? ===\n\n');

fprintf('Usa VANDERMONDE (método 2a) cuando:\n');
fprintf('  - Necesitas TODOS los coeficientes del polinomio\n');
fprintf('  - Quieres la forma explícita: P(x) = a0 + a1*x + a2*x^2 + ...\n\n');

fprintf('Usa LAGRANGE (método 2b) cuando:\n');
fprintf('  - Solo necesitas evaluar el polinomio en ALGUNOS puntos\n');
fprintf('  - No te interesan los coeficientes individuales\n');
fprintf('  - Quieres un cálculo más eficiente\n\n');

%% ============================================================================
%% RESUMEN
%% ============================================================================
fprintf('=== RESUMEN ===\n\n');
fprintf('Método usado: Interpolación de Lagrange\n');
fprintf('Resultado: P(0) = %.8f\n\n', P_0);

fprintf('Este es el TÉRMINO INDEPENDIENTE del polinomio interpolante.\n\n');

fprintf('=== FIN EJERCICIO 2b ===\n');
