% ej2 t1 diagnostico mcn lcd uca
% luciano ponzellini marinelli 25.08.25

clear, clc % limplio variables y pantalla

% discretizo el intervalo [0,1] del eje x
xx = 0:.01:1;

for a=1:10
    y=@(x) x.^a;
    z=@(x) x.^(1/a);
    figure(1), plot(xx,y(xx),xx,z(xx)), hold on; 
    %hold on mantiene abierta la figura
end
hold off
