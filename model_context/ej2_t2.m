% ej2 t2 diagnostico mcn lcd uca
% luciano ponzellini marinelli 25.08.25

clear, clc % limplio variables y pantalla

% discretizo el intervalo [-2,2] del eje x
xx = -2:.001:2;

for b=1:3
    y=@(x) sin(exp(b*x));
    z=@(x) sin(exp((1/b).*x));
    figure(1), plot(xx,y(xx),xx,z(xx)), hold on;
end
hold off;


