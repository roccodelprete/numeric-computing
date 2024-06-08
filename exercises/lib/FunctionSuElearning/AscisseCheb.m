function xc = AscisseCheb(a,b,n)
% calcola n nodi di Chebychev per l'intervallo [a,b]
xc = 0.5*(a+b)+0.5*(b-a)*cos([0:n-1]*pi/(n-1));
xc = xc(end:-1:1);
end

