function xc = AscisseCheb1(a,b,n)
% calcola n nodi di Chebychev di seconda specie per l'intervallo [a,b]
xc = 0.5*(a+b)+0.5*(b-a)*cos([1:2:2*n-1]*pi/(2*n));
xc = xc(end:-1:1);
end

