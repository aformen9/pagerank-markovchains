% Script: ZoomPoli
% Plotea (x-1)^6 alrededor de x=1 con escala creciente
% pero evaluado via x^6 - 6x^5 + 15x^4 - 20x^3 + 15x^2 - 6x +1
%
% 05.04.2015 (Sergio Preidikman)
% 30.03.2022 (Luciano Ponzellini Marinelli)

clear, clc, close all

k=0;
n=100;
for delta = [.1 .01 .008 .007 .005  .003 ]
   x = linspace(1-delta,1+delta,n)';
   y = x.^6 - 6*x.^5 + 15*x.^4 - 20*x.^3 + 15*x.^2 - 6*x + 1;
   y1 = (x-1).^6;
   k = k+1;
   subplot(2,3,k), plot(x,y,x,y1,x',zeros(1,n)), grid on
   axis([1-delta   1+delta   -max(abs(y))   max(abs(y))])
end
