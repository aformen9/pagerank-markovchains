%% Ejercicio 3d - Actividad 9: Explicación de las discrepancias en errores
% Agustín Formenti
% Métodos y Cómputos Numéricos - UCA Rosario
% Noviembre 2025

clear, clc % Limpio variables y pantalla

%% ============================================================================
%% ¿QUÉ VOY A HACER?
%% ============================================================================
% En este ejercicio voy a EXPLICAR detalladamente por qué hay diferencias
% entre los errores obtenidos en los ejercicios 3a y 3b.
%
% Esto es un ejercicio de ANÁLISIS, no de cálculo.
% Voy a dar razones teóricas y prácticas de las discrepancias observadas.

fprintf('=== EJERCICIO 3d: Explicación de discrepancias en errores ===\n\n');

%% ============================================================================
%% RECORDATORIO DE LOS RESULTADOS
%% ============================================================================
% Primero recuerdo los resultados que obtuve

fprintf('=== RECORDATORIO DE RESULTADOS ===\n\n');

fprintf('EJERCICIO 3a (Interpolación cuadrática - 3 nodos):\n');
fprintf('  Nodos: x = [1, 2, 2.5]\n');
fprintf('  Grado del polinomio: 2 (parábola)\n');
fprintf('  Error en x=0.75: ALTO (extrapolación)\n');
fprintf('  Error en x=1.5:  BAJO (interpolación)\n\n');

fprintf('EJERCICIO 3b (Interpolación cúbica - 4 nodos):\n');
fprintf('  Nodos: x = [0.5, 1.5, 2, 2.5]\n');
fprintf('  Grado del polinomio: 3 (cúbico)\n');
fprintf('  Error en x=0.75: BAJO (interpolación)\n');
fprintf('  Error en x=1.5:  PRÁCTICAMENTE 0 (es un nodo)\n\n');

%% ============================================================================
%% EXPLICACIÓN 1: INTERPOLACIÓN VS EXTRAPOLACIÓN
%% ============================================================================
fprintf('========================================\n');
fprintf('EXPLICACIÓN 1: Interpolación vs Extrapolación\n');
fprintf('========================================\n\n');

fprintf('📌 CONCEPTO CLAVE:\n');
fprintf('   - INTERPOLACIÓN: estimar un valor DENTRO del rango de nodos conocidos\n');
fprintf('   - EXTRAPOLACIÓN: estimar un valor FUERA del rango de nodos conocidos\n\n');

fprintf('EN x = 0.75:\n\n');

fprintf('Ejercicio 3a:\n');
fprintf('   Rango de nodos: [1, 2.5]\n');
fprintf('   Punto x=0.75 está FUERA (0.75 < 1)\n');
fprintf('   → Es EXTRAPOLACIÓN\n');
fprintf('   → El polinomio debe "adivinar" el comportamiento fuera del rango\n');
fprintf('   → ERROR MÁS ALTO\n\n');

fprintf('Ejercicio 3b:\n');
fprintf('   Rango de nodos: [0.5, 2.5]\n');
fprintf('   Punto x=0.75 está DENTRO (0.5 < 0.75 < 2.5)\n');
fprintf('   → Es INTERPOLACIÓN\n');
fprintf('   → El polinomio interpola entre nodos conocidos\n');
fprintf('   → ERROR MÁS BAJO\n\n');

fprintf('💡 CONCLUSIÓN 1:\n');
fprintf('   La interpolación es MÁS CONFIABLE que la extrapolación.\n');
fprintf('   Esto explica por qué el error en x=0.75 es mucho menor en el ej. 3b.\n\n');

%% ============================================================================
%% EXPLICACIÓN 2: PUNTOS CERCANOS A NODOS
%% ============================================================================
fprintf('========================================\n');
fprintf('EXPLICACIÓN 2: Proximidad a los nodos\n');
fprintf('========================================\n\n');

fprintf('📌 CONCEPTO CLAVE:\n');
fprintf('   El error de interpolación tiende a ser MENOR cuando el punto\n');
fprintf('   a aproximar está CERCA de los nodos de interpolación.\n\n');

fprintf('EN x = 1.5:\n\n');

fprintf('Ejercicio 3a:\n');
fprintf('   Nodos cercanos: x=1 y x=2\n');
fprintf('   Distancia al nodo más cercano: min(|1.5-1|, |1.5-2|) = 0.5\n');
fprintf('   → x=1.5 está ENTRE nodos pero no es un nodo\n');
fprintf('   → Error PEQUEÑO pero no nulo\n\n');

fprintf('Ejercicio 3b:\n');
fprintf('   x=1.5 ES UN NODO\n');
fprintf('   Distancia al nodo más cercano: 0 (porque ES el nodo)\n');
fprintf('   → El polinomio DEBE pasar exactamente por x=1.5\n');
fprintf('   → Error = 0 (en teoría) o ~10^-15 (errores de redondeo)\n\n');

fprintf('💡 CONCLUSIÓN 2:\n');
fprintf('   Cuando el punto a aproximar ES un nodo, el error es 0.\n');
fprintf('   Esto explica la diferencia dramática en x=1.5.\n\n');

%% ============================================================================
%% EXPLICACIÓN 3: GRADO DEL POLINOMIO Y FLEXIBILIDAD
%% ============================================================================
fprintf('========================================\n');
fprintf('EXPLICACIÓN 3: Grado del polinomio\n');
fprintf('========================================\n\n');

fprintf('📌 CONCEPTO CLAVE:\n');
fprintf('   Polinomios de mayor grado tienen MÁS FLEXIBILIDAD para\n');
fprintf('   ajustarse a funciones con comportamiento complejo.\n\n');

fprintf('Función a interpolar: f(x) = x + 2/x\n');
fprintf('   - Esta función tiene una asíntota vertical en x=0\n');
fprintf('   - Su forma no es una simple parábola\n');
fprintf('   - Requiere más de 2 grados para capturar bien su forma\n\n');

fprintf('Ejercicio 3a (grado 2):\n');
fprintf('   - El polinomio cuadrático es una PARÁBOLA\n');
fprintf('   - Una parábola solo puede curvarse en UNA dirección\n');
fprintf('   - No puede capturar bien el comportamiento de f(x) = x + 2/x\n');
fprintf('   - Error relativamente MAYOR\n\n');

fprintf('Ejercicio 3b (grado 3):\n');
fprintf('   - El polinomio cúbico tiene DOS puntos de inflexión\n');
fprintf('   - Puede curvarse en diferentes direcciones\n');
fprintf('   - Se ajusta MEJOR al comportamiento de f(x) = x + 2/x\n');
fprintf('   - Error relativamente MENOR\n\n');

fprintf('💡 CONCLUSIÓN 3:\n');
fprintf('   Para funciones complejas, un polinomio de mayor grado\n');
fprintf('   puede dar mejor aproximación (pero cuidado con el fenómeno de Runge).\n\n');

%% ============================================================================
%% EXPLICACIÓN 4: TEORÍA DEL ERROR DE INTERPOLACIÓN
%% ============================================================================
fprintf('========================================\n');
fprintf('EXPLICACIÓN 4: Teoría del error\n');
fprintf('========================================\n\n');

fprintf('📌 FÓRMULA TEÓRICA DEL ERROR:\n\n');
fprintf('   |f(x) - P_n(x)| ≤ (M_{n+1} / (n+1)!) * |producto(x - x_i)|\n\n');
fprintf('   donde:\n');
fprintf('   - n es el grado del polinomio\n');
fprintf('   - M_{n+1} es el máximo de |f^(n+1)(x)| en el intervalo\n');
fprintf('   - producto(x - x_i) = (x - x_0)(x - x_1)...(x - x_n)\n\n');

fprintf('Factor 1: (n+1)! en el denominador\n');
fprintf('   Ejercicio 3a: n=2  →  (n+1)! = 6\n');
fprintf('   Ejercicio 3b: n=3  →  (n+1)! = 24\n');
fprintf('   → El factorial más grande REDUCE el error\n\n');

fprintf('Factor 2: producto(x - x_i)\n');
fprintf('   Este producto es 0 cuando x es un nodo (x = x_i)\n');
fprintf('   Es pequeño cuando x está cerca de los nodos\n');
fprintf('   Es grande cuando x está lejos de todos los nodos\n\n');

fprintf('EN x = 0.75:\n');
fprintf('   Ej. 3a: |0.75-1| × |0.75-2| × |0.75-2.5| = 0.25 × 1.25 × 1.75 ≈ 0.547\n');
fprintf('   Ej. 3b: |0.75-0.5| × |0.75-1.5| × |0.75-2| × |0.75-2.5| ≈ 0.164\n');
fprintf('   → Producto más PEQUEÑO en 3b → error menor\n\n');

fprintf('EN x = 1.5:\n');
fprintf('   Ej. 3a: |1.5-1| × |1.5-2| × |1.5-2.5| = 0.5 × 0.5 × 1.0 = 0.25\n');
fprintf('   Ej. 3b: |1.5-0.5| × |1.5-1.5| × ... = ... × 0 × ... = 0\n');
fprintf('   → Producto es 0 porque x=1.5 es un nodo → error = 0\n\n');

fprintf('💡 CONCLUSIÓN 4:\n');
fprintf('   La fórmula del error explica matemáticamente las diferencias:\n');
fprintf('   - Mayor grado reduce el error (factorial en denominador)\n');
fprintf('   - Cercanía a nodos reduce el error (producto pequeño)\n\n');

%% ============================================================================
%% EXPLICACIÓN 5: DISTRIBUCIÓN DE NODOS
%% ============================================================================
fprintf('========================================\n');
fprintf('EXPLICACIÓN 5: Distribución de nodos\n');
fprintf('========================================\n\n');

fprintf('📌 CONCEPTO CLAVE:\n');
fprintf('   No solo importa CUÁNTOS nodos, sino también DÓNDE están ubicados.\n\n');

fprintf('Ejercicio 3a: Nodos = [1, 2, 2.5]\n');
fprintf('   - Nodos concentrados en [1, 2.5]\n');
fprintf('   - Deja sin cubrir la región [0.5, 1]\n');
fprintf('   - Aproximaciones en [0.5, 1] serán extrapolaciones\n\n');

fprintf('Ejercicio 3b: Nodos = [0.5, 1.5, 2, 2.5]\n');
fprintf('   - Nodos mejor distribuidos en [0.5, 2.5]\n');
fprintf('   - Cubre mejor el rango de interés\n');
fprintf('   - Incluye x=1.5 como nodo (error = 0 allí)\n\n');

fprintf('💡 CONCLUSIÓN 5:\n');
fprintf('   Una buena distribución de nodos es TAN IMPORTANTE como\n');
fprintf('   la cantidad de nodos.\n\n');

%% ============================================================================
%% RESUMEN FINAL
%% ============================================================================
fprintf('========================================\n');
fprintf('RESUMEN DE TODAS LAS EXPLICACIONES\n');
fprintf('========================================\n\n');

fprintf('Las discrepancias en los errores se deben a:\n\n');

fprintf('1. 🎯 Interpolación vs extrapolación:\n');
fprintf('      - x=0.75 cambia de extrapolación (3a) a interpolación (3b)\n\n');

fprintf('2. 📍 Proximidad a nodos:\n');
fprintf('      - x=1.5 pasa de estar entre nodos (3a) a SER un nodo (3b)\n\n');

fprintf('3. 📈 Grado del polinomio:\n');
fprintf('      - Polinomio cúbico (grado 3) se ajusta mejor que cuadrático (grado 2)\n\n');

fprintf('4. 📊 Teoría matemática:\n');
fprintf('      - Factorial mayor y producto menor → error menor\n\n');

fprintf('5. 🗺️  Distribución de nodos:\n');
fprintf('      - Mejor cobertura del rango de interés en el ejercicio 3b\n\n');

fprintf('🌟 LECCIÓN PRINCIPAL:\n');
fprintf('   Para obtener buenas aproximaciones por interpolación:\n');
fprintf('   - Usar puntos DENTRO del rango de nodos (interpolación)\n');
fprintf('   - Elegir nodos CERCA del punto a aproximar\n');
fprintf('   - Distribuir nodos estratégicamente\n');
fprintf('   - Usar grado apropiado (ni muy bajo ni muy alto)\n\n');

fprintf('=== FIN EJERCICIO 3d ===\n');
