function minimo=MinimNewtonDF(funzione,xiniz,xiniz1,delta_ass,kmax)
% calcolo del minimo di una funzione f(x) 
% mediante metodo di minimizzazione di  Newton con Differenze Finite
% input: 
%   funzione    puntatore (handle) alla function che definisce f(x)
%   xiniz, xiniz1  approssimazioni iniziali della soluzione
%   delta_ass   reale non negativo; il massimo errore assoluto 
%               richiesto sul risultato
%   kmax        intero, massimo numero di iterazioni
% output:
%   radice      
%
xk=xiniz; xk2=xiniz1; xk1=(xk+xk2)/2; k=1; hk=xk-xk1; hk1=xk1-xk2;
fxk = funzione(xk); fxk1 = funzione(xk1);fxk2 = funzione(xk2);
pk=(fxk-fxk1)/hk;
pk1=(fxk1-fxk2)/hk1;
p2k=(pk-pk1)/hk;
correzionek=pk/p2k
disp([xk,correzionek])
while abs(correzionek)>delta_ass+eps*abs(xk) && k<=kmax
    xk2=xk1; xk1=xk; fxk2=fxk1; fxk1=fxk; pk1=pk; hk1=hk;
    xk=xk-correzionek
    hk=xk-xk1;
    fxk = funzione(xk);
    pk=(fxk-fxk1)/hk;
    p2k=(pk-pk1)/hk;
    correzionek=pk/p2k
    k=k+1;
    disp([xk,xk1,xk2,correzionek])
end
minimo=xk;
