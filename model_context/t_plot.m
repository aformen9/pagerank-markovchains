% Script para plotear dos funciones en una misma figura
% Luciano Ponzellini Marinelli (2017)

clear, clc, close

x = -2*pi:pi/100:2*pi;
y = sin(x);
z = cos(x);
plot(x,y,'c',x,z,'m'), grid on
legend('sen(x)','cos(x)')