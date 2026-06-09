%% Ejercicio 6 - Actividad 10
%% Ajuste con g(x) = c1 + c2*x + c3*sen(x) + c4*x*e^x
%% Usando base.m y ajustebase.m
%% Autor: Agustín Formenti

clear; clc;

%% Datos del problema
x = [0.1, 0.4, 0.5, 0.6, 0.7, 0.9];
y = [0.61, 0.92, 0.99, 1.52, 1.47, 2.03];

%% Usamos ajustebase con la función base.m
%% base.m define: f1(x)=1, f2(x)=x, f3(x)=sen(x), f4(x)=x*e^x
c = ajustebase(x, y, 'base');

fprintf('Coeficientes de la función de ajuste:\n');
fprintf('c1 = %.6f\n', c(1));
fprintf('c2 = %.6f\n', c(2));
fprintf('c3 = %.6f\n', c(3));
fprintf('c4 = %.6f\n', c(4));
fprintf('\nLa función es: g(x) = %.4f + %.4f*x + %.4f*sen(x) + %.4f*x*e^x\n', ...
        c(1), c(2), c(3), c(4));

%% Calculamos los valores ajustados usando la función g(x)
y_ajustado = c(1) + c(2)*x + c(3)*sin(x) + c(4)*x.*exp(x);

%% Calculamos el ECM
ecm = ECM(x, y, y_ajustado, 'base');
fprintf('El ECM es: %.6f\n', ecm);

%% Graficamos los datos y el ajuste
figure;
hold on;

%% Puntos datos
plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Datos');

%% Curva ajustada
x_plot = linspace(min(x), max(x), 200);
y_plot = c(1) + c(2)*x_plot + c(3)*sin(x_plot) + c(4)*x_plot.*exp(x_plot);
plot(x_plot, y_plot, 'm-', 'LineWidth', 2, 'DisplayName', 'g(x) ajustada');

hold off;
grid on;
xlabel('x');
ylabel('y');
title('Ajuste con funciones base: g(x) = c_1 + c_2x + c_3sen(x) + c_4xe^x');
legend('Location', 'best');
