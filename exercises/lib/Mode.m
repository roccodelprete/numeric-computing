function y = Mode(dati)
% mode finds the mode of a sample 
 [b,i,j] = unique(dati);
 [m,k] = max(hist(j,length(b)));
 y = b(k);


