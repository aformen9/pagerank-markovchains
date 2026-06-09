function val = q4(x0)
%% q4 - Evalua q(x) = ((x-3)x + 3)x - 1 con 4 cifras significativas

x  = fl4(x0);

t1 = fl4(x - 3);
t2 = fl4(t1 * x);
t3 = fl4(t2 + 3);
t4 = fl4(t3 * x);

val = fl4(t4 - 1);

end

