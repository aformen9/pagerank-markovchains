% Actividad 1 - Ejercicio 9a
% Graficar el polinomio p(x) = x^5 + 3x^2 - 2 en [0, 2] con 401 puntos
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 9a ==========')

%% Defino el polinomio p(x) = x^5 + 3x^2 - 2
% Los coeficientes del polinomio se definen de mayor a menor grado
% p(x) = 1*x^5 + 0*x^4 + 0*x^3 + 3*x^2 + 0*x + (-2)
coef_p = [1, 0, 0, 3, 0, -2];

%% Discretizo el intervalo [0, 2] con 401 puntos
% linspace(a, b, n) genera n puntos uniformemente distribuidos entre a y b
x = linspace(0, 2, 401);

%% Evaluo el polinomio usando polyval
% polyval(coef, x) evalua el polinomio definido por coef en los puntos x
y = polyval(coef_p, x);

%% Grafico el polinomio
figure(4)
plot(x, y, 'b')
grid on
xlabel('x')
ylabel('p(x)')
title('Polinomio p(x) = x^5 + 3x^2 - 2 en [0, 2]')

disp('Grafica del polinomio creada en Figure 4')
disp(' ')
disp('========== FIN EJERCICIO 9a ==========')

% Actividad 1 - Ejercicio 9b
% Marcar puntos evaluados en x = 0, 0.5, 1, 1.5, 2 con asteriscos
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 9b ==========')

%% Defino el polinomio p(x) = x^5 + 3x^2 - 2
coef_p = [1, 0, 0, 3, 0, -2];

%% Discretizo el intervalo [0, 2] con 401 puntos para la curva
x = linspace(0, 2, 401);
y = polyval(coef_p, x);

%% Defino los puntos especificos donde evaluar
x_puntos = [0, 0.5, 1, 1.5, 2];

%% Evaluo el polinomio en esos puntos usando polyval
y_puntos = polyval(coef_p, x_puntos);

disp('Puntos evaluados:')
disp('x = [0, 0.5, 1, 1.5, 2]')
disp('p(x) =')
disp(y_puntos)

%% Grafico el polinomio y los puntos marcados
figure(5)
plot(x, y, 'b')
hold on  % Mantiene la grafica para agregar mas elementos

% Marco los puntos con asteriscos de distintos colores
plot(x_puntos(1), y_puntos(1), 'r*', 'MarkerSize', 10)
plot(x_puntos(2), y_puntos(2), 'g*', 'MarkerSize', 10)
plot(x_puntos(3), y_puntos(3), 'm*', 'MarkerSize', 10)
plot(x_puntos(4), y_puntos(4), 'c*', 'MarkerSize', 10)
plot(x_puntos(5), y_puntos(5), 'k*', 'MarkerSize', 10)

hold off

grid on
xlabel('x')
ylabel('p(x)')
title('Polinomio p(x) = x^5 + 3x^2 - 2 con puntos marcados')
legend('p(x)', 'x=0', 'x=0.5', 'x=1', 'x=1.5', 'x=2', 'Location', 'best')

disp(' ')
disp('Grafica con puntos marcados creada en Figure 5')
disp(' ')
disp('========== FIN EJERCICIO 9b ==========')
