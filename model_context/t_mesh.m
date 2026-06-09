% Script para plotear un campo escalar usando mesh
% Luciano Ponzellini Marinelli (2017)

clear, clc, close

x = -2:0.05:2;
y = -1:0.1:1;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
mesh(X,Y,Z)
