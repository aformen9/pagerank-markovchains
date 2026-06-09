% Actividad 2 - Ejercicio 8b
% Calculo numerico de sin(pi/2 + 2*pi*10^j)
% para j = 1, 10, 20, 50, 100, 1000
% Alumno: Agustin Formenti

clear, clc

%% Valores de j que pide el enunciado
j_vals = [1, 10, 20, 50, 100, 1000];

%% Inicializo vector para guardar resultados
sen_vals = zeros(size(j_vals));

disp('Ejercicio 8b - Calculo numerico en Octave')
disp(' ')
disp('   j              angulo                      sin(pi/2 + 2*pi*10^j)')
disp('---------------------------------------------------------------------')

for k = 1:length(j_vals)
    j = j_vals(k);

    %% Calculo el angulo tal cual lo pide el enunciado
    % Atencion: para j grandes, 10^j puede overflowear a Inf.
    angulo = pi/2 + 2*pi*10^j;

    %% Calculo el seno numerico del angulo
    sen_val = sin(angulo);

    sen_vals(k) = sen_val;

    fprintf('%5d   %25.16e   %25.16e\n', j, angulo, sen_val);
end

disp(' ')
disp('Nota: en teoria todos estos valores deberian valer exactamente 1.')
disp(' ')
disp('========== FIN EJERCICIO 8b ==========')


% Actividad 2 - Ejercicio 8c
% Explicacion de los resultados obtenidos en 8b
% Alumno: Agustin Formenti

clear, clc

%% Explicacion (para leer y usar como respuesta teorica)
%
% En forma exacta:
%   sin(pi/2 + 2*pi*10^j) = 1   para todo entero positivo j,
% por la periodicidad del seno: sin(theta + 2*pi*k) = sin(theta).
%
% Sin embargo, en el software aparecen desviaciones respecto de 1,
% sobre todo cuando j es grande (20, 50, 100) y el caso j = 1000
% puede dar NaN porque 10^1000 overflowea a Inf.
%
% Motivos numericos:
% 1) Representacion finita:
%    - pi no se puede representar exactamente en punto flotante.
%    - 10^j se vuelve un numero enorme y tampoco es exacto.
%
% 2) Error al formar el angulo:
%    El angulo pi/2 + 2*pi*10^j se redondea al numero de doble precision
%    mas cercano. En teoria, 2*pi*10^j deberia ser un multiplo exacto de
%    2*pi, pero en la maquina eso no pasa: queda
%       pi/2 + 2*pi*10^j + (pequeno error).
%
%    Ese "pequeno error" se arrastra cuando la libreria de sin()
%    hace la reduccion del angulo modulo 2*pi. Como el angulo es gigante,
%    un error chico en el argumento se traduce en una diferencia grande
%    en el valor final del seno.
%
% 3) Overflow:
%    Para j = 1000, 10^1000 ya no entra en el rango de double y se
%    convierte en Inf. Entonces el angulo es Inf y sin(Inf) devuelve NaN.
%
% Conclusion:
%   - Matematicamente, el resultado es siempre 1.
%   - Numericamente, la combinacion de:
%       * representacion aproximada de pi y 10^j,
%       * operaciones con numeros muy grandes,
%       * reduccion de angulo modulo 2*pi,
%     hace que el valor calculado por la maquina se aleje de 1,
%     especialmente para j grandes. En el extremo (j = 1000) ni siquiera
%     se puede representar el angulo finito.
%
disp('Ver comentarios en el script para la explicacion teorica.')
disp(' ')
disp('========== FIN EJERCICIO 8c ==========')

