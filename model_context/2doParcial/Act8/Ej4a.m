% Actividad 8 - Ejercicio 4 - Item (a)
% Verificar que el sistema admite las soluciones (1,1) y (-1,-1)
%
% Sistema: f1(x,y) = x^2 + y^2 - 2 = 0
%          f2(x,y) = xy - 1 = 0
%
% TEORIA: Para verificar que un punto (x*,y*) es solucion de un SENL,
% debemos comprobar que F(x*,y*) = 0, es decir, que ambas ecuaciones
% se satisfacen simultaneamente al evaluar el punto en ellas.
% Si F(x*,y*) ≈ [0; 0], entonces (x*,y*) es una raiz del sistema.
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 4 - ACTIVIDAD 8 - ITEM (a)\n')
fprintf('Verificacion de soluciones\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones no lineales:\n')
fprintf('f1(x,y) = x^2 + y^2 - 2 = 0\n')
fprintf('f2(x,y) = xy - 1 = 0\n\n')

%% Verificar solucion (1, 1)

fprintf('========================================\n')
fprintf('VERIFICANDO SOLUCION 1: (x,y) = (1, 1)\n')
fprintf('========================================\n\n')

x1 = 1;
y1 = 1;
P1 = [x1; y1];

fprintf('Evaluando el punto (%.0f, %.0f) en el sistema:\n\n', x1, y1)

% Evaluar f1
f1_val = x1^2 + y1^2 - 2;
fprintf('f1(1, 1) = (1)^2 + (1)^2 - 2\n')
fprintf('         = 1 + 1 - 2\n')
fprintf('         = %.0f\n\n', f1_val)

% Evaluar f2
f2_val = x1*y1 - 1;
fprintf('f2(1, 1) = (1)*(1) - 1\n')
fprintf('         = 1 - 1\n')
fprintf('         = %.0f\n\n', f2_val)

% Verificar con la funcion F_ej4
F1 = F_ej4(P1);
fprintf('F(1, 1) = [%.6f; %.6f]\n', F1(1), F1(2))
fprintf('||F(1, 1)||_2 = %.6f\n\n', norm(F1))

if norm(F1) < 1e-10
    fprintf('✓ CONCLUSION: (1, 1) ES una solucion del sistema.\n\n')
else
    fprintf('✗ CONCLUSION: (1, 1) NO es una solucion del sistema.\n\n')
end

%% Verificar solucion (-1, -1)

fprintf('========================================\n')
fprintf('VERIFICANDO SOLUCION 2: (x,y) = (-1, -1)\n')
fprintf('========================================\n\n')

x2 = -1;
y2 = -1;
P2 = [x2; y2];

fprintf('Evaluando el punto (%.0f, %.0f) en el sistema:\n\n', x2, y2)

% Evaluar f1
f1_val2 = x2^2 + y2^2 - 2;
fprintf('f1(-1, -1) = (-1)^2 + (-1)^2 - 2\n')
fprintf('           = 1 + 1 - 2\n')
fprintf('           = %.0f\n\n', f1_val2)

% Evaluar f2
f2_val2 = x2*y2 - 1;
fprintf('f2(-1, -1) = (-1)*(-1) - 1\n')
fprintf('           = 1 - 1\n')
fprintf('           = %.0f\n\n', f2_val2)

% Verificar con la funcion F_ej4
F2 = F_ej4(P2);
fprintf('F(-1, -1) = [%.6f; %.6f]\n', F2(1), F2(2))
fprintf('||F(-1, -1)||_2 = %.6f\n\n', norm(F2))

if norm(F2) < 1e-10
    fprintf('✓ CONCLUSION: (-1, -1) ES una solucion del sistema.\n\n')
else
    fprintf('✗ CONCLUSION: (-1, -1) NO es una solucion del sistema.\n\n')
end

%% Resumen

fprintf('========================================\n')
fprintf('RESUMEN DE VERIFICACION\n')
fprintf('========================================\n')
fprintf('Ambas soluciones propuestas satisfacen el sistema:\n')
fprintf('- (x,y) = (1, 1)   → F(1,1) = [0; 0]\n')
fprintf('- (x,y) = (-1, -1) → F(-1,-1) = [0; 0]\n\n')
fprintf('Por lo tanto, el sistema admite estas dos soluciones.\n')

%% Verifica algebraicamente que (1,1) y (-1,-1) son soluciones
%% Evalúa paso por paso cada ecuación
%% Usa la función F_ej4 para confirmar
%% Incluye teoría sobre verificación de soluciones
