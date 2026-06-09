% Script para testear NewtonRaphson.m
% necesito: df1dx.m
% Luciano Ponzellini Marinelli (2025)

clear, clc

%% ploteo para ver las raices de la funcion
g=@(x) exp(x)-x-2;

xx=-3:0.05:3;

plot(xx,g(xx)), grid on, hold on

%% aproximo las raices por NR con derivada numerica
% raiz positiva

r1 = NewtonRaphsonDeriv(g,1,1e-6,30)

% ploteo una marca de asterisco para verificar
plot(r1,0,'k*')
% evaluo g en la raiz r2
val1 = g(r1)

% raiz negativa
r2 = NewtonRaphsonDeriv(g,-2,1e-6,30)

% ploteo una marca de asterisco para verificar
plot(r2,0,'k*')
% evaluo g en la raiz r2
val2 = g(r2)
