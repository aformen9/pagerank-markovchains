% Script para testear NewtonRaphson.m
% Luciano Ponzellini Marinelli (2025)

clear, clc

%% ploteo para ver las raices de la funcion
g=@(x) exp(x)-x-2;
dg=@(x) exp(x)-1; %defino la derivada de g(x)

xx=-3:0.05:3;

plot(xx,g(xx)), grid on, hold on

%% aproximo las raices por NR sin derivada numerica
% raiz positiva

r1 = NewtonRaphson(g,dg,1,1e-6,30)

% ploteo una marca de asterisco para verificar
plot(r1,0,'k*')
% evaluo g en la raiz r2
val1 = g(r1)

% raiz negativa
r2 = NewtonRaphson(g,dg,-2,1e-6,30)

% ploteo una marca de asterisco para verificar
plot(r2,0,'k*')
% evaluo g en la raiz r2
val2 = g(r2)
