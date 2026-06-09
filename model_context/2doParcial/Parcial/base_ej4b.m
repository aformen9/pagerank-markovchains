function y = base_ej4b(x)
y(1,:) = ones(1,length(x));
y(2,:) = log(x);
y(3,:) = x.^2;
end
