% Ejercicio 5d - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== EJERCICIO 5d - Analisis del fenomeno ===\n\n')

%% Generatrices:
% g1(x,y) = y² - 0.3
% g2(x,y) = x² - 0.2

%% Calculo las derivadas parciales
% dg1/dx = 0
% dg1/dy = 2y
% dg2/dx = 2x
% dg2/dy = 0

fprintf('Derivadas parciales:\n')
fprintf('dg1/dx = 0\n')
fprintf('dg1/dy = 2y\n')
fprintf('dg2/dx = 2x\n')
fprintf('dg2/dy = 0\n\n')

dg1_dx = @(x,y) 0;
dg1_dy = @(x,y) 2*y;
dg2_dx = @(x,y) 2*x;
dg2_dy = @(x,y) 0;

%% Analizo en el punto inicial 1: (1.2, 1.2)
p1 = 1.2;
q1 = 1.2;

fprintf('--- PUNTO INICIAL 1: (%.2f, %.2f) ---\n', p1, q1)

dg1dx_1 = dg1_dx(p1, q1);
dg1dy_1 = dg1_dy(p1, q1);
dg2dx_1 = dg2_dx(p1, q1);
dg2dy_1 = dg2_dy(p1, q1);

fprintf('Evaluacion:\n')
fprintf('dg1/dx(%.2f, %.2f) = %.4f\n', p1, q1, dg1dx_1)
fprintf('dg1/dy(%.2f, %.2f) = 2*(%.2f) = %.4f\n', p1, q1, q1, dg1dy_1)
fprintf('dg2/dx(%.2f, %.2f) = 2*(%.2f) = %.4f\n', p1, q1, p1, dg2dx_1)
fprintf('dg2/dy(%.2f, %.2f) = %.4f\n\n', p1, q1, dg2dy_1)

cond1_1 = abs(dg1dx_1) + abs(dg1dy_1);
cond2_1 = abs(dg2dx_1) + abs(dg2dy_1);

fprintf('Condiciones de convergencia:\n')
fprintf('|dg1/dx| + |dg1/dy| = %.4f + %.4f = %.4f', abs(dg1dx_1), abs(dg1dy_1), cond1_1)
if cond1_1 < 1
    fprintf(' < 1  --> SE CUMPLE\n')
else
    fprintf(' >= 1  --> NO SE CUMPLE\n')
end

fprintf('|dg2/dx| + |dg2/dy| = %.4f + %.4f = %.4f', abs(dg2dx_1), abs(dg2dy_1), cond2_1)
if cond2_1 < 1
    fprintf(' < 1  --> SE CUMPLE\n\n')
else
    fprintf(' >= 1  --> NO SE CUMPLE\n\n')
end

%% Analizo en el punto inicial 2: (-0.2, -0.2)
p2 = -0.2;
q2 = -0.2;

fprintf('--- PUNTO INICIAL 2: (%.2f, %.2f) ---\n', p2, q2)

dg1dx_2 = dg1_dx(p2, q2);
dg1dy_2 = dg1_dy(p2, q2);
dg2dx_2 = dg2_dx(p2, q2);
dg2dy_2 = dg2_dy(p2, q2);

fprintf('Evaluacion:\n')
fprintf('dg1/dx(%.2f, %.2f) = %.4f\n', p2, q2, dg1dx_2)
fprintf('dg1/dy(%.2f, %.2f) = 2*(%.2f) = %.4f\n', p2, q2, q2, dg1dy_2)
fprintf('dg2/dx(%.2f, %.2f) = 2*(%.2f) = %.4f\n', p2, q2, p2, dg2dx_2)
fprintf('dg2/dy(%.2f, %.2f) = %.4f\n\n', p2, q2, dg2dy_2)

cond1_2 = abs(dg1dx_2) + abs(dg1dy_2);
cond2_2 = abs(dg2dx_2) + abs(dg2dy_2);

fprintf('Condiciones de convergencia:\n')
fprintf('|dg1/dx| + |dg1/dy| = %.4f + %.4f = %.4f', abs(dg1dx_2), abs(dg1dy_2), cond1_2)
if cond1_2 < 1
    fprintf(' < 1  --> SE CUMPLE\n')
else
    fprintf(' >= 1  --> NO SE CUMPLE\n')
end

fprintf('|dg2/dx| + |dg2/dy| = %.4f + %.4f = %.4f', abs(dg2dx_2), abs(dg2dy_2), cond2_2)
if cond2_2 < 1
    fprintf(' < 1  --> SE CUMPLE\n\n')
else
    fprintf(' >= 1  --> NO SE CUMPLE\n\n')
end

%% Conclusion
fprintf('=== CONCLUSION ===\n\n')
fprintf('FENOMENO OBSERVADO:\n')
fprintf('Las condiciones de convergencia DEPENDEN del punto inicial.\n\n')

fprintf('Desde (1.2, 1.2):\n')
fprintf('  - Condiciones: %.4f y %.4f (ambas >= 1)\n', cond1_1, cond2_1)
fprintf('  - NO se garantiza convergencia teoricamente\n\n')

fprintf('Desde (-0.2, -0.2):\n')
fprintf('  - Condiciones: %.4f y %.4f\n', cond1_2, cond2_2)
if cond1_2 < 1 && cond2_2 < 1
    fprintf('  - SI se garantiza convergencia\n\n')
else
    fprintf('  - NO se garantiza convergencia\n\n')
end

fprintf('IMPORTANTE: Aunque no se garantice convergencia teoricamente,\n')
fprintf('el metodo PUEDE converger igual. Las condiciones son SUFICIENTES\n')
fprintf('pero NO NECESARIAS.\n')
