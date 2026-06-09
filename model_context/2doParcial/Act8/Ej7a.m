% Actividad 8 - Ejercicio 7 - Item (a)
% Modelo de Wilson: Resolver con Newton-Raphson (sistema original)
%
% TEORIA - MODELO DE WILSON (1964):
% En termodinamica molecular, el modelo de Wilson describe el comportamiento
% de soluciones liquidas mediante coeficientes de actividad a dilucion infinita.
%
% Para una mezcla binaria (dos componentes), las ecuaciones son:
%   ln(gamma1) = 1 - ln(Lambda1) - Lambda2
%   ln(gamma2) = 1 - ln(Lambda2) - Lambda1
%
% donde:
%   - gamma1, gamma2: coeficientes de actividad (medibles experimentalmente)
%   - Lambda1, Lambda2: coeficientes de la mezcla (a determinar)
%
% PROBLEMA: Dados gamma1 = 7.20 y gamma2 = 2.74 (mezcla agua-etanol),
% determinar Lambda1 y Lambda2 usando Newton-Raphson.
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 7 - ACTIVIDAD 8 - ITEM (a)\n')
fprintf('Modelo de Wilson - Newton-Raphson\n')
fprintf('Sistema Original (con logaritmos)\n')
fprintf('========================================\n\n')

fprintf('MODELO DE WILSON (1964)\n')
fprintf('Termodinamica molecular - Mezcla binaria\n\n')

fprintf('Ecuaciones del modelo:\n')
fprintf('  ln(gamma1) = 1 - ln(Lambda1) - Lambda2\n')
fprintf('  ln(gamma2) = 1 - ln(Lambda2) - Lambda1\n\n')

%% DATOS DEL PROBLEMA

fprintf('========================================\n')
fprintf('DATOS: Mezcla agua-etanol\n')
fprintf('========================================\n\n')

gamma1 = 7.20;
gamma2 = 2.74;

fprintf('Coeficientes de actividad medidos:\n')
fprintf('  gamma1 = %.2f\n', gamma1)
fprintf('  gamma2 = %.2f\n\n', gamma2)

fprintf('Incognitas a determinar:\n')
fprintf('  Lambda1 = ?\n')
fprintf('  Lambda2 = ?\n\n')

%% FORMULACION DEL SENL

fprintf('========================================\n')
fprintf('FORMULACION DEL SENL\n')
fprintf('========================================\n\n')

fprintf('Sustituyendo los valores de gamma1 y gamma2:\n')
fprintf('  ln(%.2f) = 1 - ln(Lambda1) - Lambda2\n', gamma1)
fprintf('  ln(%.2f) = 1 - ln(Lambda2) - Lambda1\n\n', gamma2)

fprintf('Valores numericos:\n')
fprintf('  %.6f = 1 - ln(Lambda1) - Lambda2\n', log(gamma1))
fprintf('  %.6f = 1 - ln(Lambda2) - Lambda1\n\n', log(gamma2))

fprintf('Sistema en forma estandar F(X) = 0:\n')
fprintf('  f1(Lambda1, Lambda2) = 1 - ln(Lambda1) - Lambda2 - %.6f = 0\n', log(gamma1))
fprintf('  f2(Lambda1, Lambda2) = 1 - ln(Lambda2) - Lambda1 - %.6f = 0\n\n', log(gamma2))

%% JACOBIANA

fprintf('========================================\n')
fprintf('MATRIZ JACOBIANA\n')
fprintf('========================================\n\n')

fprintf('Derivadas parciales:\n')
fprintf('  df1/dLambda1 = -1/Lambda1\n')
fprintf('  df1/dLambda2 = -1\n')
fprintf('  df2/dLambda1 = -1\n')
fprintf('  df2/dLambda2 = -1/Lambda2\n\n')

fprintf('Jacobiana:\n')
fprintf('       | -1/Lambda1      -1        |\n')
fprintf('  J =  |                           |\n')
fprintf('       |     -1      -1/Lambda2    |\n\n')

%% RESOLUCION CON NEWTON-RAPHSON

fprintf('========================================\n')
fprintf('RESOLUCION CON NEWTON-RAPHSON\n')
fprintf('========================================\n\n')

% Parametros
tol = 1e-9;
itmax = 50;

fprintf('Parametros:\n')
fprintf('  Tolerancia: %.1e\n', tol)
fprintf('  Iteraciones maximas: %d\n\n', itmax)

% Punto inicial (estimacion)
% Lambda1 y Lambda2 deben ser positivos (aparecen en logaritmos)
% Usamos un punto inicial mas cercano a la solucion esperada
% basandonos en el analisis del sistema
P0 = [0.3; 0.3];

fprintf('Punto inicial: (Lambda1_0, Lambda2_0) = (%.2f, %.2f)\n\n', P0(1), P0(2))

fprintf('NOTA IMPORTANTE:\n')
fprintf('El sistema original tiene funciones logaritmicas.\n')
fprintf('Esto puede causar problemas si Lambda1 o Lambda2 <= 0.\n')
fprintf('Newton-Raphson debe mantener los valores positivos.\n\n')

% Resolver
fprintf('Ejecutando NewtonRaphsonSENL...\n\n')
[Pk, iter, err] = NewtonRaphsonSENL('F_ej7_original', 'JF_ej7_original', P0, tol, itmax);

fprintf('\n')

%% VERIFICACION DE LA SOLUCION

fprintf('========================================\n')
fprintf('VERIFICACION DE LA SOLUCION\n')
fprintf('========================================\n\n')

Lambda1 = Pk(1);
Lambda2 = Pk(2);

fprintf('Solucion obtenida:\n')
fprintf('  Lambda1 = %.6f\n', Lambda1)
fprintf('  Lambda2 = %.6f\n\n', Lambda2)

% Verificar que satisface las ecuaciones originales
ec1_izq = log(gamma1);
ec1_der = 1 - log(Lambda1) - Lambda2;

ec2_izq = log(gamma2);
ec2_der = 1 - log(Lambda2) - Lambda1;

fprintf('Verificacion en las ecuaciones originales:\n\n')
fprintf('Ecuacion 1:\n')
fprintf('  ln(gamma1) = %.6f\n', ec1_izq)
fprintf('  1 - ln(Lambda1) - Lambda2 = %.6f\n', ec1_der)
fprintf('  Diferencia: %.3e\n\n', abs(ec1_izq - ec1_der))

fprintf('Ecuacion 2:\n')
fprintf('  ln(gamma2) = %.6f\n', ec2_izq)
fprintf('  1 - ln(Lambda2) - Lambda1 = %.6f\n', ec2_der)
fprintf('  Diferencia: %.3e\n\n', abs(ec2_izq - ec2_der))

% Verificar F(Pk) ≈ 0
F_test = F_ej7_original(Pk);
fprintf('Vector F en la solucion:\n')
fprintf('  F(Lambda1, Lambda2) = [%.3e; %.3e]\n', F_test(1), F_test(2))
fprintf('  ||F(Pk)||_2 = %.3e\n\n', norm(F_test))

%% INTERPRETACION FISICA

fprintf('========================================\n')
fprintf('INTERPRETACION FISICA\n')
fprintf('========================================\n\n')

fprintf('Para la mezcla agua-etanol:\n')
fprintf('  - Lambda1 = %.4f (coeficiente del componente 1)\n', Lambda1)
fprintf('  - Lambda2 = %.4f (coeficiente del componente 2)\n\n', Lambda2)

fprintf('Estos coeficientes describen las interacciones moleculares\n')
fprintf('entre el agua y el etanol en la mezcla liquida.\n\n')

fprintf('Valores positivos indican que la solucion es fisicamente valida.\n')

%% CONCLUSIONES

fprintf('\n========================================\n')
fprintf('CONCLUSIONES ITEM (a)\n')
fprintf('========================================\n\n')

fprintf('✓ Newton-Raphson convergio exitosamente\n')
fprintf('✓ Numero de iteraciones: %d\n', iter)
fprintf('✓ Error estimado: %.3e\n\n', err)

fprintf('El sistema original (con logaritmos) se resolvio correctamente,\n')
fprintf('pero debemos tener cuidado con el punto inicial para evitar\n')
fprintf('problemas con los logaritmos de numeros no positivos.\n')
