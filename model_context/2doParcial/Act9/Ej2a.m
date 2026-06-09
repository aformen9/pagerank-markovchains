%% Ejercicio 2a - Actividad 9: Término independiente usando Vandermonde
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc % Limpio variables y pantalla

%% ============================================================================
%% ¿QUÉ ES EL TÉRMINO INDEPENDIENTE?
%% ============================================================================
% En un polinomio P(x) = a0 + a1*x + a2*x^2 + ... + an*x^n,
% el término independiente es "a0" (el término que NO multiplica a x).
%
% Es importante porque:
%   - Es el valor del polinomio cuando x = 0:  P(0) = a0
%   - Es la "ordenada al origen" en la gráfica

fprintf('=== EJERCICIO 2a: Término independiente por método directo ===\n\n');

%% ============================================================================
%% DATOS DEL PROBLEMA
%% ============================================================================
% Tengo 3 puntos por los que debe pasar el polinomio:
%   (-1, 16)  →  cuando x = -1, el polinomio vale 16
%   (1, 6)    →  cuando x = 1,  el polinomio vale 6
%   (2, 10)   →  cuando x = 2,  el polinomio vale 10
%
% Quiero encontrar el polinomio de grado 2 que pasa por estos puntos
% y específicamente quiero saber cuánto vale a0 (término independiente)

x_nodos = [-1, 1, 2];   % Coordenadas x de los puntos
y_nodos = [16, 6, 10];  % Coordenadas y de los puntos

fprintf('Puntos dados:\n');
for i = 1:3
    fprintf('  Punto %d: (x, y) = (%.0f, %.0f)\n', i, x_nodos(i), y_nodos(i));
end
fprintf('\n');

%% ============================================================================
%% MÉTODO: MATRIZ DE VANDERMONDE
%% ============================================================================
% El método directo consiste en plantear un sistema de ecuaciones lineales.
%
% Si el polinomio es P(x) = a0 + a1*x + a2*x^2, entonces:
%
%   Para el punto (-1, 16):  P(-1) = a0 + a1*(-1) + a2*(-1)^2 = 16
%   Para el punto (1, 6):    P(1)  = a0 + a1*(1)  + a2*(1)^2  = 6
%   Para el punto (2, 10):   P(2)  = a0 + a1*(2)  + a2*(2)^2  = 10
%
% Reescribiendo:
%   a0 - a1 + a2 = 16
%   a0 + a1 + a2 = 6
%   a0 + 2*a1 + 4*a2 = 10
%
% Este es un sistema de 3 ecuaciones con 3 incógnitas: V * a = y

fprintf('Sistema de ecuaciones a resolver:\n');
fprintf('  a0 - 1*a1 + 1*a2  = 16  (punto (-1, 16))\n');
fprintf('  a0 + 1*a1 + 1*a2  = 6   (punto (1, 6))\n');
fprintf('  a0 + 2*a1 + 4*a2  = 10  (punto (2, 10))\n\n');

%% Paso 1: Construyo la matriz de Vandermonde
% Cada fila corresponde a un punto
% Cada columna corresponde a una potencia de x: [1, x, x^2]

V = [ones(3,1), x_nodos', x_nodos'.^2];

fprintf('Matriz de Vandermonde V:\n');
fprintf('        [1    x_i   x_i^2]\n');
fprintf('Nodo 1: [1    -1    1    ]  →  a0 - 1*a1 + 1*a2  = 16\n');
fprintf('Nodo 2: [1     1    1    ]  →  a0 + 1*a1 + 1*a2  = 6\n');
fprintf('Nodo 3: [1     2    4    ]  →  a0 + 2*a1 + 4*a2  = 10\n\n');

disp('Matriz V en formato numérico:');
disp(V);

%% Paso 2: Vector de valores y
fprintf('Vector y (valores del polinomio en los nodos):\n');
disp(y_nodos');

%% Paso 3: Resuelvo el sistema V * a = y
% Uso el operador "\" que resuelve sistemas lineales
% Es equivalente a hacer: a = inv(V) * y  pero más eficiente

coef = V \ y_nodos';  % coef = [a0; a1; a2]

fprintf('\n=== SOLUCIÓN DEL SISTEMA ===\n\n');
fprintf('Coeficientes del polinomio P(x) = a0 + a1*x + a2*x^2:\n\n');
fprintf('  a0 = %.8f  ← Este es el TÉRMINO INDEPENDIENTE\n', coef(1));
fprintf('  a1 = %.8f\n', coef(2));
fprintf('  a2 = %.8f\n\n', coef(3));

fprintf('Por lo tanto, el polinomio es:\n');
fprintf('  P(x) = %.4f + %.4f*x + %.4f*x^2\n\n', coef(1), coef(2), coef(3));

%% ============================================================================
%% VERIFICACIÓN
%% ============================================================================
% Voy a verificar que el polinomio efectivamente pasa por los 3 puntos

fprintf('=== VERIFICACIÓN ===\n\n');
fprintf('Verifico que el polinomio pase por los 3 puntos dados:\n\n');

for i = 1:3
    % Evalúo el polinomio en x_nodos(i)
    P_xi = coef(1) + coef(2)*x_nodos(i) + coef(3)*x_nodos(i)^2;

    % Calculo la diferencia con el valor esperado
    diferencia = abs(P_xi - y_nodos(i));

    fprintf('  P(%.0f) = %.4f + %.4f*(%.0f) + %.4f*(%.0f)^2 = %.8f\n', ...
            x_nodos(i), coef(1), coef(2), x_nodos(i), coef(3), x_nodos(i), P_xi);
    fprintf('       Debe ser: %.0f    →    Diferencia: %.2e  ✓\n\n', ...
            y_nodos(i), diferencia);
end

fprintf('La diferencia es prácticamente 0 (errores de redondeo numérico).\n');
fprintf('Esto confirma que el polinomio es correcto.\n\n');

%% ============================================================================
%% INTERPRETACIÓN GEOMÉTRICA
%% ============================================================================
fprintf('=== INTERPRETACIÓN ===\n\n');

fprintf('El término independiente a0 = %.4f representa:\n\n', coef(1));
fprintf('  1. El valor del polinomio cuando x = 0:  P(0) = %.4f\n', coef(1));
fprintf('  2. El punto donde la parábola corta el eje y\n');
fprintf('  3. La "ordenada al origen" de la función\n\n');

fprintf('En este caso, si evaluamos P(0):\n');
fprintf('  P(0) = %.4f + %.4f*(0) + %.4f*(0)^2 = %.4f\n\n', ...
        coef(1), coef(2), coef(3), coef(1));

%% ============================================================================
%% RESUMEN
%% ============================================================================
fprintf('=== RESUMEN ===\n\n');
fprintf('Método usado: Matriz de Vandermonde (método directo)\n');
fprintf('Resultado: El término independiente es a0 = %.8f\n\n', coef(1));

fprintf('Este método es útil porque:\n');
fprintf('  - Es directo: solo planteo y resuelvo un sistema lineal\n');
fprintf('  - Da todos los coeficientes del polinomio, no solo a0\n');
fprintf('  - Funciona para polinomios de cualquier grado\n\n');

fprintf('=== FIN EJERCICIO 2a ===\n');
