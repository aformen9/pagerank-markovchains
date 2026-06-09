% Actividad 8 - Ejercicio 6 - Item (a)
% Implementar la version NewtonRaphsonSENL3D para el caso tridimensional
%
% TEORIA: El metodo de Newton-Raphson para SENL se extiende naturalmente
% a cualquier dimension. Para el caso 3D:
%
% Sistema: F(X) = 0 donde X = [x; y; z] y F = [f1; f2; f3]
%
% Iteracion: X_{k+1} = X_k + dX_k
% donde dX_k se obtiene resolviendo: J(X_k) * dX_k = -F(X_k)
%
% Jacobiana 3x3:
%        | df1/dx  df1/dy  df1/dz |
%   J =  | df2/dx  df2/dy  df2/dz |
%        | df3/dx  df3/dy  df3/dz |
%
% DIFERENCIAS CON LA VERSION 2D:
% - El vector de variables es 3x1: X = [x; y; z]
% - La funcion F devuelve 3 componentes: F = [f1; f2; f3]
% - La Jacobiana es una matriz 3x3
% - Se resuelve un sistema lineal 3x3 en cada iteracion
%
% SIMILITUDES CON LA VERSION 2D:
% - El algoritmo es identico, solo cambia la dimension
% - Se usa el mismo metodo de Gauss para resolver el sistema lineal
% - Los criterios de convergencia son los mismos
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 6 - ACTIVIDAD 8 - ITEM (a)\n')
fprintf('Implementacion NewtonRaphsonSENL3D\n')
fprintf('========================================\n\n')

fprintf('OBJETIVO: Crear una funcion que resuelva SENL en 3D\n')
fprintf('usando el metodo de Newton-Raphson.\n\n')

%% EXPLICACION DEL ALGORITMO

fprintf('========================================\n')
fprintf('ALGORITMO DE NEWTON-RAPHSON 3D\n')
fprintf('========================================\n\n')

fprintf('Dado un sistema de 3 ecuaciones con 3 incognitas:\n')
fprintf('  f1(x,y,z) = 0\n')
fprintf('  f2(x,y,z) = 0\n')
fprintf('  f3(x,y,z) = 0\n\n')

fprintf('El metodo iterativo es:\n')
fprintf('  1. Partir de un punto inicial X0 = [x0; y0; z0]\n')
fprintf('  2. Para cada iteracion k:\n')
fprintf('     a) Evaluar F(X_k) = [f1(X_k); f2(X_k); f3(X_k)]\n')
fprintf('     b) Calcular la Jacobiana J(X_k) (matriz 3x3)\n')
fprintf('     c) Resolver: J(X_k) * dX_k = -F(X_k)\n')
fprintf('     d) Actualizar: X_{k+1} = X_k + dX_k\n')
fprintf('  3. Repetir hasta convergencia o max iteraciones\n\n')

fprintf('CRITERIOS DE CONVERGENCIA:\n')
fprintf('  - ||dX_k|| < tol  (error absoluto)\n')
fprintf('  - ||dX_k|| / ||X_k|| < tol  (error relativo)\n\n')

%% ESTRUCTURA DE LA FUNCION

fprintf('========================================\n')
fprintf('ESTRUCTURA DE NewtonRaphsonSENL3D.m\n')
fprintf('========================================\n\n')

fprintf('La funcion tiene la siguiente estructura:\n\n')

fprintf('function [Pk,iter,err] = NewtonRaphsonSENL3D(Fnom,Jnom,P0,tol,itmax)\n\n')

fprintf('ENTRADAS:\n')
fprintf('  - Fnom: nombre de la funcion vectorial F(X)\n')
fprintf('  - Jnom: nombre de la funcion Jacobiana J(X)\n')
fprintf('  - P0: punto inicial [x0; y0; z0] (vector 3x1)\n')
fprintf('  - tol: tolerancia\n')
fprintf('  - itmax: numero maximo de iteraciones\n\n')

fprintf('SALIDAS:\n')
fprintf('  - Pk: solucion aproximada [x*; y*; z*]\n')
fprintf('  - iter: numero de iteraciones realizadas\n')
fprintf('  - err: estimacion del error\n\n')

fprintf('FUNCIONES AUXILIARES REQUERIDAS:\n')
fprintf('  - Gauss.m: para resolver el sistema lineal 3x3\n')
fprintf('  - Funcion F: define el sistema de ecuaciones\n')
fprintf('  - Funcion J: calcula la matriz Jacobiana\n\n')

%% COMPARACION 2D vs 3D

fprintf('========================================\n')
fprintf('COMPARACION: 2D vs 3D\n')
fprintf('========================================\n\n')

fprintf('Aspecto            | 2D                | 3D\n')
fprintf('-------------------+-------------------+-------------------\n')
fprintf('Dimension vector X | 2x1 [x; y]        | 3x1 [x; y; z]\n')
fprintf('Dimension vector F | 2x1 [f1; f2]      | 3x1 [f1; f2; f3]\n')
fprintf('Dimension Jacobiana| 2x2               | 3x3\n')
fprintf('Sistema lineal     | 2x2               | 3x3\n')
fprintf('Algoritmo          | IDENTICO          | IDENTICO\n\n')

%% EJEMPLO DE USO

fprintf('========================================\n')
fprintf('EJEMPLO DE USO\n')
fprintf('========================================\n\n')

fprintf('Para usar NewtonRaphsonSENL3D se necesita:\n\n')

fprintf('1. Definir la funcion vectorial F_sistema.m:\n')
fprintf('   function Y = F_sistema(X)\n')
fprintf('     Y(1) = f1(X(1), X(2), X(3));\n')
fprintf('     Y(2) = f2(X(1), X(2), X(3));\n')
fprintf('     Y(3) = f3(X(1), X(2), X(3));\n')
fprintf('     Y = Y'';\n')
fprintf('   end\n\n')

fprintf('2. Definir la funcion Jacobiana JF_sistema.m:\n')
fprintf('   function J = JF_sistema(X)\n')
fprintf('     J(1,1) = df1/dx;  J(1,2) = df1/dy;  J(1,3) = df1/dz;\n')
fprintf('     J(2,1) = df2/dx;  J(2,2) = df2/dy;  J(2,3) = df2/dz;\n')
fprintf('     J(3,1) = df3/dx;  J(3,2) = df3/dy;  J(3,3) = df3/dz;\n')
fprintf('   end\n\n')

fprintf('3. Llamar a la funcion:\n')
fprintf('   P0 = [x0; y0; z0];  %% Punto inicial\n')
fprintf('   tol = 1e-9;\n')
fprintf('   itmax = 50;\n')
fprintf('   [Pk,iter,err] = NewtonRaphsonSENL3D(''F_sistema'',''JF_sistema'',P0,tol,itmax);\n\n')

%% VENTAJAS Y LIMITACIONES

fprintf('========================================\n')
fprintf('VENTAJAS Y LIMITACIONES\n')
fprintf('========================================\n\n')

fprintf('VENTAJAS:\n')
fprintf('  ✓ Convergencia cuadratica (muy rapida)\n')
fprintf('  ✓ Alta precision en la solucion\n')
fprintf('  ✓ Pocas iteraciones necesarias\n')
fprintf('  ✓ Facil de implementar y extender a cualquier dimension\n\n')

fprintf('LIMITACIONES:\n')
fprintf('  ✗ Requiere calcular la Jacobiana (derivadas parciales)\n')
fprintf('  ✗ Necesita un buen punto inicial cercano a la raiz\n')
fprintf('  ✗ Puede diverger si el punto inicial esta muy lejos\n')
fprintf('  ✗ Requiere que J sea inversible (det(J) != 0)\n\n')

%% CONCLUSION

fprintf('========================================\n')
fprintf('CONCLUSION\n')
fprintf('========================================\n\n')

fprintf('La funcion NewtonRaphsonSENL3D.m ha sido implementada\n')
fprintf('exitosamente, adaptando la version 2D al caso tridimensional.\n\n')

fprintf('La extension es directa:\n')
fprintf('  - Se cambia la dimension de los vectores (2x1 -> 3x1)\n')
fprintf('  - Se cambia la dimension de la Jacobiana (2x2 -> 3x3)\n')
fprintf('  - El algoritmo permanece identico\n\n')

fprintf('La funcion esta lista para usarse en el item (b).\n')

%% Explica el algoritmo de Newton-Raphson 3D
%% Compara 2D vs 3D
%% Muestra la estructura de la función
%% Ejemplo de uso
%% Ventajas y limitaciones
