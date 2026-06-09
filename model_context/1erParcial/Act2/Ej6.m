% Actividad 2 - Ejercicio 6a
% Uso de la funcion cuad.m para hallar las raices de
% x^2 - 1000000.000001 x + 1 = 0
% Alumno: Agustin Formenti

clear, clc

%% Datos de la ecuacion
a = 1;
b = -1000000.000001;
c = 1;

disp('Ejercicio 6a - Raices con cuad.m (formula clasica)')
disp(' ')

%% Llamo a la funcion cuad (ya dada por la catedra)
% cuad.m usa la resolvente clasica:
% x1 = (-b + sqrt(b^2 - 4ac)) / (2a)
% x2 = (-b - sqrt(b^2 - 4ac)) / (2a)
[x1, x2] = cuad(a, b, c);

fprintf('Ecuacion: x^2 - 1000000.000001 x + 1 = 0\n\n');
fprintf('Raices calculadas con cuad.m:\n');
fprintf('  x1 = %.16f\n', x1);
fprintf('  x2 = %.16f\n', x2);

disp(' ')
disp('========== FIN EJERCICIO 6a ==========')


% Actividad 2 - Ejercicio 6c
% Comparacion entre cuad.m y cuad_mejor.m y conclusiones
% para la ecuacion x^2 - 1000000.000001 x + 1 = 0
% Alumno: Agustin Formenti

clear, clc

%% Datos de la ecuacion
a = 1;
b = -1000000.000001;
c = 1;

disp('Ejercicio 6c - Comparacion de resultados')
disp(' ')

%% Raices con formula clasica (cuad.m)
[x1_clas, x2_clas] = cuad(a, b, c);

%% Raices con formulas mejoradas (cuad_mejor.m)
[x1_mej, x2_mej] = cuad_mejor(a, b, c);

%% Raices "exactas" en doble precision (para medir errores)
coef = [a b c];
raices_exactas = sort(roots(coef));   % ordeno de menor a mayor

x1_exact = raices_exactas(1);   % raiz chica
x2_exact = raices_exactas(2);   % raiz grande

fprintf('Raices exactas (doble precision):\n');
fprintf('  x1_exact = %.16f\n', x1_exact);
fprintf('  x2_exact = %.16f\n\n', x2_exact);

fprintf('Raices con cuad.m (clasica):\n');
fprintf('  x1_clas = %.16f\n', x1_clas);
fprintf('  x2_clas = %.16f\n\n', x2_clas);

fprintf('Raices con cuad_mejor.m (mejorada):\n');
fprintf('  x1_mej  = %.16f\n', x1_mej);
fprintf('  x2_mej  = %.16f\n\n', x2_mej);

%% Calculo errores relativos para cada raiz y cada metodo
err_rel_x1_clas = abs(x1_exact - x1_clas) / abs(x1_exact);
err_rel_x2_clas = abs(x2_exact - x2_clas) / abs(x2_exact);

err_rel_x1_mej  = abs(x1_exact - x1_mej)  / abs(x1_exact);
err_rel_x2_mej  = abs(x2_exact - x2_mej)  / abs(x2_exact);

fprintf('Errores relativos (normales, no porcentaje):\n');
fprintf('  x1 - clasica   : %.4e\n', err_rel_x1_clas);
fprintf('  x1 - mejorada  : %.4e\n', err_rel_x1_mej);
fprintf('  x2 - clasica   : %.4e\n', err_rel_x2_clas);
fprintf('  x2 - mejorada  : %.4e\n\n', err_rel_x2_mej);

%% Comentario para conclusiones (para escribir en el informe)
% En esta ecuacion el coeficiente b es muy grande en modulo y c es chico.
% Al usar la formula clasica, en una de las raices aparece la resta
% de numeros muy grandes y muy parecidos en el numerador, lo que produce
% perdida de cifras significativas.
%
% Las formulas mejoradas de cuad_mejor.m evitan esa resta directa y dan
% una aproximacion mucho mas precisa para la raiz que es numericamente
% mas sensible (la raiz "chica"). Esto se ve en que el error relativo
% con la formula mejorada es mucho menor que con la formula clasica.

disp('========== FIN EJERCICIO 6c ==========')

