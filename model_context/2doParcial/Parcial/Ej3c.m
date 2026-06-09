%% Ejercicio 3c - Interpolacion y extrapolacion
%% Autor: Agustin Formenti

clear; clc;

xi = [0.0, 1.0, 2.0, 3.0, 4.0];
yi = [10.1, 15.3, 18.4, 17.0, 16.6];

%% Interpolacion
x_interp = [0.5, 1.5, 2.5, 3.5];
disp('Interpolacion:')
for i = 1:length(x_interp)
    T = lagran(x_interp(i), xi, yi);
    disp(['V = ', num2str(x_interp(i)), ' => T = ', num2str(T), ' C'])
end

%% Extrapolacion en 5V
disp(' ')
disp('Extrapolacion:')
T_ext = lagran(5.0, xi, yi);
disp(['V = 5.0 => T = ', num2str(T_ext), ' C'])
