% Recuperatorio - Ejercicio 1
% Alumno: Agustin Formenti

clear, clc

f = @(x) exp(x) .* cos(x);

f_prima_exacta = @(x) exp(x) .* (cos(x) - sin(x));

h = 0.01;
x = linspace(-0.5, 0.5, 100);

dy_incremental = df1dx_incremental(f, x, h);

dy_centrada = df1dx_centrada(f, x, h);

% Derivada exacta
dy_exacta = f_prima_exacta(x);

% Error incremental
error_incremental = abs(dy_exacta - dy_incremental);

% Error centrado
error_centrada = abs(dy_exacta - dy_centrada);

%% Grafico
figure(1)

% Aproximaciones de la derivada
subplot(1, 4, 1)
plot(x, dy_incremental, 'b')
grid on
xlabel('x')
ylabel('f''(x)')
title('Aproximaciones derivada incremental')

subplot(1, 4, 2)
plot(x, dy_centrada, 'r')
grid on
xlabel('x')
ylabel('f''(x)')
title('Aproximaciones derivada centrada')

% Error absoluto incremental
subplot(1, 4, 3)
plot(x, error_incremental, 'b')
grid on
xlabel('x')
ylabel('Error absoluto')
title('Error: Cociente incremental')

% Error absoluto centrada
subplot(1, 4, 4)
plot(x, error_centrada, 'r')
grid on
xlabel('x')
ylabel('Error absoluto')
title('Error: Derivada centrada')

%% Los tipos de errores que afectan estas aproximaciones son:
%% Error de truncamiento -> se aproxima la derivada con dif finitas
%% Error de redondeo -< precision de la compu

