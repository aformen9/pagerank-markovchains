function CampoDirec(xmin,xmax,ymin,ymax,fpvi)
% Función para graficar un campo de direcciones
% ENTRADA
% xmin  : valor mínimo del eje de abscisas
% xmax : valor máximo del eje de abscisas
% ymin  : valor mínimo del eje de ordenadas
% ymax : valor máximo del eje de ordenadas
% fpvi    : función que define mi PVI y' = f(t,y)
%
% Autor: Luciano Ponzellini Marinelli (2016)

[T,Y] = meshgrid(xmin:xmax,ymax:-1:ymin);
dT = ones(xmax-xmin+1,ymax-ymin+1)';
dY = fpvi(T,Y);

figure, quiver(T,Y,dT,dY), hold on, grid on
legend('campo de direcciones')

%end (Matlab)
%endfunction (Octave)
