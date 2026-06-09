% Actividad 5 - Ejercicio 8
% Determinar si matrices son definidas positivas
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 8')
disp('==========================')
disp('Matrices definidas positivas')
disp(' ')

%% Definicion: Matriz definida positiva
% Una matriz simetrica A es definida positiva si:
% x^T * A * x > 0 para todo vector x no nulo

disp('DEFINICION:')
disp('Una matriz simetrica A es DEFINIDA POSITIVA si:')
disp('x^T * A * x > 0 para todo vector x != 0')
disp(' ')
disp('Metodos de verificacion:')
disp('1. Calcular x^T * A * x y analizar si siempre es positivo')
disp('2. Verificar que todos los autovalores de A sean positivos')
disp(' ')
disp('=========================================')
disp(' ')

%% Matriz A1 = [1 0; 0 2]

disp('MATRIZ A1:')
A1 = [1, 0;
      0, 2];
disp(A1)
disp(' ')

% Verificacion con autovalores
autovalores_A1 = eig(A1);
disp('Autovalores de A1:')
disp(autovalores_A1)

if all(autovalores_A1 > 0)
    disp('Todos los autovalores son POSITIVOS')
    disp('=> A1 ES DEFINIDA POSITIVA')
else
    disp('Hay autovalores no positivos')
    disp('=> A1 NO ES DEFINIDA POSITIVA')
end

disp(' ')
disp('Verificacion algebraica con x = [x1; x2]:')
disp('x^T * A1 * x = [x1 x2] * [1 0] * [x1]')
disp('                         [0 2]   [x2]')
disp('             = x1^2 + 2*x2^2')
disp(' ')
disp('Como x1^2 >= 0 y 2*x2^2 >= 0, y al menos uno es > 0 si x != 0,')
disp('entonces x^T * A1 * x > 0 para todo x != 0')
disp('CONCLUSION: A1 ES DEFINIDA POSITIVA')

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Matriz A2 = [2 -1; 1 2]

disp('MATRIZ A2:')
A2 = [2, -1;
      1,  2];
disp(A2)
disp(' ')

% Verificar si es simetrica
if isequal(A2, A2')
    disp('A2 es SIMETRICA')
else
    disp('A2 NO es simetrica')
    disp('ADVERTENCIA: Para ser definida positiva, una matriz debe ser simetrica')
end
disp(' ')

% Verificacion con autovalores
autovalores_A2 = eig(A2);
disp('Autovalores de A2:')
disp(autovalores_A2)

if all(autovalores_A2 > 0)
    disp('Todos los autovalores son POSITIVOS')
else
    disp('Hay autovalores no positivos')
end

disp(' ')
disp('Verificacion algebraica con x = [x1; x2]:')
disp('x^T * A2 * x = [x1 x2] * [2 -1] * [x1]')
disp('                         [1  2]   [x2]')
disp('             = [2*x1-x2, -x1+2*x2] * [x1]')
disp('                                     [x2]')
disp('             = 2*x1^2 - x1*x2 - x1*x2 + 2*x2^2')
disp('             = 2*x1^2 - 2*x1*x2 + 2*x2^2')
disp(' ')
disp('Esta expresion NO siempre es positiva porque A2 no es simetrica.')
disp('CONCLUSION: A2 NO ES DEFINIDA POSITIVA (no es simetrica)')

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Matriz A3 = [-2 1 1; 1 2 1; 1 1 2]

disp('MATRIZ A3:')
A3 = [-2, 1, 1;
       1, 2, 1;
       1, 1, 2];
disp(A3)
disp(' ')

% Verificar si es simetrica
if isequal(A3, A3')
    disp('A3 es SIMETRICA')
else
    disp('A3 NO es simetrica')
end
disp(' ')

% Verificacion con autovalores
autovalores_A3 = eig(A3);
disp('Autovalores de A3:')
disp(autovalores_A3)

if all(autovalores_A3 > 0)
    disp('Todos los autovalores son POSITIVOS')
    disp('=> A3 ES DEFINIDA POSITIVA')
else
    disp('Hay autovalores no positivos')
    disp('=> A3 NO ES DEFINIDA POSITIVA')
    fprintf('Autovalor minimo: %.6f\n', min(autovalores_A3))
end

disp(' ')
disp('Observacion: A3 tiene un elemento diagonal NEGATIVO (a11 = -2).')
disp('Esto es una señal de que probablemente NO sea definida positiva.')
disp(' ')
disp('CONCLUSION: A3 NO ES DEFINIDA POSITIVA')

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Matriz A4 = [2 -1 0; -1 2 -1; 0 -1 2]

disp('MATRIZ A4:')
A4 = [2, -1,  0;
     -1,  2, -1;
      0, -1,  2];
disp(A4)
disp(' ')

% Verificar si es simetrica
if isequal(A4, A4')
    disp('A4 es SIMETRICA')
else
    disp('A4 NO es simetrica')
end
disp(' ')

% Verificacion con autovalores
autovalores_A4 = eig(A4);
disp('Autovalores de A4:')
disp(autovalores_A4)

if all(autovalores_A4 > 0)
    disp('Todos los autovalores son POSITIVOS')
    disp('=> A4 ES DEFINIDA POSITIVA')
else
    disp('Hay autovalores no positivos')
    disp('=> A4 NO ES DEFINIDA POSITIVA')
end

disp(' ')
disp('Verificacion adicional con x = [x1; x2; x3]:')
disp('x^T * A4 * x = 2*x1^2 - 2*x1*x2 + 2*x2^2 - 2*x2*x3 + 2*x3^2')
disp('             = 2*(x1^2 - x1*x2 + x2^2 - x2*x3 + x3^2)')
disp(' ')
disp('Completando cuadrados:')
disp('= 2*[(x1 - x2/2)^2 + (3/4)*x2^2 - x2*x3 + x3^2]')
disp('= 2*[(x1 - x2/2)^2 + (x2*sqrt(3)/2 - x3*sqrt(4/3))^2 + ...]')
disp(' ')
disp('Como todos los autovalores son positivos, x^T * A4 * x > 0')
disp('para todo x != 0')
disp(' ')
disp('CONCLUSION: A4 ES DEFINIDA POSITIVA')

disp(' ')
disp('=========================================')
disp(' ')

%% Resumen final

disp('RESUMEN:')
disp('=========================================')
fprintf('A1: DEFINIDA POSITIVA     (autovalores: %.2f, %.2f)\n', autovalores_A1(1), autovalores_A1(2))
fprintf('A2: NO DEFINIDA POSITIVA  (no es simetrica)\n')
fprintf('A3: NO DEFINIDA POSITIVA  (autovalor minimo: %.4f < 0)\n', min(autovalores_A3))
fprintf('A4: DEFINIDA POSITIVA     (autovalores: %.4f, %.4f, %.4f)\n', autovalores_A4(1), autovalores_A4(2), autovalores_A4(3))
disp('=========================================')

disp(' ')
disp('========== FIN EJERCICIO 8 ==========')
