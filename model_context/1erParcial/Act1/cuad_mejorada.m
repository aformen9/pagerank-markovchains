function [x1, x2] = cuad_mejorada(a, b, c)
%% function cuad_mejorada: calcula raices e informa su tipo
% Input: a, b, c - coeficientes de la ecuacion ax^2 + bx + c = 0 (a != 0)
% Output: x1, x2 - las dos raices de la ecuacion
% Ademas imprime por pantalla el tipo de raices
% Autor: Agustin Formenti

% Calculo el discriminante
discriminante = b^2 - 4*a*c;

% Analizo el discriminante para determinar el tipo de raices
if discriminante > 0
    % Raices reales distintas
    x1 = (-b + sqrt(discriminante)) / (2*a);
    x2 = (-b - sqrt(discriminante)) / (2*a);
    fprintf('Las raices son REALES y DISTINTAS:\n');
    fprintf('x1 = %.4f\n', x1);
    fprintf('x2 = %.4f\n', x2);

elseif discriminante == 0
    % Raices reales iguales (una raiz doble)
    x1 = -b / (2*a);
    x2 = x1;
    fprintf('Las raices son REALES e IGUALES (raiz doble):\n');
    fprintf('x1 = x2 = %.4f\n', x1);

else
    % Raices complejas conjugadas
    parte_real = -b / (2*a);
    parte_imaginaria = sqrt(-discriminante) / (2*a);
    x1 = parte_real + 1i * parte_imaginaria;
    x2 = parte_real - 1i * parte_imaginaria;
    fprintf('Las raices son COMPLEJAS CONJUGADAS:\n');
    fprintf('x1 = %.4f + %.4fi\n', parte_real, parte_imaginaria);
    fprintf('x2 = %.4f - %.4fi\n', parte_real, parte_imaginaria);
end

end
