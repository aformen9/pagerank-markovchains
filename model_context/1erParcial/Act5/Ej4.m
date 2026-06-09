% Actividad 5 - Ejercicio 4b
% Resolver sistema 2x2 con Gauss modificado que imprime cada paso
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 4b')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales 2x2
% Sistema:
%   17x + 5y = 22
%   1.7x + 0.5y = 2.2

% Matriz de coeficientes A
A = [17, 5;
     1.7, 0.5];

% Vector lado derecho b
b = [22; 2.2];

disp('Sistema de ecuaciones lineales 2x2:')
disp('17x + 5y = 22')
disp('1.7x + 0.5y = 2.2')
disp(' ')
disp('Matriz de coeficientes A:')
disp(A)
disp(' ')
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Resolucion con Gauss modificado
% La version modificada imprime la matriz aumentada en cada paso
% para poder observar el proceso de eliminacion gaussiana

disp('========================================')
disp('PROCESO DE ELIMINACION GAUSSIANA')
disp('========================================')
disp(' ')

x = Gauss_mod(A, b);

disp('========================================')
disp('RESULTADO FINAL')
disp('========================================')
disp(' ')

disp('Solucion del sistema (x):')
disp(x)
disp(' ')

%% Verificacion de la solucion
% Calculamos Ax y comparamos con b

Ax = A * x;

disp('Verificacion: A*x debe ser igual a b')
disp('A*x =')
disp(Ax)
disp('b =')
disp(b)
disp(' ')

%% Vector residual
r = b - Ax;
norma_r = normap(r, 2);

fprintf('Norma del residual ||b - Ax||_2 = %.10e\n', norma_r)

disp(' ')
disp('========== FIN EJERCICIO 4b ==========')


% Actividad 5 - Ejercicio 4c
% Analisis del error numerico en el sistema 2x2
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 4c')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales 2x2
% Sistema:
%   17x + 5y = 22
%   1.7x + 0.5y = 2.2

% Matriz de coeficientes A
A = [17, 5;
     1.7, 0.5];

% Vector lado derecho b
b = [22; 2.2];

disp('Sistema de ecuaciones lineales 2x2:')
disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Analisis teorico del sistema
% Este sistema tiene una propiedad especial:
% La segunda fila es exactamente 1/10 de la primera fila
% 1.7 = 17/10, 0.5 = 5/10, 2.2 = 22/10
% Por lo tanto, las dos ecuaciones son DEPENDIENTES

disp('OBSERVACION TEORICA:')
disp('La segunda ecuacion es 1/10 de la primera ecuacion:')
fprintf('Fila 2 / Fila 1 = %.2f / %.2f = %.2f\n', A(2,1), A(1,1), A(2,1)/A(1,1))
fprintf('                   %.2f / %.2f = %.2f\n', A(2,2), A(1,2), A(2,2)/A(1,2))
fprintf('                   %.2f / %.2f = %.2f\n', b(2), b(1), b(2)/b(1))
disp(' ')
disp('Las ecuaciones son LINEALMENTE DEPENDIENTES.')
disp('Esto significa que hay INFINITAS soluciones (recta).')
disp(' ')

%% Resolucion con Gauss y observacion de la ultima fila
% Usamos la version modificada para ver la matriz aumentada final

disp('========================================')
disp('PROCESO DE ELIMINACION GAUSSIANA')
disp('========================================')
disp(' ')

x = Gauss_mod(A, b);

disp('========================================')
disp(' ')

%% Analisis de la ultima fila
% Calculamos manualmente la matriz aumentada despues de la eliminacion

Aum = [A b];

% Pivoteo: intercambiamos filas si es necesario
% En este caso, la fila 1 es el pivote (17 > 1.7)

% Eliminacion: restamos m21 * fila1 de fila2
m21 = Aum(2,1) / Aum(1,1);
Aum(2,:) = Aum(2,:) - m21 * Aum(1,:);

disp('ANALISIS DE LA ULTIMA FILA:')
fprintf('Multiplicador m21 = %.10f\n', m21)
disp(' ')
disp('Ultima fila de la matriz aumentada despues de eliminacion:')
fprintf('[%.10e, %.10e, %.10e]\n', Aum(2,1), Aum(2,2), Aum(2,3))
disp(' ')

%% Explicacion del error numerico
disp('EXPLICACION DEL ERROR NUMERICO:')
disp('---------------------------------------------------------------')
disp('Teoricamente, la ultima fila deberia ser [0, 0, 0] porque')
disp('las ecuaciones son linealmente dependientes.')
disp(' ')
disp('Sin embargo, en la salida de pantalla la ultima fila NO es')
disp('exactamente nula debido a:')
disp(' ')
disp('1. ERROR DE REDONDEO: Los numeros de punto flotante tienen')
disp('   precision finita. Los valores 1.7, 0.5 y 2.2 no se pueden')
disp('   representar exactamente en binario.')
disp(' ')
disp('2. ACUMULACION DE ERRORES: Durante las operaciones aritmeticas')
disp('   de la eliminacion gaussiana, los errores de redondeo se')
disp('   acumulan.')
disp(' ')
disp('3. RESULTADO: La ultima fila queda con valores muy pequenos')
disp('   (del orden de 1e-15 o epsilon maquina) en lugar de ceros')
disp('   exactos.')
disp(' ')
disp('Aunque numericamente aparece un valor no nulo muy pequeno,')
disp('matematicamente sabemos que el sistema tiene infinitas soluciones.')
disp('---------------------------------------------------------------')

disp(' ')
disp('========== FIN EJERCICIO 4c ==========')
