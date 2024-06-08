function lkx = Lagbase(k,x, ascissa)
% calcola il valore in ascissa del k-simo polinomio di base di Lagrange
% rispetto ai nodi x
n=length(x);
indici=1:n;
indici(k)=[];
if length(ascissa) == 1
    lkx = prod((ascissa-x(indici))./(x(k)-x(indici)));
   else
    for j=1:length(ascissa)
        lkx(j) = prod((ascissa(j)-x(indici))./(x(k)-x(indici)));
    end
end
end

