function radice = Newton(funzione,derivata,xiniz,delta_ass,kmax)
xk = xiniz;
k = 1;
fxk = funzione(xk);
fprimoxk = derivata(xk); correzionek = -fxk/fprimoxk; disp([xk,abs(correzionek)])
while abs(correzionek) > delta_ass + eps(abs(xk)) & k <= kmax
xk = xk + correzionek;
fxk = funzione(xk);
fprimoxk = derivata(xk); correzionek = -fxk/fprimoxk; k = k+1; disp([xk,abs(correzionek)])
end
radice = xk;
end