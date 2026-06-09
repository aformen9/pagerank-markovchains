% Recuperatorio - Ejercicio 1
% Comparacion de metodos de aproximacion de derivadas
% Alumno: Agustin Formenti

clear, clc

f = @(x) exp(x) .* cos(x);

h = 0.01;
x = linspace(-0.5, 0.5, 100);

dy_incremental = df1dx_incremental(f, x, h);

dy_centrada = df1dx_centrada(f, x, h);

%% Calculo de diferencia entre ambos metodos, como no tenemos la derivada exacta
diferencia = abs(dy_centrada - dy_incremental);

%% Graficos
figure(1)

% Subplot 1: Aproximaciones de la derivada
subplot(1, 3, 1)
plot(x, dy_incremental, 'b', x, dy_centrada, 'r')
grid on
xlabel('x')
ylabel('f''(x)')
title('Aproximaciones de la derivada')
legend('Cociente incremental', 'Derivada centrada', 'Location', 'best')

% Subplot 2: Grafico del cociente incremental
subplot(1, 3, 2)
plot(x, dy_incremental, 'b')
grid on
xlabel('x')
ylabel('f''(x)')
title('Cociente incremental')

% Subplot 3: Grafico de la derivada centrada
subplot(1, 3, 3)
plot(x, dy_centrada, 'r')
grid on
xlabel('x')
ylabel('f''(x)')
title('Derivada centrada')

%% Analisis
disp('========== ANALISIS ==========')
disp(' ')
disp('Diferencia maxima entre ambos metodos:')
disp(['Diferencia: ', num2str(max(diferencia))])
disp(' ')
disp('Tipos de errores que afectan estas aproximaciones:')
disp('1. Error de truncamiento: al aproximar la derivada con diferencias finitas')
disp('2. Error de redondeo: debido a la precision finita de la computadora')
disp('3. La derivada centrada tiene mejor precision que el cociente incremental')

disp(' ')
disp('========== FIN EJERCICIO 1 ==========')
