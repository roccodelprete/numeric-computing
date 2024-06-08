% function Qfs=IntegMonteCarlo(f_int,a,b,n) quadratura con approccio
% MonteCarlo
% il numero di ascisse casuali utilizzate e' n.
function Qfs=IntegMonteCarlo(f_int,a,b,n)
xrand = a+(b-a)*rand(n,1);
y = f_int(xrand);
Qfs = (b-a)*mean(y);


    
