function val = r4(x0)
%% r4 - Evalua r(x) = (x - 1)^3 con 4 cifras significativas

x  = fl4(x0);

t1 = fl4(x - 1);
t2 = fl4(t1 * t1);
t3 = fl4(t2 * t1);

val = fl4(t3);

end

