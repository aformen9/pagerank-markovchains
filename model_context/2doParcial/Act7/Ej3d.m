% Ejercicio 3d - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

%% Punto inicial
p0 = 1.1;
q0 = 2.0;

fprintf('=== ANALISIS DE CONVERGENCIA - EJERCICIO 3d ===\n\n')
fprintf('Punto inicial: (%.2f, %.2f)\n\n', p0, q0)

%% Defino las derivadas parciales como funciones
% Para g1(x,y) = (8x - 4x² + y² + 1)/8
% dg1/dx = (8 - 8x)/8 = 1 - x
% dg1/dy = 2y/8 = y/4

% Para g2(x,y) = (2x - x² + 4y - y² + 3)/4
% dg2/dx = (2 - 2x)/4 = (1 - x)/2
% dg2/dy = (4 - 2y)/4 = 1 - y/2

dg1_dx = @(x,y) 1 - x;
dg1_dy = @(x,y) y/4;
dg2_dx = @(x,y) (1 - x)/2;
dg2_dy = @(x,y) 1 - y/2;

fprintf('Derivadas parciales (simbolicas):\n')
fprintf('dg1/dx = 1 - x\n')
fprintf('dg1/dy = y/4\n')
fprintf('dg2/dx = (1 - x)/2\n')
fprintf('dg2/dy = 1 - y/2\n\n')

%% Evaluo en el punto inicial
dg1dx_val = dg1_dx(p0, q0);
dg1dy_val = dg1_dy(p0, q0);
dg2dx_val = dg2_dx(p0, q0);
dg2dy_val = dg2_dy(p0, q0);

fprintf('Evaluacion en (%.2f, %.2f):\n', p0, q0)
fprintf('dg1/dx(%.2f, %.2f) = 1 - %.2f = %.4f\n', p0, q0, p0, dg1dx_val)
fprintf('dg1/dy(%.2f, %.2f) = %.2f/4 = %.4f\n', p0, q0, q0, dg1dy_val)
fprintf('dg2/dx(%.2f, %.2f) = (1 - %.2f)/2 = %.4f\n', p0, q0, p0, dg2dx_val)
fprintf('dg2/dy(%.2f, %.2f) = 1 - %.2f/2 = %.4f\n\n', p0, q0, q0, dg2dy_val)

%% Calculo las condiciones de convergencia
abs_dg1dx = abs(dg1dx_val);
abs_dg1dy = abs(dg1dy_val);
abs_dg2dx = abs(dg2dx_val);
abs_dg2dy = abs(dg2dy_val);

cond1 = abs_dg1dx + abs_dg1dy;
cond2 = abs_dg2dx + abs_dg2dy;

fprintf('--- CONDICIONES DE CONVERGENCIA ---\n\n')
fprintf('Condicion 1:\n')
fprintf('|dg1/dx| + |dg1/dy| = |%.4f| + |%.4f|\n', dg1dx_val, dg1dy_val)
fprintf('                    = %.4f + %.4f\n', abs_dg1dx, abs_dg1dy)
fprintf('                    = %.4f', cond1)

if cond1 < 1
    fprintf(' < 1  --> SE CUMPLE\n\n')
else
    fprintf(' >= 1  --> NO SE CUMPLE\n\n')
end

fprintf('Condicion 2:\n')
fprintf('|dg2/dx| + |dg2/dy| = |%.4f| + |%.4f|\n', dg2dx_val, dg2dy_val)
fprintf('                    = %.4f + %.4f\n', abs_dg2dx, abs_dg2dy)
fprintf('                    = %.4f', cond2)

if cond2 < 1
    fprintf(' < 1  --> SE CUMPLE\n\n')
else
    fprintf(' >= 1  --> NO SE CUMPLE\n\n')
end

%% Conclusion
fprintf('=== CONCLUSION ===\n')
if cond1 < 1 && cond2 < 1
    fprintf('Ambas condiciones SE CUMPLEN.\n')
    fprintf('El metodo de Punto Fijo DEBERIA CONVERGER\n')
    fprintf('desde el punto inicial (%.2f, %.2f).\n', p0, q0)
else
    fprintf('Al menos una condicion NO SE CUMPLE.\n')
    fprintf('El metodo de Punto Fijo PODRIA NO CONVERGER\n')
    fprintf('desde el punto inicial (%.2f, %.2f).\n', p0, q0)
end
