function val = p4(x0)
%% p4 - Evalua p(x) = x^3 - 3x^2 + 3x - 1 con 4 cifras significativas
% Todas las operaciones pasan por fl4

x  = fl4(x0);
x2 = fl4(x * x);
x3 = fl4(x * x2);

t1 = x3;
t2 = fl4(3 * x2);
t3 = fl4(3 * x);

s1 = fl4(t1 - t2);
s2 = fl4(s1 + t3);

val = fl4(s2 - 1);

end

