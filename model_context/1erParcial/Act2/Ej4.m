% Actividad 2 - Ejercicio 4a
% Funcion f(x) = 1/(1+2x) - (1-x)/(1+x) cerca de x ~ 0
% Alumno: Agustin Formenti

clear, clc

%% Comentario teorico
% La funcion es:
%   f(x) = 1/(1+2x) - (1-x)/(1+x)
%
% Para x cercano a 0:
%   1/(1+2x)  ~ 1
%   (1-x)/(1+x) ~ 1
%
% Entonces, numericamente estamos restando dos numeros muy parecidos a 1.
% Esa resta:
%   "numero ~1" - "numero ~1"
% produce CANCELACION CATASTROFICA: se pierden muchas cifras
% significativas y el resultado (que deberia ser chico) queda contaminado
% por el error de redondeo.
%
% En punto flotante, cada termino se redondea antes de restar. Como el
% resultado verdadero es del orden de x^2, termina siendo comparable con
% el error numerico y la evaluacion de f(x) cerca de 0 es inestable.

%% Demostracion numerica simple (opcional)
x_prueba = [1e-1, 1e-3, 1e-6, 1e-8]';      % valores chicos

f_original = 1./(1+2*x_prueba) - (1 - x_prueba)./(1 + x_prueba);

disp('x        f(x) numerico (forma original)')
disp([x_prueba f_original])

disp(' ')
disp('Ver comentarios en el script para la explicacion teorica.')
disp('========== FIN EJERCICIO 4a ==========')


% Actividad 2 - Ejercicio 4b
% Reescritura algebraica de f(x) para evitar cancelacion
% Alumno: Agustin Formenti

clear, clc

%% Paso 1: Definicion original
% f(x) = 1/(1+2x) - (1-x)/(1+x)

%% Paso 2: Llevar a un mismo denominador (hecho a mano, explicado aca)
%   f(x) = [ (1+x) - (1-x)(1+2x) ] / [ (1+2x)(1+x) ]
%
% Desarrollo del numerador:
%   (1 - x)(1 + 2x) = 1 + 2x - x - 2x^2 = 1 + x - 2x^2
%
% Entonces:
%   Numerador = (1 + x) - (1 + x - 2x^2) = 2x^2
%
% Resultado final:
%   f(x) =  2x^2 / [ (1+2x)(1+x) ]

%% Paso 3: Defino ambas expresiones para comparar numericamente
x = linspace(-1e-2, 1e-2, 9)';   % valores chicos alrededor de 0

f_original = 1./(1+2*x) - (1 - x)./(1 + x);
f_reescrita = (2 .* x.^2) ./ ( (1 + 2*x) .* (1 + x) );

tabla = [x f_original f_reescrita];
disp('      x        f original             f reescrita')
disp(tabla)

%% Comentario
% La expresion:
%   f(x) = 2x^2 / ((1+2x)(1+x))
% evita la resta de dos numeros ~1.
% Para x cercano a 0, el denominador ~1 y el numerador ~2x^2.
% Esto es numericamente mucho mas estable que la forma original.

disp(' ')
disp('========== FIN EJERCICIO 4b ==========')


% Actividad 2 - Ejercicio 4c
% Ploteo de f(x) con ambas expresiones en tres intervalos
% Alumno: Agustin Formenti

clear, clc, close all

%% Defino la malla con el paso indicado
% ATENCION: paso = 1e-10 genera MUCHISIMOS puntos en [-1e-1,1e-1].
% En la practica se podria usar un paso mas grande, pero aca sigo
% literalmente la consigna.
paso = 1e-7;
#el paso es 1e-10 pero es enorme para la pc.
%% Intervalos
I1 = [-1e-1,  1e-1];
I2 = [-1e-7,  1e-7];
I3 = [-1e-8,  1e-8];

%% Funciones como handles para usar las dos formas
f_original  = @(x) 1./(1+2*x) - (1 - x)./(1 + x);
f_reescrita = @(x) (2 .* x.^2) ./ ( (1 + 2*x) .* (1 + x) );

%% Figura y subplots
figure(1)

%% Subplot 1: intervalo I1
x1 = I1(1):paso:I1(2);
y1_orig  = f_original(x1);
y1_reesc = f_reescrita(x1);

subplot(3,1,1)
plot(x1, y1_orig, 'r-', x1, y1_reesc, 'b--')
grid on
xlabel('x')
ylabel('f(x)')
title(['Intervalo I1 = [', num2str(I1(1)), ', ', num2str(I1(2)), ']'])
legend('Forma original', 'Forma reescrita', 'Location', 'best')

%% Subplot 2: intervalo I2
x2 = I2(1):paso:I2(2);
y2_orig  = f_original(x2);
y2_reesc = f_reescrita(x2);

subplot(3,1,2)
plot(x2, y2_orig, 'r-', x2, y2_reesc, 'b--')
grid on
xlabel('x')
ylabel('f(x)')
title(['Intervalo I2 = [', num2str(I2(1)), ', ', num2str(I2(2)), ']'])
legend('Forma original', 'Forma reescrita', 'Location', 'best')

%% Subplot 3: intervalo I3
x3 = I3(1):paso:I3(2);
y3_orig  = f_original(x3);
y3_reesc = f_reescrita(x3);

subplot(3,1,3)
plot(x3, y3_orig, 'r-', x3, y3_reesc, 'b--')
grid on
xlabel('x')
ylabel('f(x)')
title(['Intervalo I3 = [', num2str(I3(1)), ', ', num2str(I3(2)), ']'])
legend('Forma original', 'Forma reescrita', 'Location', 'best')

disp(' ')
disp('========== FIN EJERCICIO 4c ==========')

