% ej3 t2 diagnostico mcn lcd uca
% luciano ponzellini marinelli 25.08.25

clear, clc % limplio variables y pantalla

% discretizo el intervalo [-2.5,2.5] del eje x
x = -2.5:.1:2.5;
% discretizo igual el eje y
y = x;

% hago el mallado sobre el dominio [-2.5,2.5]x[-2.5,2.5]
[X,Y] = meshgrid(x,y);

% defino el campo escalar valorizando en el mallado
Z = sqrt(25-X.^2-Y.^2);

% ploteo en distintas figuras usando disntintos titulos
figure(1), mesh(X,Y,Z), title('comando mesh')
figure(2), surf(X,Y,Z), title('comando surf')
figure(3), contour(X,Y,Z,10), grid on, title('comando contour')
