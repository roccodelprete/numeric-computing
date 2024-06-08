function grafico(f,a,b)
% visualizza il grafico di f(x) in [a,b], scalando opportunamente gli assi
x=linspace(a,b,250);
y=f(x);
sab=0.1*(b-a);
fmin=min(y); fmax=max(y);sf=0.1*(fmax-fmin);
plot(x,y)
axis([a-sab b+sab fmin-sf fmax+sf])
grid

