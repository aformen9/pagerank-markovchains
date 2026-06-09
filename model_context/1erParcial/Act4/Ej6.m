% Actividad 4 - Ejercicio 6a
% Estudio grafico de s(x) = sign(x-2)*sqrt(|x-2|) en [0,4]
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion
% s(x) = sign(x-2) * sqrt(|x-2|)
% Esta funcion tiene una raiz en x=2
s = @(x) sign(x - 2) .* sqrt(abs(x - 2));

%% Discretizo el intervalo [0,4]
x = linspace(0, 4, 400);

%% Grafico la funcion
figure(1)
plot(x, s(x), 'b', 'linewidth', 2)
grid on
hold on

% Agrego linea y=0
plot(x, 0*x, 'k--')

% Marco el punto x=2 donde esta la raiz
plot(2, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')

xlabel('x')
ylabel('s(x)')
title('s(x) = sign(x-2) * sqrt(|x-2|)')
legend('s(x)', 'y=0', 'raiz en x=2', 'Location', 'best')

disp(' ')
disp('Ejercicio 6a - Estudio grafico')
disp(' ')
disp('Observacion: s(x) tiene una raiz SIMPLE en x = 2')
disp(' ')
disp('Analisis:')
disp('  - Para x < 2: s(x) = -sqrt(2-x) < 0')
disp('  - Para x = 2: s(2) = 0')
disp('  - Para x > 2: s(x) = sqrt(x-2) > 0')
disp(' ')
disp('La funcion cruza el eje x en x=2, por lo tanto es una raiz simple.')
disp('Sin embargo, la derivada NO es continua en x=2 (tiene un "pico").')

disp(' ')
disp('========== FIN EJERCICIO 6a ==========')


% Actividad 4 - Ejercicio 6b
% Usar NewtonRaphsonDeriv para hallar raiz de s(x) con x0 = 2.5
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion
% s(x) = sign(x-2) * sqrt(|x-2|)
s = @(x) sign(x - 2) .* sqrt(abs(x - 2));

%% Parametros del metodo
x0 = 2.5;        % aproximacion inicial
tol = 1e-12;
itmax = 50;

disp('Ejercicio 6b - Newton-Raphson con derivada numerica')
disp(' ')
disp('Uso NewtonRaphsonDeriv porque la derivada analitica es complicada')
disp('cerca de x=2 (la derivada no es continua en x=2).')
disp(' ')

%% Aplico Newton-Raphson con derivada numerica
r = NewtonRaphsonDeriv(s, x0, tol, itmax);

%% Resultado
disp(' ')
fprintf('Aproximacion obtenida: %.12f\n', r)
fprintf('Raiz exacta:           2.0\n')
fprintf('Error absoluto:        %.12e\n', abs(r - 2))

disp(' ')
disp('========== FIN EJERCICIO 6b ==========')


% Actividad 4 - Ejercicio 6c
% Analizar convergencia de Newton-Raphson para s(x) = sign(x-2)*sqrt(|x-2|)
% Alumno: Agustin Formenti

clear, clc

disp('Ejercicio 6c - Analisis de convergencia')
disp(' ')

%% Explicacion del fenomeno numerico
disp('PROBLEMA CON NEWTON-RAPHSON EN ESTE CASO:')
disp('=========================================')
disp(' ')
disp('La funcion s(x) = sign(x-2)*sqrt(|x-2|) tiene una raiz en x=2,')
disp('pero su DERIVADA no es continua en x=2.')
disp(' ')
disp('Calculemos la derivada para x ≠ 2:')
disp(' ')
disp('  Para x > 2:  s(x) = sqrt(x-2)')
disp('               s''(x) = 1/(2*sqrt(x-2))')
disp(' ')
disp('  Para x < 2:  s(x) = -sqrt(2-x)')
disp('               s''(x) = 1/(2*sqrt(2-x))')
disp(' ')
disp('  En x = 2:    s''(2) --> INFINITO  (derivada NO definida)')
disp(' ')

disp('CONSECUENCIA PARA NEWTON-RAPHSON:')
disp('==================================')
disp(' ')
disp('La formula de N-R es:  x_{n+1} = x_n - f(x_n)/f''(x_n)')
disp(' ')
disp('Cuando x_n --> 2, tenemos:')
disp('  - f(x_n) --> 0')
disp('  - f''(x_n) --> INFINITO')
disp('  - f(x_n)/f''(x_n) --> 0/infinito  (forma indeterminada)')
disp(' ')
disp('La derivada numerica usada por NewtonRaphsonDeriv aproxima')
disp('esta derivada que tiende a infinito, lo que causa:')
disp(' ')
disp('  1. INESTABILIDAD NUMERICA en las iteraciones')
disp('  2. CONVERGENCIA MUY LENTA (si converge)')
disp('  3. Posibles OSCILACIONES alrededor de x=2')
disp(' ')

disp('CONCLUSION:')
disp('===========')
disp('El esquema iterativo NO converge bien o converge muy lentamente')
disp('porque la derivada es infinita en la raiz.')
disp(' ')
disp('Newton-Raphson requiere que f''(r) ≠ 0 Y que f'' sea continua')
disp('cerca de la raiz para garantizar convergencia cuadratica.')
disp(' ')
disp('En este caso, f''(2) = infinito, lo que viola las condiciones')
disp('de convergencia del metodo de Newton-Raphson.')

disp(' ')
disp('========== FIN EJERCICIO 6c ==========')
