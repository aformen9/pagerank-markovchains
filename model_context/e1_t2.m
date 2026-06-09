%ej1 tema 2 diagnostico
%luciano ponzellini marinelli 25.08.25

clear, clc % limplio variables y pantalla

%% a) ver function concatcolumn.m

%% b)
y=[1:10]';
A=rand(10,20);

%llamo a la function concatcolumn
C=concatcolumn(A,y)
s=size(C) %verifico el tamano de C
