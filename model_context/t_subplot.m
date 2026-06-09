% Script para plotear funciones usando subplot
% Luciano Ponzellini Marinelli (2017)

x = 0:0.1:10;
y = sin(x);
z = cos(x);
w = exp(-x*.1).*y;
v = y.*z;

subplot(2,2,1), plot(x,y)
subplot(2,2,2), plot(x,z,'r')
subplot(2,2,3), plot(x,w,'c')
subplot(2,2,4), plot(x,v,'g')
