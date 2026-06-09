%% ============================================================================
%% CHEATSHEET - ACTIVIDAD 9: INTERPOLACIÓN POLINOMIAL
%% ============================================================================
%% Agustín Formenti - UCA Rosario
%% Métodos y Cómputos Numéricos - 2do Semestre 2025
%%
%% Este es tu GUÍA RÁPIDA para resolver ejercicios de interpolación en el examen
%% Lee esto + los ejercicios resueltos y vas a estar listo!
%% ============================================================================

%% ============================================================================
%% 📚 CONCEPTOS BÁSICOS QUE TENÉS QUE SABER SÍ O SÍ
%% ============================================================================

%% ¿QUÉ ES INTERPOLACIÓN?
% Es encontrar un polinomio que pase EXACTAMENTE por un conjunto de puntos dados.
% 
% Puntos dados: (x0,y0), (x1,y1), ..., (xn,yn)  ← NODOS
% Polinomio P(x) tal que: P(xi) = yi para todo i
%
% Con n+1 puntos → polinomio de grado ≤ n
% Ejemplo: 3 puntos → polinomio de grado 2 (parábola)
%          4 puntos → polinomio de grado 3 (cúbico)

%% INTERPOLACIÓN vs EXTRAPOLACIÓN
% INTERPOLACIÓN: Estimar un valor DENTRO del rango de nodos
%    Ejemplo: nodos en x=[1,2,3], estimar x=1.5  ✓ MÁS CONFIABLE
%
% EXTRAPOLACIÓN: Estimar un valor FUERA del rango de nodos
%    Ejemplo: nodos en x=[1,2,3], estimar x=5    ✗ MENOS CONFIABLE

%% ============================================================================
%% 🔧 HERRAMIENTAS: ¿CUÁNDO USAR CADA MÉTODO?
%% ============================================================================

%% MÉTODO 1: MATRIZ DE VANDERMONDE (Método directo)
% ¿Cuándo usar?
%   - Necesitás TODOS los coeficientes del polinomio
%   - Querés la forma: P(x) = a0 + a1*x + a2*x^2 + ...
%   - Pocos nodos (≤ 4 puntos)
%
% ¿Cómo se hace?
%   V = [ones(n,1), x_nodos', x_nodos'.^2, ...];  % Matriz de Vandermonde
%   coef = V \ y_nodos';                           % Resuelvo sistema
%   % coef(1) = a0, coef(2) = a1, etc.

%% MÉTODO 2: INTERPOLACIÓN DE LAGRANGE
% ¿Cuándo usar?
%   - Solo necesitás evaluar en ALGUNOS puntos
%   - No te importan los coeficientes individuales
%   - Muchos nodos (> 4 puntos)
%   - Es más eficiente para evaluación
%
% ¿Cómo se hace?
%   y_aprox = lagran(x_eval, x_nodos, y_nodos);
%
% Fórmula (por si te piden hacerlo a mano):
%   P(x) = sum[ L_k(x) * y_k ]
%   donde L_k(x) = producto[(x - x_j) / (x_k - x_j)]  para j≠k

%% ============================================================================
%% 📋 PASO A PASO: RESOLVER UN EJERCICIO DE INTERPOLACIÓN
%% ============================================================================

%% PASO 1: IDENTIFICAR QUÉ TE DAN Y QUÉ TE PIDEN

% TE DAN:
%   - Nodos (puntos conocidos): x_nodos, y_nodos
%   - O una función f(x) y te dicen los nodos en x
%
% TE PIDEN:
%   - Aproximar f(x_eval) para algún x_eval
%   - Calcular error
%   - Hacer gráfica
%   - Comparar métodos

%% PASO 2: ARMAR LOS DATOS

%% Si te dan la función f(x):
% x_nodos = [x0, x1, x2, ...];     % Los nodos que te dicen
% y_nodos = f(x_nodos);            % Evalúo la función en los nodos

%% Si te dan puntos directamente:
% x_nodos = [x0, x1, x2, ...];
% y_nodos = [y0, y1, y2, ...];

%% PASO 3: ELEGIR EL MÉTODO

%% Si te piden coeficientes → Vandermonde:
% n = length(x_nodos);
% V = ones(n, n);
% for i = 1:n
%     V(:,i) = x_nodos'.^(i-1);
% end
% coef = V \ y_nodos';

%% Si solo querés evaluar → Lagrange:
% P_aprox = lagran(x_eval, x_nodos, y_nodos);

%% PASO 4: CALCULAR EL ERROR (si te lo piden)

% Valor real de la función
% f_real = f(x_eval);

% Error absoluto
% error_abs = abs(f_real - P_aprox);

% Error relativo (en porcentaje)
% error_rel = error_abs / abs(f_real);
% error_porcentaje = error_rel * 100;

%% PASO 5: HACER GRÁFICAS (si te lo piden)

%% Gráfica básica de interpolación:
% x_plot = linspace(min(x_nodos), max(x_nodos), 200);
% y_func = f(x_plot);                          % Función real
% y_poly = lagran(x_plot, x_nodos, y_nodos);  % Polinomio
% 
% plot(x_plot, y_func, 'b-', 'LineWidth', 2);      % Función real
% hold on;
% plot(x_plot, y_poly, 'r--', 'LineWidth', 2);     % Polinomio
% plot(x_nodos, y_nodos, 'ko', 'MarkerSize', 10);  % Nodos
% legend('Función real', 'Polinomio', 'Nodos');
% grid on;

%% ============================================================================
%% 🎯 TRUCOS Y CONSEJOS PARA EL EXAMEN
%% ============================================================================

%% TRUCO 1: VERIFICAR SI ES INTERPOLACIÓN O EXTRAPOLACIÓN
% if x_eval >= min(x_nodos) && x_eval <= max(x_nodos)
%     fprintf('Es INTERPOLACIÓN → más confiable\n');
% else
%     fprintf('Es EXTRAPOLACIÓN → menos confiable\n');
% end

%% TRUCO 2: EL ERROR ES 0 EN LOS NODOS
% Si te piden evaluar en un punto que es uno de los nodos,
% el error DEBE ser 0 (o muy cercano a 0 por errores numéricos)
%
% Ejemplo: si x_nodos = [1, 2, 3] y querés evaluar en x=2,
%          entonces P(2) = f(2) exactamente

%% TRUCO 3: MÁS NODOS NO SIEMPRE ES MEJOR
% - Con pocos nodos: error alto
% - Con nodos bien distribuidos: error bajo
% - Con MUCHOS nodos: puede haber oscilaciones (fenómeno de Runge)
%
% Regla práctica: 3-5 nodos suele ser suficiente

%% TRUCO 4: VERIFICAR QUE EL POLINOMIO PASE POR LOS NODOS
% for i = 1:length(x_nodos)
%     P_xi = lagran(x_nodos(i), x_nodos, y_nodos);
%     error_nodo = abs(P_xi - y_nodos(i));
%     if error_nodo > 1e-10
%         fprintf('⚠️ ERROR: El polinomio no pasa por el nodo %d\n', i);
%     end
% end

%% TRUCO 5: COTA DEL ERROR (TEORÍA)
% |f(x) - P_n(x)| ≤ (M_{n+1} / (n+1)!) * |producto(x - x_i)|
%
% donde:
%   M_{n+1} = max |f^(n+1)(x)| en el intervalo
%   producto(x - x_i) = (x - x0) * (x - x1) * ... * (x - xn)
%
% Esta cota es MAYOR O IGUAL que el error real

%% TRUCO 6: PARA f(x) = sen(x)
% Las derivadas de seno son cíclicas:
%   f(x)     = sen(x)
%   f'(x)    = cos(x)
%   f''(x)   = -sen(x)
%   f'''(x)  = -cos(x)
%   f^(4)(x) = sen(x)   ← se repite!
%
% Entonces: max|f^(n)(x)| = 1 siempre

%% TRUCO 7: PARA f(x) = cos(x)
% Similar a seno:
%   f(x)     = cos(x)
%   f'(x)    = -sen(x)
%   f''(x)   = -cos(x)
%   f'''(x)  = sen(x)
%   f^(4)(x) = cos(x)   ← se repite!
%
% Entonces: max|f^(n)(x)| = 1 siempre

%% ============================================================================
%% 🚨 ERRORES COMUNES QUE TENÉS QUE EVITAR
%% ============================================================================

%% ERROR 1: CONFUNDIR GRADO CON NÚMERO DE NODOS
% ✗ "3 nodos → polinomio de grado 3"
% ✓ "3 nodos → polinomio de grado 2"
%
% Regla: n+1 nodos → polinomio de grado n

%% ERROR 2: NO VERIFICAR INTERPOLACIÓN vs EXTRAPOLACIÓN
% Siempre verificá si el punto a evaluar está dentro o fuera del rango

%% ERROR 3: USAR VANDERMONDE CON MUCHOS NODOS
% Con más de 4-5 nodos, Vandermonde se vuelve inestable numéricamente
% Usá Lagrange en ese caso

%% ERROR 4: OLVIDAR QUE linspace INCLUYE LOS EXTREMOS
% linspace(0, 1, 3) → [0, 0.5, 1]  (incluye 0 y 1)

%% ERROR 5: NO PONER ./ o .^ EN OPERACIONES VECTORIALES
% f = @(x) x + 2/x;     ✗ NO funciona con vectores
% f = @(x) x + 2./x;    ✓ Funciona con vectores

%% ERROR 6: CONFUNDIR log() con log10()
% En MATLAB/Octave:
%   log(x)   → logaritmo natural (ln)
%   log10(x) → logaritmo base 10

%% ============================================================================
%% 📊 TIPOS DE EJERCICIOS COMUNES EN EL EXAMEN
%% ============================================================================

%% TIPO 1: INTERPOLACIÓN BÁSICA
% "Dados los puntos (x0,y0), (x1,y1), (x2,y2), aproxime f(x_eval)"
%
% Solución:
%   x_nodos = [x0, x1, x2];
%   y_nodos = [y0, y1, y2];
%   P_aprox = lagran(x_eval, x_nodos, y_nodos);

%% TIPO 2: COMPARAR GRADOS DIFERENTES
% "Compare la aproximación con polinomios de grado 2 y 3"
%
% Solución:
%   % Grado 2: usa 3 nodos
%   x_nodos_2 = [x0, x1, x2];
%   P_grado2 = lagran(x_eval, x_nodos_2, y_nodos_2);
%   
%   % Grado 3: usa 4 nodos
%   x_nodos_3 = [x0, x1, x2, x3];
%   P_grado3 = lagran(x_eval, x_nodos_3, y_nodos_3);
%   
%   % Compara errores
%   error_2 = abs(f_real - P_grado2);
%   error_3 = abs(f_real - P_grado3);

%% TIPO 3: ENCONTRAR TÉRMINO INDEPENDIENTE
% "Halle el término independiente del polinomio interpolante"
%
% Solución 1 (Vandermonde): Resuelvo sistema y tomo coef(1)
% Solución 2 (Lagrange): Evalúo en x=0, porque P(0) = a0

%% TIPO 4: CALCULAR ERROR Y COTA
% "Calcule el error y una cota del mismo"
%
% Solución:
%   % Error real
%   error_real = abs(f_real - P_aprox);
%   
%   % Cota teórica
%   M = ...; % max de |f^(n+1)(x)|
%   omega = producto de |x_eval - x_nodos(i)|
%   cota = (M / factorial(n+1)) * omega;

%% TIPO 5: POBLACIÓN/DATOS REALES
% "Use interpolación para estimar [algo] en el año [X]"
%
% Solución:
%   % Verificá si es interpolación
%   if anio_X >= min(anios) && anio_X <= max(anios)
%       fprintf('Interpolación → confiable\n');
%   end
%   
%   % Estimá
%   valor_estimado = lagran(anio_X, anios, valores);

%% ============================================================================
%% 🔑 FÓRMULAS CLAVE PARA RECORDAR
%% ============================================================================

%% POLINOMIO DE LAGRANGE (forma general)
% P(x) = sum_{k=0}^{n} [ L_k(x) * y_k ]
%
% donde:
%   L_k(x) = producto_{j=0, j≠k}^{n} [ (x - x_j) / (x_k - x_j) ]

%% PROPIEDADES DE L_k(x)
% L_k(x_j) = 1  si j = k
% L_k(x_j) = 0  si j ≠ k
% sum L_k(x) = 1  para todo x

%% ERROR DE INTERPOLACIÓN
% |f(x) - P_n(x)| ≤ (M_{n+1} / (n+1)!) * |w(x)|
%
% donde:
%   w(x) = (x - x_0)(x - x_1)...(x - x_n)

%% MATRIZ DE VANDERMONDE (3 puntos)
% V = [1   x0   x0^2]
%     [1   x1   x1^2]
%     [1   x2   x2^2]

%% ============================================================================
%% 💡 ESTRATEGIAS PARA EL EXAMEN
%% ============================================================================

%% ESTRATEGIA 1: LEÉ BIEN EL ENUNCIADO
% - ¿Qué te dan? (puntos, función, nodos)
% - ¿Qué te piden? (aproximar, error, gráfica, coeficientes)
% - ¿Te piden hacerlo "a mano" o con código?

%% ESTRATEGIA 2: EMPEZÁ POR LO FÁCIL
% 1. Definí los datos (x_nodos, y_nodos)
% 2. Usá lagran.m para aproximar
% 3. Calculá el error si te lo piden
% 4. Hacé la gráfica si te lo piden

%% ESTRATEGIA 3: VERIFICÁ TUS RESULTADOS
% - El polinomio debe pasar por los nodos
% - El error debe ser 0 en los nodos
% - La cota debe ser ≥ error real
% - Los valores deben tener sentido físico

%% ESTRATEGIA 4: SI NO TE SALE, PROBÁ OTRA COSA
% - ¿No funciona Vandermonde? Probá Lagrange
% - ¿El error es muy grande? Verificá si es extrapolación
% - ¿El polinomio no pasa por los nodos? Revisá los datos

%% ESTRATEGIA 5: COMENTÁ TU CÓDIGO
% Aunque sea el examen, poné comentarios breves:
%   % Defino los nodos
%   % Calculo el polinomio
%   % Evalúo en x=...
% Esto ayuda al profesor y a vos mismo

%% ============================================================================
%% 📝 PLANTILLA PARA UN EJERCICIO TÍPICO
%% ============================================================================

%% PLANTILLA GENERAL (copiá y adaptá):
%%
%% clear, clc
%% 
%% %% Datos del problema
%% x_nodos = [...];          % Nodos dados
%% y_nodos = [...];          % Valores en los nodos
%% x_eval = ...;             % Punto a aproximar
%% 
%% %% Método 1: Lagrange (más común)
%% P_aprox = lagran(x_eval, x_nodos, y_nodos);
%% 
%% %% Método 2: Vandermonde (si piden coeficientes)
%% n = length(x_nodos);
%% V = ones(n, n);
%% for i = 1:n
%%     V(:,i) = x_nodos'.^(i-1);
%% end
%% coef = V \ y_nodos';
%% % P(x) = coef(1) + coef(2)*x + coef(3)*x^2 + ...
%% 
%% %% Cálculo del error
%% f_real = ...;             % Valor real (si lo conocés)
%% error_abs = abs(f_real - P_aprox);
%% error_rel = error_abs / abs(f_real);
%% 
%% %% Gráfica
%% x_plot = linspace(min(x_nodos), max(x_nodos), 200);
%% y_func = ...;             % Función real
%% y_poly = lagran(x_plot, x_nodos, y_nodos);
%% 
%% plot(x_plot, y_func, 'b-', 'LineWidth', 2);
%% hold on;
%% plot(x_plot, y_poly, 'r--', 'LineWidth', 2);
%% plot(x_nodos, y_nodos, 'ko', 'MarkerSize', 10);
%% legend('Función', 'Polinomio', 'Nodos');
%% grid on;

%% ============================================================================
%% 🎓 PARA ESTUDIAR: EJERCICIOS DE PRÁCTICA
%% ============================================================================

%% Revisá estos ejercicios resueltos:
%   ej1a_act9.m → Interpolación de cos(x)
%   ej1b_act9.m → Interpolación de ln(x+1)
%   ej2a_act9.m → Vandermonde para término independiente
%   ej2b_act9.m → Lagrange para término independiente
%   ej3a_act9.m → Interpolación cuadrática
%   ej3b_act9.m → Interpolación cúbica
%   ej3c_act9.m → Comparación de errores
%   ej4a_act9.m → Aproximar sen(x)
%   ej4b_act9.m → Error y cota teórica
%   ej5a_act9.m → Población argentina

%% EJERCICIOS PARA PRACTICAR EN CASA:
% 1. Interpolá f(x) = e^x con 3 nodos en [0,1]
% 2. Interpolá f(x) = 1/x con 4 nodos en [1,4]
% 3. Compará errores con 3 vs 5 nodos
% 4. Calculá la cota del error para f(x) = x^3

%% ============================================================================
%% ✅ CHECKLIST ANTES DEL EXAMEN
%% ============================================================================

%% [ ] Sé qué es interpolación y para qué sirve
%% [ ] Sé la diferencia entre interpolación y extrapolación
%% [ ] Puedo usar lagran.m correctamente
%% [ ] Sé armar una matriz de Vandermonde
%% [ ] Sé calcular errores (absoluto y relativo)
%% [ ] Sé hacer gráficas básicas
%% [ ] Entiendo cuándo el error es 0
%% [ ] Sé calcular la cota del error
%% [ ] Revisé todos los ejercicios resueltos
%% [ ] Practiqué al menos 2 ejercicios por mi cuenta

%% ============================================================================
%% 🚀 ÚLTIMA RECOMENDACIÓN
%% ============================================================================

%% En el examen:
%   1. LEELO TODO primero
%   2. Identificá qué tipo de ejercicio es
%   3. Armá los datos con calma
%   4. Usá lagran.m (es tu amigo)
%   5. Verificá resultados básicos
%   6. Si te trancás, seguí con otro ejercicio
%   7. CONFIÁ EN TU PREPARACIÓN!

%% ÉXITOS AGU! 💪🚀

%% ============================================================================
%% FIN DEL CHEATSHEET
%% ============================================================================
