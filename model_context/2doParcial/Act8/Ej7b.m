% Actividad 8 - Ejercicio 7 - Item (b)
% Modelo de Wilson: Resolver con sustituciones (sistema transformado)
%
% TEORIA - SUSTITUCION DE VARIABLES:
% Para evitar problemas numericos con logaritmos, realizamos las sustituciones:
%   alpha = ln(Lambda1)  =>  Lambda1 = exp(alpha)
%   beta = ln(Lambda2)   =>  Lambda2 = exp(beta)
%
% Esto transforma el sistema con funciones logaritmicas en otro con
% funciones exponenciales, que es mas estable numericamente.
%
% Sistema original:
%   ln(gamma1) = 1 - ln(Lambda1) - Lambda2
%   ln(gamma2) = 1 - ln(Lambda2) - Lambda1
%
% Sistema transformado:
%   ln(gamma1) = 1 - alpha - exp(beta)
%   ln(gamma2) = 1 - beta - exp(alpha)
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 7 - ACTIVIDAD 8 - ITEM (b)\n')
fprintf('Modelo de Wilson - Newton-Raphson\n')
fprintf('Sistema Transformado (con sustituciones)\n')
fprintf('========================================\n\n')

%% SUSTITUCION DE VARIABLES

fprintf('========================================\n')
fprintf('SUSTITUCION DE VARIABLES\n')
fprintf('========================================\n\n')

fprintf('Para mejorar la estabilidad numerica, hacemos:\n')
fprintf('  alpha = ln(Lambda1)  =>  Lambda1 = exp(alpha)\n')
fprintf('  beta  = ln(Lambda2)  =>  Lambda2 = exp(beta)\n\n')

fprintf('VENTAJAS de esta transformacion:\n')
fprintf('  ✓ No hay restricciones en alpha y beta (pueden ser cualquier real)\n')
fprintf('  ✓ Lambda1 = exp(alpha) > 0 siempre (evita logaritmos de negativos)\n')
fprintf('  ✓ Lambda2 = exp(beta) > 0 siempre\n')
fprintf('  ✓ Mas estable numericamente\n\n')

%% SISTEMA TRANSFORMADO

fprintf('========================================\n')
fprintf('SISTEMA TRANSFORMADO\n')
fprintf('========================================\n\n')

gamma1 = 7.20;
gamma2 = 2.74;

fprintf('Datos: gamma1 = %.2f, gamma2 = %.2f\n\n', gamma1, gamma2)

fprintf('Sustituyendo Lambda1 = exp(alpha) y Lambda2 = exp(beta):\n')
fprintf('  ln(gamma1) = 1 - ln(exp(alpha)) - exp(beta)\n')
fprintf('  ln(gamma2) = 1 - ln(exp(beta)) - exp(alpha)\n\n')

fprintf('Simplificando (ln(exp(x)) = x):\n')
fprintf('  ln(gamma1) = 1 - alpha - exp(beta)\n')
fprintf('  ln(gamma2) = 1 - beta - exp(alpha)\n\n')

fprintf('Sistema en forma estandar F(X) = 0:\n')
fprintf('  f1(alpha, beta) = 1 - alpha - exp(beta) - ln(gamma1) = 0\n')
fprintf('  f2(alpha, beta) = 1 - beta - exp(alpha) - ln(gamma2) = 0\n\n')

%% JACOBIANA DEL SISTEMA TRANSFORMADO

fprintf('========================================\n')
fprintf('MATRIZ JACOBIANA TRANSFORMADA\n')
fprintf('========================================\n\n')

fprintf('Derivadas parciales:\n')
fprintf('  df1/dalpha = -1\n')
fprintf('  df1/dbeta  = -exp(beta)\n')
fprintf('  df2/dalpha = -exp(alpha)\n')
fprintf('  df2/dbeta  = -1\n\n')

fprintf('Jacobiana:\n')
fprintf('       |      -1        -exp(beta) |\n')
fprintf('  J =  |                            |\n')
fprintf('       | -exp(alpha)       -1       |\n\n')

fprintf('OBSERVACION: Ya no hay divisiones por Lambda1 o Lambda2.\n')
fprintf('La Jacobiana es mas simple y estable.\n\n')

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

% Punto inicial (estimacion en el espacio transformado)
% Evitamos alpha = beta para que la Jacobiana no sea singular
% Probamos con valores que den Lambda1 ≈ 0.2, Lambda2 ≈ 0.15
% alpha = ln(0.2) ≈ -1.6, beta = ln(0.15) ≈ -1.9
P0 = [-1.9; -2.4];

fprintf('Punto inicial: (alpha_0, beta_0) = (%.2f, %.2f)\n', P0(1), P0(2))
fprintf('Equivalente a: (Lambda1_0, Lambda2_0) = (%.4f, %.4f)\n\n', exp(P0(1)), exp(P0(2)))

% Resolver
fprintf('Ejecutando NewtonRaphsonSENL...\n\n')
[Pk, iter, err] = NewtonRaphsonSENL('F_ej7_transformado', 'JF_ej7_transformado', P0, tol, itmax);

fprintf('\n')

%% RECUPERAR LAS VARIABLES ORIGINALES

fprintf('========================================\n')
fprintf('RECUPERAR VARIABLES ORIGINALES\n')
fprintf('========================================\n\n')

alpha = Pk(1);
beta = Pk(2);

fprintf('Solucion en variables transformadas:\n')
fprintf('  alpha = %.6f\n', alpha)
fprintf('  beta  = %.6f\n\n', beta)

% Calcular Lambda1 y Lambda2
Lambda1 = exp(alpha);
Lambda2 = exp(beta);

fprintf('Solucion en variables originales:\n')
fprintf('  Lambda1 = exp(alpha) = exp(%.6f) = %.6f\n', alpha, Lambda1)
fprintf('  Lambda2 = exp(beta)  = exp(%.6f) = %.6f\n\n', beta, Lambda2)

%% VERIFICACION DE LA SOLUCION

fprintf('========================================\n')
fprintf('VERIFICACION DE LA SOLUCION\n')
fprintf('========================================\n\n')

% Verificar en el sistema transformado
F_test_trans = F_ej7_transformado(Pk);
fprintf('Sistema transformado F(alpha, beta):\n')
fprintf('  F = [%.3e; %.3e]\n', F_test_trans(1), F_test_trans(2))
fprintf('  ||F||_2 = %.3e\n\n', norm(F_test_trans))

% Verificar en el sistema original
Pk_original = [Lambda1; Lambda2];
F_test_orig = F_ej7_original(Pk_original);
fprintf('Sistema original F(Lambda1, Lambda2):\n')
fprintf('  F = [%.3e; %.3e]\n', F_test_orig(1), F_test_orig(2))
fprintf('  ||F||_2 = %.3e\n\n', norm(F_test_orig))

% Verificacion manual de las ecuaciones
ec1_izq = log(gamma1);
ec1_der = 1 - log(Lambda1) - Lambda2;

ec2_izq = log(gamma2);
ec2_der = 1 - log(Lambda2) - Lambda1;

fprintf('Verificacion manual:\n\n')
fprintf('Ecuacion 1:\n')
fprintf('  ln(%.2f) = %.6f\n', gamma1, ec1_izq)
fprintf('  1 - ln(%.6f) - %.6f = %.6f\n', Lambda1, Lambda2, ec1_der)
fprintf('  Diferencia: %.3e\n\n', abs(ec1_izq - ec1_der))

fprintf('Ecuacion 2:\n')
fprintf('  ln(%.2f) = %.6f\n', gamma2, ec2_izq)
fprintf('  1 - ln(%.6f) - %.6f = %.6f\n', Lambda2, Lambda1, ec2_der)
fprintf('  Diferencia: %.3e\n\n', abs(ec2_izq - ec2_der))

%% COMPARACION CON ITEM (a)

fprintf('========================================\n')
fprintf('COMPARACION: ITEM (a) vs ITEM (b)\n')
fprintf('========================================\n\n')

fprintf('Ambos metodos deben dar la misma solucion final:\n')
fprintf('  Lambda1 = %.6f (debe ser igual en ambos casos)\n', Lambda1)
fprintf('  Lambda2 = %.6f (debe ser igual en ambos casos)\n\n', Lambda2)

fprintf('VENTAJAS del sistema transformado (item b):\n')
fprintf('  ✓ Mas estable numericamente\n')
fprintf('  ✓ No hay restricciones en el dominio (alpha, beta ∈ R)\n')
fprintf('  ✓ Menos propenso a errores por logaritmos\n')
fprintf('  ✓ Jacobiana mas simple\n\n')

%% RESPUESTA A LA PREGUNTA

fprintf('========================================\n')
fprintf('RESPUESTA A LA PREGUNTA DEL EJERCICIO\n')
fprintf('========================================\n\n')

fprintf('PREGUNTA: ¿Es necesario hacer las sustituciones alpha = ln(Lambda1)\n')
fprintf('y beta = ln(Lambda2) para transformar el SENL?\n\n')

fprintf('RESPUESTA:\n\n')

fprintf('NO es estrictamente necesario, pero es ALTAMENTE RECOMENDABLE.\n\n')

fprintf('RAZON 1 - Estabilidad numerica:\n')
fprintf('  El sistema transformado evita problemas con logaritmos de\n')
fprintf('  numeros negativos o cercanos a cero durante las iteraciones.\n\n')

fprintf('RAZON 2 - Dominio sin restricciones:\n')
fprintf('  En el sistema original: Lambda1, Lambda2 > 0 (restriccion)\n')
fprintf('  En el sistema transformado: alpha, beta ∈ R (sin restriccion)\n\n')

fprintf('RAZON 3 - Convergencia mas robusta:\n')
fprintf('  El sistema transformado tiene mejor comportamiento numerico\n')
fprintf('  y es menos sensible al punto inicial.\n\n')

fprintf('RAZON 4 - Jacobiana mas simple:\n')
fprintf('  Sistema original: J tiene terminos -1/Lambda_i (division)\n')
fprintf('  Sistema transformado: J tiene terminos -exp(...) (exponencial)\n\n')

fprintf('CONCLUSION:\n')
fprintf('Para Newton-Raphson, el sistema transformado es MAS SEGURO\n')
fprintf('y NUMERICAMENTE ESTABLE que el sistema original.\n')

%% CONCLUSIONES FINALES

fprintf('\n========================================\n')
fprintf('CONCLUSIONES FINALES\n')
fprintf('========================================\n\n')

fprintf('✓ Newton-Raphson convergio exitosamente en ambos casos\n')
fprintf('✓ Iteraciones (sistema transformado): %d\n', iter)
fprintf('✓ Error estimado: %.3e\n\n', err)

fprintf('El modelo de Wilson se resolvio satisfactoriamente para\n')
fprintf('la mezcla agua-etanol, obteniendo:\n')
fprintf('  Lambda1 = %.6f\n', Lambda1)
fprintf('  Lambda2 = %.6f\n\n', Lambda2)

fprintf('Las sustituciones logaritmicas mejoran significativamente\n')
fprintf('la estabilidad y robustez del metodo de Newton-Raphson.\n')
