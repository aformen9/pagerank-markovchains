function y = fp_ej2b_t2(x)
y = (1 + exp(-x) + x.*exp(-x)) ./ (1 + exp(-x)).^2;
end
