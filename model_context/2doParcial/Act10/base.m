function y = base(x)
y(1,:) = ones(1,length(x));
y(2,:) = x;
y(3,:) = sin(x);
y(4,:) = x.*exp(x);
end
