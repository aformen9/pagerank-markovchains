% Ejercicio 6b-i) - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== EJERCICIO 6b-i) - Sistema 3D ===\n\n')

fprintf('Sistema:\n')
fprintf('x^2 - x + y^2 + z^2 = 5\n')
fprintf('x^2 + y^2 - y + z^2 = 4\n')
fprintf('x^2 + y^2 + z^2 + z = 6\n\n')

%% Parametros del metodo
P0 = [1.0, 1.0, 1.0];  % punto inicial
tol = 1e-9;            % tolerancia
itmax = 50;            % iteraciones maximas

fprintf('Punto inicial: (%.2f, %.2f, %.2f)\n', P0(1), P0(2), P0(3))
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Aplico Punto Fijo 3D
[Pk, iter] = PuntoFijo3D('G_ej6_i', P0, tol, itmax);

%% Resultado
fprintf('\n=== RESULTADO ===\n')
fprintf('Punto fijo encontrado: (%.8f, %.8f, %.8f)\n', Pk(1), Pk(2), Pk(3))
fprintf('Numero de iteraciones: %d\n', iter)

%% Verifico
Pk_verif = feval('G_ej6_i', Pk);

fprintf('\n=== VERIFICACION ===\n')
fprintf('x = %.8f,  g1(x,y,z) = %.8f\n', Pk(1), Pk_verif(1))
fprintf('y = %.8f,  g2(x,y,z) = %.8f\n', Pk(2), Pk_verif(2))
fprintf('z = %.8f,  g3(x,y,z) = %.8f\n', Pk(3), Pk_verif(3))
fprintf('Error en x: %.2e\n', abs(Pk(1) - Pk_verif(1)))
fprintf('Error en y: %.2e\n', abs(Pk(2) - Pk_verif(2)))
fprintf('Error en z: %.2e\n', abs(Pk(3) - Pk_verif(3)))

%% Verifico en ecuaciones originales
fprintf('\n=== VERIFICACION EN ECUACIONES ORIGINALES ===\n')
f1 = Pk(1)^2 - Pk(1) + Pk(2)^2 + Pk(3)^2;
f2 = Pk(1)^2 + Pk(2)^2 - Pk(2) + Pk(3)^2;
f3 = Pk(1)^2 + Pk(2)^2 + Pk(3)^2 + Pk(3);

fprintf('x^2 - x + y^2 + z^2 = %.8f  (debe ser 5)\n', f1)
fprintf('x^2 + y^2 - y + z^2 = %.8f  (debe ser 4)\n', f2)
fprintf('x^2 + y^2 + z^2 + z = %.8f  (debe ser 6)\n', f3)

%% El método de Punto Fijo DIVERGE para este sistema.
%% Las generatrices obtenidas del despeje natural no cumplen
%% las condiciones de convergencia. Sería necesario usar
%% Newton-Raphson u otro método para resolver este SENL.

%% 🎓 Lección importante:
%% Punto Fijo NO siempre funciona. A veces necesitás:

%% Probar diferentes formas de despejar (generatrices alternativas)
%% Probar diferentes puntos iniciales
%% Usar otro método (como Newton-Raphson que veremos después)
