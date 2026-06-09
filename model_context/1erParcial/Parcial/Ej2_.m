% Recuperatorio - Ejercicio 2
% Alumno: Agustin Formenti

clear, clc


%% i)
R1 = 1; R2 = 1; R3 = 2; R4 = 1; R5 = 2; R6 = 4;
E1 = 23; E2 = 29;

A = [(R1+R3+R4), R3, R4;
     R3, (R2+R3+R5), -R5;
     R4, -R5, (R4+R5+R6)];

b = [E1; E2; 0];

I1 = Gauss(A, b)

%% ii)
R1 = 0.999; R2 = 1.001; R3 = 2; R4 = 1; R5 = 2; R6 = 3.999;
E1 = 23; E2 = 29;

A = [(R1+R3+R4), R3, R4;
     R3, (R2+R3+R5), -R5;
     R4, -R5, (R4+R5+R6)];

b = [E1; E2; 0];

I2 = Gauss(A, b)

%% iii)
R1 = 1; R2 = 1; R3 = 2; R4 = 1; R5 = 2; R6 = 4;
E1 = 22.999; E2 = 29.001;

A = [(R1+R3+R4), R3, R4;
     R3, (R2+R3+R5), -R5;
     R4, -R5, (R4+R5+R6)];

b = [E1; E2; 0];

I3 = Gauss(A, b)

%% b) El metodo es numericamente estable ya que
%% perturbaciones chicas en los datos generan perturbaciones
%% chicas en la solucion
