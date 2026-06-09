% Actividad 2 - Ejercicio 10a
% Error total del polinomio de Taylor de sen(x) en [0, pi/2]
% usando 6 y 15 terminos no nulos
% Alumno: Agustin Formenti

clear, clc

%% Intervalo y malla de puntos
x_min = 0;
x_max = pi/2;
n_puntos = 300;                  % cantidad de puntos para graficar

x = linspace(x_min, x_max, n_puntos);

%% Cantidad de terminos no nulos a usar
n_terms_vec = [6 15];

% Vectores para guardar errores
err6  = zeros(size(x));
err15 = zeros(size(x));

%% Recorro todos los puntos de x
for i = 1:length(x)
    xi = x(i);

    % ------------ n = 6 terminos ------------
    n = n_terms_vec(1);

    term = xi;          % primer termino de la serie: x
    ssum = term;        % suma parcial
    % k recorre exponentes impares: 3,5,7,...,(2*n-1)
    for k = 3:2:(2*n-1)
        term = -term * xi * xi / (k * (k-1));
        ssum = ssum + term;
    end
    aprox6 = ssum;
    err6(i) = abs(sin(xi) - aprox6);

    % ------------ n = 15 terminos ------------
    n = n_terms_vec(2);

    term = xi;          % reinicio serie
    ssum = term;
    for k = 3:2:(2*n-1)
        term = -term * xi * xi / (k * (k-1));
        ssum = ssum + term;
    end
    aprox15 = ssum;
    err15(i) = abs(sin(xi) - aprox15);
end

%% Grafico de errores
figure(1)
semilogy(x, err6, 'r', x, err15, 'b')
grid on
xlabel('x')
ylabel('Error absoluto |sen(x) - T_n(x)|')
title('Error del polinomio de Taylor de sen(x) en [0, \pi/2]')
legend('n = 6 terminos', 'n = 15 terminos', 'Location', 'best')

disp(' ')
disp('========== FIN EJERCICIO 10a ==========')


% Actividad 2 - Ejercicio 10b
% Error total del polinomio de Taylor de cos(x) en [0, pi/2]
% usando 6 y 15 terminos no nulos, usando la misma idea que SerieCoseno
% Alumno: Agustin Formenti

clear, clc

%% Intervalo y malla
x_min = 0;
x_max = pi/2;
n_puntos = 300;

x = linspace(x_min, x_max, n_puntos);

%% Cantidad de terminos
n_terms_vec = [6 15];

err6  = zeros(size(x));
err15 = zeros(size(x));

for i = 1:length(x)
    xi = x(i);

    % ---------- n = 6 terminos ----------
    n = n_terms_vec(1);

    term = 1;      % primer termino de cos(x): 1
    ssum = term;
    % exponentes pares: 2,4,6,...,(2*n)
    for k = 2:2:(2*n)
        term = -term * xi * xi / (k * (k-1));
        ssum = ssum + term;
    end
    aprox6 = ssum;
    err6(i) = abs(cos(xi) - aprox6);

    % ---------- n = 15 terminos ----------
    n = n_terms_vec(2);

    term = 1;
    ssum = term;
    for k = 2:2:(2*n)
        term = -term * xi * xi / (k * (k-1));
        ssum = ssum + term;
    end
    aprox15 = ssum;
    err15(i) = abs(cos(xi) - aprox15);
end

%% Grafico
figure(1)
semilogy(x, err6, 'r', x, err15, 'b')
grid on
xlabel('x')
ylabel('Error absoluto |cos(x) - T_n(x)|')
title('Error del polinomio de Taylor de cos(x) en [0, \pi/2]')
legend('n = 6 terminos', 'n = 15 terminos', 'Location', 'best')

disp(' ')
disp('========== FIN EJERCICIO 10b ==========')

