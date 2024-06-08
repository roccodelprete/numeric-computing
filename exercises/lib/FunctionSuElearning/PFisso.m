function p=PFisso(funz_iter,xiniz,delta,kmax)
% risoluzione dell'equazione x=g(x) 
% mediante metodo di Punto Fisso
% input: 
%   funz_iter   handle alla function che
%               che definisce g(x) (la funzione di iterazione)
%   xiniz       approssimazione iniziale della soluzione
%   delta       reale non negativo; il massimo errore assoluto
%               richiesto sul risultato
%   kmax        intero, massimo numero di iterazioni
% output:
%   p           il punto fisso, ovvero la soluzione di x=g(x)      
%
xsucc=xiniz; xprec=10*delta-xsucc; k=1;
% disp(xsucc)
while abs(xprec-xsucc)>delta+eps && k<=kmax
    xprec=xsucc;
    xsucc=funz_iter(xprec);
    k=k+1;
%    disp([xsucc  abs(xsucc-xprec)])
end
p=xsucc;