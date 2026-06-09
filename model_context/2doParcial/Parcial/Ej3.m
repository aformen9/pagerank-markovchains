%%% Ej3
%%% Autor: Agustin Formenti

%% 3a

clear; clc;

xi = [0.0, 1.0, 2.0, 3.0, 4.0];
yi = [10.1, 15.3, 18.4, 17.0, 16.6];

x_plot = linspace(0, 4, 200);
y_plot = lagran(x_plot, xi, yi);

plot(x_plot, y_plot, 'b-', 'LineWidth', 1.5);

%% 3b

clear; clc;

xi = [0.0, 1.0, 2.0, 3.0, 4.0];
yi = [10.1, 15.3, 18.4, 17.0, 16.6];

x_plot = linspace(0, 4, 200);
y_plot = lagran(x_plot, xi, yi);

figure;
hold on;
grid on;

plot(xi, yi, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(x_plot, y_plot, 'b-', 'LineWidth', 1.5);

xlabel('Voltaje [V]');
ylabel('Temperatura [C]');
title('Calibracion de Sensor');
legend('Datos', 'Polinomio');
hold off;

%% 3c
clear; clc;

xi = [0.0, 1.0, 2.0, 3.0, 4.0];
yi = [10.1, 15.3, 18.4, 17.0, 16.6];

% Interpolacion
x_interp = [0.5, 1.5, 2.5, 3.5];
disp('Interpolacion:')
for i = 1:length(x_interp)
    T = lagran(x_interp(i), xi, yi);
    disp(['V = ', num2str(x_interp(i)), ' => T = ', num2str(T), ' C'])
end

% Extrapolacion en 5V
disp(' ')
disp('Extrapolacion:')
T_ext = lagran(5.0, xi, yi);
disp(['V = 5.0 => T = ', num2str(T_ext), ' C'])
