% Actividad 8 - Ejercicio 6 - Item (c)
% ¿Como puede hacer una implementacion del algoritmo para dimensiones mayores?
%
% TEORIA: El metodo de Newton-Raphson para SENL se puede generalizar
% a cualquier dimension n. La clave es entender que el algoritmo
% es IDENTICO independientemente de la dimension, solo cambian
% los tamaños de vectores y matrices.
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 6 - ACTIVIDAD 8 - ITEM (c)\n')
fprintf('Newton-Raphson para n-dimensiones\n')
fprintf('========================================\n\n')

fprintf('PREGUNTA: ¿Como implementar Newton-Raphson para n dimensiones?\n\n')

%% PRINCIPIO FUNDAMENTAL

fprintf('========================================\n')
fprintf('1. PRINCIPIO FUNDAMENTAL\n')
fprintf('========================================\n\n')

fprintf('El metodo de Newton-Raphson es INDEPENDIENTE de la dimension.\n')
fprintf('El algoritmo es IDENTICO para 2D, 3D, ..., nD.\n\n')

fprintf('Solo cambian los TAMAÑOS:\n')
fprintf('  - Vector de variables: X ∈ R^n (nx1)\n')
fprintf('  - Vector de funciones: F(X) ∈ R^n (nx1)\n')
fprintf('  - Matriz Jacobiana: J(X) ∈ R^{nxn}\n\n')

fprintf('Pero la ITERACION es la misma:\n')
fprintf('  X_{k+1} = X_k + dX_k\n')
fprintf('donde dX_k se obtiene de: J(X_k) * dX_k = -F(X_k)\n\n')

%% IMPLEMENTACION GENERAL

fprintf('========================================\n')
fprintf('2. IMPLEMENTACION GENERAL (n dimensiones)\n')
fprintf('========================================\n\n')

fprintf('function [Pk,iter,err] = NewtonRaphsonSENL_nD(Fnom,Jnom,P0,tol,itmax)\n\n')

fprintf('  %% El codigo es IDENTICO al caso 2D o 3D:\n\n')

fprintf('  iter = 0;\n')
fprintf('  Pk = P0;  %% P0 puede ser nx1 (cualquier n)\n')
fprintf('  iter = 1;\n\n')

fprintf('  while 1\n')
fprintf('    FX = feval(Fnom,Pk);      %% Vector nx1\n')
fprintf('    Jacob = feval(Jnom,Pk);   %% Matriz nxn\n')
fprintf('    dP = Gauss(Jacob,-FX);    %% Resolver sistema lineal nxn\n')
fprintf('    err = norm(dP);\n')
fprintf('    relerr = err / (norm(Pk) + eps);\n')
fprintf('    Pk = Pk + dP;\n\n')

fprintf('    if err < tol || relerr < tol\n')
fprintf('      return\n')
fprintf('    end\n\n')

fprintf('    iter = iter + 1;\n')
fprintf('    if iter > itmax\n')
fprintf('      break\n')
fprintf('    end\n')
fprintf('  end\n')
fprintf('end\n\n')

fprintf('OBSERVACION CLAVE:\n')
fprintf('El codigo NO necesita saber la dimension n!\n')
fprintf('Funciona automaticamente para cualquier dimension.\n\n')

%% DIFERENCIAS POR DIMENSION

fprintf('========================================\n')
fprintf('3. ¿QUE CAMBIA SEGUN LA DIMENSION?\n')
fprintf('========================================\n\n')

fprintf('LO QUE CAMBIA:\n')
fprintf('  ✓ Tamaño del vector P0 (2x1, 3x1, ..., nx1)\n')
fprintf('  ✓ Numero de ecuaciones en F(X)\n')
fprintf('  ✓ Tamaño de la Jacobiana J(X)\n')
fprintf('  ✓ Costo computacional de resolver J*dP = -F\n\n')

fprintf('LO QUE NO CAMBIA:\n')
fprintf('  ✓ La estructura del algoritmo\n')
fprintf('  ✓ Los criterios de convergencia\n')
fprintf('  ✓ El tipo de convergencia (cuadratica)\n')
fprintf('  ✓ Las condiciones para que converja\n\n')

%% EJEMPLO COMPARATIVO

fprintf('========================================\n')
fprintf('4. EJEMPLO COMPARATIVO POR DIMENSION\n')
fprintf('========================================\n\n')

fprintf('Dimension | Vector X       | Vector F       | Jacobiana | Sistema lineal\n')
fprintf('----------+----------------+----------------+-----------+---------------\n')
fprintf('n = 2     | [x; y]         | [f1; f2]       | 2x2       | 2x2\n')
fprintf('n = 3     | [x; y; z]      | [f1; f2; f3]   | 3x3       | 3x3\n')
fprintf('n = 4     | [x; y; z; w]   | [f1;...; f4]   | 4x4       | 4x4\n')
fprintf('n = 10    | [x1;...; x10]  | [f1;...; f10]  | 10x10     | 10x10\n')
fprintf('n         | nx1            | nx1            | nxn       | nxn\n\n')

%% CONSIDERACIONES PRACTICAS

fprintf('========================================\n')
fprintf('5. CONSIDERACIONES PRACTICAS\n')
fprintf('========================================\n\n')

fprintf('PARA DIMENSIONES PEQUEÑAS (n ≤ 10):\n')
fprintf('  - Usar Gauss.m (eliminacion gaussiana)\n')
fprintf('  - Calcular Jacobiana analitica (derivadas)\n')
fprintf('  - Es rapido y preciso\n\n')

fprintf('PARA DIMENSIONES MEDIANAS (10 < n ≤ 100):\n')
fprintf('  - Considerar metodos de factorizacion (LU, QR)\n')
fprintf('  - Puede usar diferencias finitas para J si es complejo\n')
fprintf('  - Aprox: J_ij ≈ (f_i(X + h*e_j) - f_i(X))/h\n\n')

fprintf('PARA DIMENSIONES GRANDES (n > 100):\n')
fprintf('  - Usar metodos iterativos para resolver J*dP = -F\n')
fprintf('  - Explotar estructura de J si es dispersa (sparse)\n')
fprintf('  - Considerar metodos quasi-Newton (BFGS)\n')
fprintf('  - No calcular J explicitamente\n\n')

%% ESTRUCTURA DE FUNCIONES F Y J

fprintf('========================================\n')
fprintf('6. ESTRUCTURA DE F Y J PARA n DIMENSIONES\n')
fprintf('========================================\n\n')

fprintf('Funcion vectorial F (cualquier n):\n\n')

fprintf('function Y = F_sistema(X)\n')
fprintf('  n = length(X);  %% Detectar dimension automaticamente\n')
fprintf('  Y = zeros(n,1);\n')
fprintf('  \n')
fprintf('  Y(1) = f1(X(1), X(2), ..., X(n));\n')
fprintf('  Y(2) = f2(X(1), X(2), ..., X(n));\n')
fprintf('  ...\n')
fprintf('  Y(n) = fn(X(1), X(2), ..., X(n));\n')
fprintf('end\n\n')

fprintf('Jacobiana J (cualquier n):\n\n')

fprintf('function J = JF_sistema(X)\n')
fprintf('  n = length(X);\n')
fprintf('  J = zeros(n,n);\n')
fprintf('  \n')
fprintf('  %% Calcular cada elemento J(i,j) = dfi/dxj\n')
fprintf('  for i = 1:n\n')
fprintf('    for j = 1:n\n')
fprintf('      J(i,j) = derivada_parcial_de_fi_respecto_a_xj;\n')
fprintf('    end\n')
fprintf('  end\n')
fprintf('end\n\n')

%% VENTAJAS DE LA GENERALIZACION

fprintf('========================================\n')
fprintf('7. VENTAJAS DE LA IMPLEMENTACION GENERAL\n')
fprintf('========================================\n\n')

fprintf('✓ CODIGO UNICO: Una sola implementacion sirve para todo\n')
fprintf('✓ MANTENIMIENTO: Facil de mantener y debuggear\n')
fprintf('✓ ESCALABILIDAD: Se adapta automaticamente a cualquier n\n')
fprintf('✓ REUTILIZACION: No necesitas reescribir para cada dimension\n')
fprintf('✓ FLEXIBILIDAD: Cambias la dimension sin modificar el codigo\n\n')

%% EJEMPLO HIPOTETICO: SISTEMA 5D

fprintf('========================================\n')
fprintf('8. EJEMPLO: SISTEMA 5D\n')
fprintf('========================================\n\n')

fprintf('Si tuvieramos un sistema de 5 ecuaciones con 5 incognitas:\n\n')

fprintf('  f1(x1,x2,x3,x4,x5) = 0\n')
fprintf('  f2(x1,x2,x3,x4,x5) = 0\n')
fprintf('  f3(x1,x2,x3,x4,x5) = 0\n')
fprintf('  f4(x1,x2,x3,x4,x5) = 0\n')
fprintf('  f5(x1,x2,x3,x4,x5) = 0\n\n')

fprintf('USARIAMOS:\n')
fprintf('  P0 = [x1_0; x2_0; x3_0; x4_0; x5_0];  %% Vector 5x1\n')
fprintf('  [Pk,iter,err] = NewtonRaphsonSENL_nD(''F_5D'',''JF_5D'',P0,tol,itmax);\n\n')

fprintf('El algoritmo funcionaria IDENTICO que en 2D o 3D!\n\n')

%% CONCLUSION

fprintf('========================================\n')
fprintf('CONCLUSION\n')
fprintf('========================================\n\n')

fprintf('RESPUESTA A LA PREGUNTA:\n\n')

fprintf('Para implementar Newton-Raphson para dimensiones mayores (n > 3):\n\n')

fprintf('1. NO necesitas cambiar el algoritmo\n')
fprintf('   - La funcion NewtonRaphsonSENL ya es general\n')
fprintf('   - Solo necesitas definir F y J para dimension n\n\n')

fprintf('2. Lo unico especifico de la dimension es:\n')
fprintf('   - El vector P0 (nx1)\n')
fprintf('   - La funcion F que devuelve vector nx1\n')
fprintf('   - La Jacobiana J que devuelve matriz nxn\n\n')

fprintf('3. El codigo del algoritmo es UNIVERSAL:\n')
fprintf('   - NewtonRaphsonSENL sirve para n = 2, 3, 4, ..., 100, ...\n')
fprintf('   - No hay que modificar nada\n')
fprintf('   - La dimension se detecta automaticamente del tamaño de P0\n\n')

fprintf('4. Consideraciones para n grande:\n')
fprintf('   - Usar metodos eficientes para resolver J*dP = -F\n')
fprintf('   - Explotar estructura especial de J si existe\n')
fprintf('   - Considerar aproximaciones de J (diferencias finitas)\n\n')

fprintf('EN RESUMEN:\n')
fprintf('Newton-Raphson es un algoritmo que ESCALA NATURALMENTE\n')
fprintf('a cualquier dimension sin cambios en su estructura.\n')
fprintf('¡Es uno de los grandes beneficios del metodo!\n')

%% Teoría sobre generalización a n-dimensiones
%% Principio fundamental: el algoritmo es independiente de la dimensión
%% Comparación entre diferentes dimensiones
%% Consideraciones prácticas para n grande
%% Estructura general de F y J
%% Ejemplo hipotético de sistema 5D
%% Respuesta completa a la pregunta
