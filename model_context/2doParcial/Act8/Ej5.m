% Actividad 8 - Ejercicio 5
% Newton-Raphson (NR) como un caso particular de Punto Fijo (PF)
%
% Probar que el metodo iterativo de NR para dos ecuaciones puede verse
% como un esquema iterativo de PF con generatrices especificas.
%
% TEORIA FUNDAMENTAL:
% ===================
% 1. METODO DE PUNTO FIJO (PF):
%    Dada una generatriz G(X) = [g1(x,y); g2(x,y)], el metodo de PF
%    busca un punto fijo X* tal que X* = G(X*) mediante la iteracion:
%    X_{k+1} = G(X_k)
%
% 2. METODO DE NEWTON-RAPHSON (NR):
%    Para resolver F(X) = 0, NR usa la iteracion:
%    X_{k+1} = X_k - [J(X_k)]^{-1} * F(X_k)
%    donde J(X) es la matriz Jacobiana de F.
%
% 3. CONEXION NR <-> PF:
%    Si definimos G(X) = X - [J(X)]^{-1} * F(X), entonces:
%    - NR se convierte en: X_{k+1} = G(X_k) (esquema de PF)
%    - Un punto fijo X* de G satisface: X* = X* - [J(X*)]^{-1} * F(X*)
%      lo cual implica F(X*) = 0, es decir, X* es raiz del SENL original.
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 5 - ACTIVIDAD 8\n')
fprintf('NR como caso particular de PF\n')
fprintf('========================================\n\n')

fprintf('OBJETIVO: Demostrar que Newton-Raphson para 2 ecuaciones\n')
fprintf('puede verse como Punto Fijo con generatrices especificas.\n\n')

%% PARTE 1: Recordar la iteracion de Newton-Raphson

fprintf('========================================\n')
fprintf('PARTE 1: METODO DE NEWTON-RAPHSON\n')
fprintf('========================================\n\n')

fprintf('Para resolver el SENL:\n')
fprintf('  f1(x,y) = 0\n')
fprintf('  f2(x,y) = 0\n\n')

fprintf('Newton-Raphson usa la iteracion:\n')
fprintf('  X_{k+1} = X_k - [J(X_k)]^{-1} * F(X_k)\n\n')

fprintf('donde:\n')
fprintf('  X = [x; y]  (vector de variables)\n')
fprintf('  F(X) = [f1(x,y); f2(x,y)]  (vector de funciones)\n')
fprintf('  J(X) = matriz Jacobiana 2x2\n\n')

fprintf('La matriz Jacobiana es:\n')
fprintf('       | df1/dx  df1/dy |\n')
fprintf('  J =  |                |\n')
fprintf('       | df2/dx  df2/dy |\n\n')

%% PARTE 2: Calcular la inversa de J usando la formula de matriz 2x2

fprintf('========================================\n')
fprintf('PARTE 2: INVERSA DE LA JACOBIANA (2x2)\n')
fprintf('========================================\n\n')

fprintf('Para una matriz 2x2:\n')
fprintf('       | a  b |\n')
fprintf('  J =  |      |\n')
fprintf('       | c  d |\n\n')

fprintf('Su inversa es:\n')
fprintf('           1     |  d  -b |\n')
fprintf('  J^{-1} = ---- * |        |\n')
fprintf('          det(J)  | -c   a |\n\n')

fprintf('donde det(J) = ad - bc\n\n')

fprintf('Para nuestro caso:\n')
fprintf('  a = df1/dx,  b = df1/dy\n')
fprintf('  c = df2/dx,  d = df2/dy\n\n')

fprintf('Entonces:\n')
fprintf('           1           | df2/dy   -df1/dy |\n')
fprintf('  J^{-1} = --------- * |                  |\n')
fprintf('          det(J)       | -df2/dx   df1/dx |\n\n')

fprintf('donde:\n')
fprintf('  det(J) = (df1/dx)(df2/dy) - (df1/dy)(df2/dx)\n\n')

%% PARTE 3: Desarrollar X_{k+1} = X_k - J^{-1} * F

fprintf('========================================\n')
fprintf('PARTE 3: DESARROLLO DE LA ITERACION\n')
fprintf('========================================\n\n')

fprintf('Escribimos:\n')
fprintf('  X_{k+1} = X_k - J^{-1} * F\n\n')

fprintf('En componentes:\n')
fprintf('  [x_{k+1}]   [x_k]       1     | df2/dy   -df1/dy | [f1]\n')
fprintf('  [       ] = [   ] - --------- |                  | [  ]\n')
fprintf('  [y_{k+1}]   [y_k]    det(J)   | -df2/dx   df1/dx | [f2]\n\n')

fprintf('Multiplicando la matriz inversa por el vector F:\n\n')

fprintf('Componente x:\n')
fprintf('  x_{k+1} = x_k - (1/det(J)) * [df2/dy * f1 - df1/dy * f2]\n\n')

fprintf('Componente y:\n')
fprintf('  y_{k+1} = y_k - (1/det(J)) * [-df2/dx * f1 + df1/dx * f2]\n\n')

fprintf('Reordenando la segunda componente:\n')
fprintf('  y_{k+1} = y_k - (1/det(J)) * [df1/dx * f2 - df2/dx * f1]\n\n')

%% PARTE 4: Identificar las generatrices de Punto Fijo

fprintf('========================================\n')
fprintf('PARTE 4: GENERATRICES DE PUNTO FIJO\n')
fprintf('========================================\n\n')

fprintf('Definimos las funciones generatrices:\n\n')

fprintf('  g1(x,y) = x - (f1*df2/dy - f2*df1/dy) / det(J)\n\n')

fprintf('  g2(x,y) = y - (f2*df1/dx - f1*df2/dx) / det(J)\n\n')

fprintf('Entonces la iteracion de Newton-Raphson:\n')
fprintf('  x_{k+1} = x_k - ...\n')
fprintf('  y_{k+1} = y_k - ...\n\n')

fprintf('se convierte en un esquema de Punto Fijo:\n')
fprintf('  x_{k+1} = g1(x_k, y_k)\n')
fprintf('  y_{k+1} = g2(x_k, y_k)\n\n')

fprintf('donde:\n')
fprintf('         f1(x,y) * df2/dy - f2(x,y) * df1/dy\n')
fprintf('  g1 = x - ------------------------------------\n')
fprintf('                    det(J(x,y))\n\n')

fprintf('         f2(x,y) * df1/dx - f1(x,y) * df2/dx\n')
fprintf('  g2 = y - ------------------------------------\n')
fprintf('                    det(J(x,y))\n\n')

%% PARTE 5: Verificar que las raices coinciden

fprintf('========================================\n')
fprintf('PARTE 5: EQUIVALENCIA DE RAICES\n')
fprintf('========================================\n\n')

fprintf('Debemos verificar que:\n')
fprintf('  - Una raiz de F(X) = 0 es un punto fijo de G(X)\n')
fprintf('  - Un punto fijo de G(X) es una raiz de F(X) = 0\n\n')

fprintf('DEMOSTRACION:\n\n')

fprintf('(1) Si X* es raiz de F, es decir F(X*) = 0:\n')
fprintf('    G(X*) = X* - [J(X*)]^{-1} * F(X*)\n')
fprintf('          = X* - [J(X*)]^{-1} * 0\n')
fprintf('          = X*\n')
fprintf('    Por lo tanto, X* es punto fijo de G. ✓\n\n')

fprintf('(2) Si X* es punto fijo de G, es decir G(X*) = X*:\n')
fprintf('    X* = X* - [J(X*)]^{-1} * F(X*)\n')
fprintf('    0 = -[J(X*)]^{-1} * F(X*)\n')
fprintf('    [J(X*)]^{-1} * F(X*) = 0\n\n')

fprintf('    Como J es inversible (det(J) != 0), multiplicando por J:\n')
fprintf('    F(X*) = 0\n')
fprintf('    Por lo tanto, X* es raiz de F. ✓\n\n')

fprintf('CONCLUSION: Resolver F(X) = 0 con Newton-Raphson\n')
fprintf('es equivalente a encontrar puntos fijos de G(X).\n\n')

%% PARTE 6: Ejemplo numerico

fprintf('========================================\n')
fprintf('PARTE 6: EJEMPLO NUMERICO\n')
fprintf('========================================\n\n')

fprintf('Consideremos el sistema del Ejercicio 4:\n')
fprintf('  f1(x,y) = x^2 + y^2 - 2\n')
fprintf('  f2(x,y) = xy - 1\n\n')

fprintf('Derivadas parciales:\n')
fprintf('  df1/dx = 2x,  df1/dy = 2y\n')
fprintf('  df2/dx = y,   df2/dy = x\n\n')

fprintf('Jacobiana:\n')
fprintf('       | 2x  2y |\n')
fprintf('  J =  |        |\n')
fprintf('       |  y   x |\n\n')

fprintf('det(J) = 2x*x - 2y*y = 2(x^2 - y^2)\n\n')

fprintf('Las generatrices de PF correspondientes son:\n\n')

fprintf('       (x^2+y^2-2)*x - (xy-1)*2y\n')
fprintf('  g1 = x - ------------------------\n')
fprintf('              2(x^2 - y^2)\n\n')

fprintf('       (xy-1)*2x - (x^2+y^2-2)*y\n')
fprintf('  g2 = y - ------------------------\n')
fprintf('              2(x^2 - y^2)\n\n')

fprintf('Verificacion en la raiz (1,1):\n')
x_test = 1;
y_test = 1;

f1_test = x_test^2 + y_test^2 - 2;
f2_test = x_test*y_test - 1;

fprintf('  F(1,1) = [%.0f; %.0f]\n', f1_test, f2_test)
fprintf('  Como F(1,1) = 0, entonces (1,1) es raiz.\n\n')

% Calcular generatrices (verificar que da el mismo punto)
det_J = 2*(x_test^2 - y_test^2);
if abs(det_J) > 1e-10
    g1_test = x_test - (f1_test*x_test - f2_test*2*y_test)/det_J;
    g2_test = y_test - (f2_test*2*x_test - f1_test*y_test)/det_J;
    fprintf('  G(1,1) = [%.6f; %.6f]\n', g1_test, g2_test)
else
    fprintf('  En (1,1): det(J) = 0, no podemos evaluar G directamente.\n')
    fprintf('  Pero por continuidad, lim G(X) -> (1,1) cuando X -> (1,1)\n')
end

fprintf('\n')

%% PARTE 7: Conclusion final

fprintf('========================================\n')
fprintf('CONCLUSION FINAL\n')
fprintf('========================================\n\n')

fprintf('HEMOS DEMOSTRADO QUE:\n\n')

fprintf('1. El metodo de Newton-Raphson para SENL:\n')
fprintf('   X_{k+1} = X_k - [J(X_k)]^{-1} * F(X_k)\n\n')

fprintf('2. Puede reescribirse como Punto Fijo:\n')
fprintf('   X_{k+1} = G(X_k)\n')
fprintf('   donde G(X) = X - [J(X)]^{-1} * F(X)\n\n')

fprintf('3. Las generatrices explicitas son:\n')
fprintf('          f1(x,y)*df2/dy - f2(x,y)*df1/dy\n')
fprintf('   g1 = x - --------------------------------\n')
fprintf('                     det(J(x,y))\n\n')

fprintf('          f2(x,y)*df1/dx - f1(x,y)*df2/dx\n')
fprintf('   g2 = y - --------------------------------\n')
fprintf('                     det(J(x,y))\n\n')

fprintf('4. Ambos metodos son EQUIVALENTES:\n')
fprintf('   - Tienen las mismas raices\n')
fprintf('   - Generan la misma sucesion de iterados\n')
fprintf('   - La convergencia es identica\n\n')

fprintf('5. VENTAJA CONCEPTUAL:\n')
fprintf('   Ver NR como PF permite analizar su convergencia\n')
fprintf('   usando las herramientas de analisis de PF\n')
fprintf('   (matriz Jacobiana de G, radio espectral, etc.)\n\n')

fprintf('Q.E.D. (Quod Erat Demonstrandum)\n')

%% PARTE 1 - Método de Newton-Raphson:

%% Recuerda la iteración de NR para SENL
%% Define la matriz Jacobiana

%% PARTE 2 - Inversa de la Jacobiana:

%% Fórmula para invertir matriz 2×2
%% Cálculo del determinante

%% PARTE 3 - Desarrollo de la iteración:

%% Expande X_{k+1} = X_k - J⁻¹·F
%% Calcula componente por componente

%% PARTE 4 - Generatrices de Punto Fijo:

%% Identifica g₁(x,y) y g₂(x,y)
%% Muestra que NR se convierte en: X_{k+1} = G(X_k)

%% PARTE 5 - Equivalencia de raíces:

%% Demuestra: Si X* es raíz de F → X* es punto fijo de G
%% Demuestra: Si X* es punto fijo de G → X* es raíz de F

%% PARTE 6 - Ejemplo numérico:

%% Usa el sistema del Ejercicio 4
%% Calcula las generatrices explícitas
%% Verifica en la raíz (1,1)

%% PARTE 7 - Conclusión:

%% Resume toda la demostración
%% Explica la ventaja conceptual de ver NR como PF
