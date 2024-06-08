function yy = PolIntFormLag(x,y,xx)
% calcola i valori del polinomio interpolante, scritto nella forma di
% Lagrange per i nodi x e i valori y, sulla griglia fitta xx
% usa la function Lagbase
lag=zeros(size(y));
for i=1:length(xx)
    for k=1:length(x)
       lag(k) = Lagbase(k,x,xx(i));
    end
    yy(i) = sum(lag.*y);
end

