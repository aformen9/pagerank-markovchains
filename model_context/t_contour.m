% Script para plotear curvas de nivel usando contour
% Luciano Ponzellini Marinelli (2017)

x = -3:0.1:3;
y = x;
[X,Y] = meshgrid(x,y);
Z1 = X.^2-2*X-Y+0.5;
Z2 = X.^2+4*Y.^2-4;
contour(X,Y,Z1,[0,0],'b'), hold on,
contour(X,Y,Z2,[0,0],'r'), grid on,
