function minimo=Steepest1D(derivata,xiniz,delta_ass,kmax)
% calcolo del minimo di una funzione f(x) 
% mediante il metodo dello steepest descent elementare
% input: 
%   funzione    puntatore (handle) alla function che definisce f(x)
%   derivata    puntatore (handle) alla function che definisce f'(x)
%   xiniz,      approssimazione iniziale della soluzione
%   delta_ass   reale non negativo; il massimo errore assoluto 
%               richiesto sul risultato
%   kmax        intero, massimo numero di iterazioni
% output:
%   radice      
%
alfa=0.1;k=1;
xk=xiniz; 
dxk = derivata(xk);
correzionek=-alfa*dxk;
disp([xk,correzionek])
while abs(correzionek)>delta_ass+eps*abs(xk) && k<=kmax
    xk=xk+correzionek;
    dxk = derivata(xk);
    correzionek=-alfa*dxk;
    k=k+1;
    disp([xk,correzionek])
end
minimo=xk;

