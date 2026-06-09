% Materia: Metodos y computos numerios
% Fecha: 25/08/2025
% Manejo del lenguaje, graficas y funciones - Tema 1
% Autor: Agustin Formenti

# Ejercicio 2 -> Ploteo de funciones reales de variable real

#x = 0:0.1:1; -----> asi printea pocas lineas, lo ideal seria asi:
x = linspace(0,1,1000); # mas smooth
y = x;
a = [1./(10:-1:2), 1:10];

figure; hold on; grid on;
for k = 1:length(a)
    y = x.^a(k);
    plot(x,y,'LineWidth',1.2);
end
axis([0 1 0 1])
xlabel('x'); ylabel('y');
title('Curvas y = x^\alpha');
