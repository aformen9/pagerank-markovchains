% Actividad 2 - Ejercicio 2
% Evaluacion polinomial con 4 cifras significativas usando scripts separados
% Alumno: Agustin Formenti

clear; clc;

% --------------------------------------------------------------
% Llamo a las funciones equivalentes p(x), q(x), r(x)
% Cada operacion dentro de esas funciones pasa por fl4
% --------------------------------------------------------------

%% (a) x = 2.72
x1 = 2.72;

p1 = p4(x1);
q1 = q4(x1);
r1 = r4(x1);

fprintf('x = %.3f\n', x1);
fprintf('  p(%.3f) = %.4g\n', x1, p1);
fprintf('  q(%.3f) = %.4g\n', x1, q1);
fprintf('  r(%.3f) = %.4g\n\n', x1, r1);

%% (b) x = 0.975
x2 = 0.975;

p2 = p4(x2);
q2 = q4(x2);
r2 = r4(x2);

fprintf('x = %.3f\n', x2);
fprintf('  p(%.3f) = %.4g\n', x2, p2);
fprintf('  q(%.3f) = %.4g\n', x2, q2);
fprintf('  r(%.3f) = %.4g\n', x2, r2);

disp(' ')
disp('========== FIN EJERCICIO 2 ==========')

