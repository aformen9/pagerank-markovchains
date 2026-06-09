% Actividad 2 - Ejercicio 3a
% Version modificada de ZoomPoli: evaluacion estable de (x-1)^6
% Alumno: Agustin Formenti

clear; clc; close all;

%% Este script replica ZoomPoli pero usando SOLO la forma factorizada:
%    p(x) = (x - 1)^6
% La idea es mostrar que desaparecen las oscilaciones numericas que se
% observan cuando se usa la forma expandida de grado 6.
figure(1)
k = 0;
n = 100;

%% Barrido de ventanas de zoom alrededor de x = 1
for delta = [0.1 0.01 0.008 0.007 0.005 0.003]

    %% Discretizo el intervalo centrado en 1
    x = linspace(1 - delta, 1 + delta, n)';

    %% Evaluo el polinomio en forma factorizada
    y_fact = (x - 1).^6;

    %% Acumulo subplot
    k = k + 1;

    subplot(2,3,k)
    plot(x, y_fact, 'b', 'LineWidth', 1.5), grid on
    hold on
    plot(x, zeros(size(x)), 'k--')   % eje x
    hold off

    %% Ajusto los ejes para ver bien el zoom
    axis([1 - delta, 1 + delta, -max(abs(y_fact)) max(abs(y_fact))])
    title(['\delta = ', num2str(delta)])
end

disp(' ')
disp('========== FIN EJERCICIO 3a ==========')

% Actividad 2 - Ejercicio 3b
% Comparacion entre la forma expandida y la factorizada de (x-1)^6
% Alumno: Agustin Formenti

clear; clc; close all;

%% Dominios de zoom igual que en ZoomPoli
figure(2)
k = 0;
n = 100;

for delta = [0.1 0.01 0.008 0.007 0.005 0.003]

    x = linspace(1 - delta, 1 + delta, n)';

    %% Forma expandida (misma del script original ZoomPoli)
    y_exp = x.^6 - 6*x.^5 + 15*x.^4 - 20*x.^3 + 15*x.^2 - 6*x + 1;

    %% Forma factorizada
    y_fact = (x - 1).^6;

    k = k + 1;
    subplot(2,3,k)


    plot(x, y_exp, 'r--', 'LineWidth', 1.2), hold on
    plot(x, y_fact, 'b', 'LineWidth', 1.5)
    plot(x, zeros(size(x)), 'k--')
    hold off, grid on

    axis([1 - delta, 1 + delta, -max(abs(y_exp)) max(abs(y_exp))])
    title(['\delta = ', num2str(delta)])

end

disp(' ')
disp('========== FIN EJERCICIO 3b ==========')


% Actividad 2 - Ejercicio 3c
% Explicacion del fenomeno de oscilacion observado en ZoomPoli
% Alumno: Agustin Formenti

clear; clc;

%% Comentario teorico
%
% El polinomio p(x) = (x - 1)^6 es matematicamente estable cerca de x = 1,
% pero la forma expandida:
%
%    x^6 - 6x^5 + 15x^4 - 20x^3 + 15x^2 - 6x + 1
%
% genera terminos muy grandes cuya resta debe dar un numero extremadamente
% chico. Ejemplo: cerca de x = 1:
%   x^6  ≈ 1
%   6x^5 ≈ 6
%   15x^4 ≈ 15
%   ...
% y todo eso debe terminar valiendo algo del orden de 10^-6.
%
% Esto provoca CANCELACION CATASTROFICA:
%   - se restan numeros muy grandes pero muy parecidos,
%   - cada termino fue calculado con redondeo de punto flotante,
%   - el error relativo se amplifica,
%   - la grafica produce oscilaciones numericas inexistentes en el polinomio real.
%
% Cuando se usa la forma factorizada:
%         (x - 1)^6
% los terminos intermedios no aparecen: se opera con un numero pequeño (x - 1).
% Por eso su evaluacion es MUCHISIMO mas estable numericamente.
%
% Conclusión:
%   La forma expandida es numericamente inestable cerca de x = 1.
%   La forma factorizada elimina la cancelacion y evita las oscilaciones.

disp('Explicacion completa incluida en los comentarios del script.')
disp(' ')
disp('========== FIN EJERCICIO 3c ==========')

