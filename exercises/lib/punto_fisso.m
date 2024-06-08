function p=PFisso(funz_iter,xiniz,delta_ass,kmax)
xsucc = xiniz;
xprec = 10*delta_ass+xsucc; k = 1;
disp(xsucc)
while abs(xprec-xsucc) > delta_ass + eps(xprec) & k<=kmax
xprec = xsucc;
xsucc = funz_iter(xprec);
k = k+1;
disp([xsucc abs(xsucc-xprec)])
end
p = xsucc;
end

