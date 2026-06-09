% Actividad 2 - Ejercicio 5a
% Raices de x^2 - 40x + 0.25 = 0 con la resolvente clasica
% usando aritmetica de 4 digitos y redondeo por truncamiento
% Alumno: Agustin Formenti

clear, clc

%% Datos del problema
% Ecuacion: a x^2 + b x + c = 0
a = 1;
b = -40;
c = 0.25;

fprintf('Ejercicio 5a - Resolvente clasica con 4 cifras (truncamiento)\n\n');

%% Paso 1: represento a, b, c en la maquina de 4 cifras
a4 = fl4trunc(a);
b4 = fl4trunc(b);
c4 = fl4trunc(c);

fprintf('Coeficientes en fl4 (trunc): a4 = %.4g, b4 = %.4g, c4 = %.4g\n\n', a4, b4, c4);

%% Paso 2: calculo el discriminante D = b^2 - 4ac en pasos con fl4trunc
% t1 = b^2
t1 = fl4trunc(b4 * b4);

% t2 = 4ac
t2 = fl4trunc(4 * a4 * c4);

% D = t1 - t2
D4 = fl4trunc(t1 - t2);

fprintf('Discriminante en fl4 (trunc): D4 = %.4g\n\n', D4);

%% Paso 3: calculo la raiz cuadrada del discriminante y la trunco a 4 cifras
sqrtD = sqrt(D4);
sqrtD4 = fl4trunc(sqrtD);

fprintf('sqrt(D4) exacta     = %.8f\n', sqrtD);
fprintf('sqrt(D4) en fl4     = %.4g\n\n', sqrtD4);

%% Paso 4: calculo las raices con la formula clasica
% x1 = (-b + sqrt(D)) / (2a)
% x2 = (-b - sqrt(D)) / (2a)

mb4  = fl4trunc(-b4);         % -b
den4 = fl4trunc(2 * a4);      % 2a

num1 = fl4trunc(mb4 + sqrtD4);
x1_4 = fl4trunc(num1 / den4);

num2 = fl4trunc(mb4 - sqrtD4);
x2_4 = fl4trunc(num2 / den4);

fprintf('Raices aproximadas con resolvente clasica (fl4, trunc):\n');
fprintf('  x1_4 = %.4g\n', x1_4);
fprintf('  x2_4 = %.4g\n', x2_4);

disp(' ')
disp('========== FIN EJERCICIO 5a ==========')


% Actividad 2 - Ejercicio 5b
% Demostracion de la formula mejorada para la ecuacion de 2do grado
% Alumno: Agustin Formenti

clear, clc

%% Idea general
% Partimos de la ecuacion general:
%    a x^2 + b x + c = 0
%
% Las raices "clasicas" son:
%    x = (-b ± sqrt(b^2 - 4ac)) / (2a)
%
% Definimos el discriminante:
%    D = b^2 - 4ac
%
% Entonces:
%    x1 = (-b + sqrt(D)) / (2a)
%    x2 = (-b - sqrt(D)) / (2a)
%
% Para evitar la resta de numeros muy parecidos (perdida de cifras),
% multiplicamos numerador y denominador por el conjugado apropiado.

%% Para x1:
% x1 = (-b + sqrt(D)) / (2a)
%
% Multiplicamos por el conjugado (-b - sqrt(D)) / (-b - sqrt(D)):
%
% x1 = [(-b + sqrt(D)) * (-b - sqrt(D))] / [ 2a * (-b - sqrt(D)) ]
%
% En el numerador tenemos una diferencia de cuadrados:
%    (-b + sqrt(D)) * (-b - sqrt(D)) = (-b)^2 - (sqrt(D))^2
%                                     = b^2 - D
%
% Pero D = b^2 - 4ac, entonces:
%    b^2 - D = b^2 - (b^2 - 4ac) = 4ac
%
% Por lo tanto:
%    x1 = 4ac / [ 2a * (-b - sqrt(D)) ]
%
% Simplificamos 4ac / (2a) = 2c:
%    x1 = 2c / ( -b - sqrt(D) )
%
% Multiplicando por (-1) arriba y abajo:
%    x1 = -2c / ( b + sqrt(D) )
%
% Esta es la forma mejorada:
%    x1 = -2c / ( b + sqrt(b^2 - 4ac) )

%% Para x2:
% x2 = (-b - sqrt(D)) / (2a)
%
% Multiplicamos por el conjugado (-b + sqrt(D)) / (-b + sqrt(D)):
%
% x2 = [(-b - sqrt(D)) * (-b + sqrt(D))] / [ 2a * (-b + sqrt(D)) ]
%
% El numerador es igual a antes: diferencia de cuadrados
%    (-b - sqrt(D)) * (-b + sqrt(D)) = b^2 - D = 4ac
%
% Entonces:
%    x2 = 4ac / [ 2a * (-b + sqrt(D)) ] = 2c / ( -b + sqrt(D) )
%
% Multiplicando por (-1) arriba y abajo:
%    x2 = -2c / ( b - sqrt(D) )
%
% Con esto demostramos que:
%    x1 = -2c / ( b + sqrt(b^2 - 4ac) )
%    x2 = -2c / ( b - sqrt(b^2 - 4ac) )

disp('Demostracion escrita en comentarios dentro del script.')
disp(' ')
disp('========== FIN EJERCICIO 5b ==========')


% Actividad 2 - Ejercicio 5c
% Raices de x^2 - 40x + 0.25 = 0 con la formula mejorada
% usando aritmetica de 4 digitos y redondeo por truncamiento
% Alumno: Agustin Formenti

clear, clc

%% Datos del problema
a = 1;
b = -40;
c = 0.25;

fprintf('Ejercicio 5c - Formula mejorada con 4 cifras (truncamiento)\n\n');

%% Paso 1: coeficientes en la maquina de 4 cifras
a4 = fl4trunc(a);
b4 = fl4trunc(b);
c4 = fl4trunc(c);

fprintf('Coeficientes en fl4 (trunc): a4 = %.4g, b4 = %.4g, c4 = %.4g\n\n', a4, b4, c4);

%% Paso 2: discriminante D = b^2 - 4ac en fl4
t1 = fl4trunc(b4 * b4);         % b^2
t2 = fl4trunc(4 * a4 * c4);     % 4ac
D4 = fl4trunc(t1 - t2);         % D

fprintf('Discriminante en fl4 (trunc): D4 = %.4g\n\n', D4);

%% Paso 3: raiz cuadrada de D en fl4
sqrtD  = sqrt(D4);
sqrtD4 = fl4trunc(sqrtD);

fprintf('sqrt(D4) exacta     = %.8f\n', sqrtD);
fprintf('sqrt(D4) en fl4     = %.4g\n\n', sqrtD4);

%% Paso 4: aplico formulas mejoradas
% Recordatorio:
% x1 = -2c / ( b + sqrt(D) )
% x2 = -2c / ( b - sqrt(D) )

num_mej = fl4trunc(-2 * c4);      % -2c en fl4

den1 = fl4trunc(b4 + sqrtD4);     % b + sqrt(D)
x1_mej_4 = fl4trunc(num_mej / den1);

den2 = fl4trunc(b4 - sqrtD4);     % b - sqrt(D)
x2_mej_4 = fl4trunc(num_mej / den2);

fprintf('Raices aproximadas con formula mejorada (fl4, trunc):\n');
fprintf('  x1_mejorada_4 = %.4g\n', x1_mej_4);
fprintf('  x2_mejorada_4 = %.4g\n', x2_mej_4);

disp(' ')
disp('========== FIN EJERCICIO 5c ==========')


% Actividad 2 - Ejercicio 5d
% Comparacion de errores relativos porcentuales entre
% la resolvente clasica y la formula mejorada
% Alumno: Agustin Formenti

clear, clc

%% Valores exactos de las raices con doble precision (Octave)
% Ecuacion: x^2 - 40x + 0.25 = 0
coef = [1 -40 0.25];
x_exact = roots(coef);   % devuelve un vector con las dos raices

% Ordeno las raices de menor a mayor para comparar de forma consistente
x_exact = sort(x_exact);

x1_exact = x_exact(1);
x2_exact = x_exact(2);

fprintf('Ejercicio 5d - Comparacion de errores\n\n');
fprintf('Raices exactas (doble precision):\n');
fprintf('  x1_exact = %.12f\n', x1_exact);
fprintf('  x2_exact = %.12f\n\n', x2_exact);

%% Aproximaciones con resolvente clasica (repito cuentas de 5a)
a = 1; b = -40; c = 0.25;

a4 = fl4trunc(a);
b4 = fl4trunc(b);
c4 = fl4trunc(c);

t1 = fl4trunc(b4 * b4);
t2 = fl4trunc(4 * a4 * c4);
D4 = fl4trunc(t1 - t2);
sqrtD4 = fl4trunc(sqrt(D4));

mb4  = fl4trunc(-b4);
den4 = fl4trunc(2 * a4);

num1 = fl4trunc(mb4 + sqrtD4);
x1_classic_4 = fl4trunc(num1 / den4);

num2 = fl4trunc(mb4 - sqrtD4);
x2_classic_4 = fl4trunc(num2 / den4);

%% Aproximaciones con formula mejorada (repito cuentas de 5c)
num_mej = fl4trunc(-2 * c4);

den1 = fl4trunc(b4 + sqrtD4);
x1_mejorada_4 = fl4trunc(num_mej / den1);

den2 = fl4trunc(b4 - sqrtD4);
x2_mejorada_4 = fl4trunc(num_mej / den2);

%% Calculo de errores relativos porcentuales
% Error relativo porcentual = |x_exact - x_aprox| / |x_exact| * 100

E1_classic  = abs(x1_exact - x1_classic_4)  / abs(x1_exact) * 100;
E2_classic  = abs(x2_exact - x2_classic_4)  / abs(x2_exact) * 100;

E1_mejorada = abs(x1_exact - x1_mejorada_4) / abs(x1_exact) * 100;
E2_mejorada = abs(x2_exact - x2_mejorada_4) / abs(x2_exact) * 100;

fprintf('Aproximaciones (fl4, trunc):\n');
fprintf('  Clasica   -> x1 = %.4g, x2 = %.4g\n', x1_classic_4,  x2_classic_4);
fprintf('  Mejorada  -> x1 = %.4g, x2 = %.4g\n\n', x1_mejorada_4, x2_mejorada_4);

fprintf('Errores relativos porcentuales (%%):\n');
fprintf('  x1 - Clasica   : %.4g %%\n', E1_classic);
fprintf('  x1 - Mejorada  : %.4g %%\n', E1_mejorada);
fprintf('  x2 - Clasica   : %.4g %%\n', E2_classic);
fprintf('  x2 - Mejorada  : %.4g %%\n\n', E2_mejorada);

%% Comentario corto (a nivel de ejercicio)
% La raiz "chiquita" es la que mas sufre la perdida de cifras
% cuando usamos la formula clasica, porque hay resta de
% numeros muy parecidos en el numerador.
% La formula mejorada evita esa resta y conserva mas cifras,
% por eso el error relativo es mucho menor para esa raiz.

disp('========== FIN EJERCICIO 5d ==========')
