% Script para graficar un campo de direcciones usando CampoDirec.m
% Autor: Luciano Ponzellini Marinelli (2016)

clc, clear

xmin =0;
xmax =5;
ymin =0;
ymax =4;

fpvi = @(t,y) (t-y)/2;

CampoDirec(xmin,xmax,ymin,ymax,fpvi)