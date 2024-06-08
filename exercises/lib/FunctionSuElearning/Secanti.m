function radice = Secanti(funzione,xiniz,xiniz1,delta_ass,kmax)
% risoluzione dell'equazione f(x)=0 
% mediante metodo delle Secanti
% input: 
%  funzione   puntatore (handle) alla 
%             function che definisce f(x)
%  xiniz      prima approssimazione iniziale
% 		      della soluzione
%  xiniz1     seconda approssimazione iniziale
%             della soluzione
% delta_ass   reale non negativo; il massimo
%             errore assoluto richiesto 
%             sul risultato
%   kmax      intero, massimo numero di 
%             iterazioni
% output:
%  radice     approssimazione della radice  
%
xk = xiniz; xk1 = xiniz1; 
k = 1;
fxk = funzione(xk); fxk1 = funzione(xk1);
pxk = (fxk-fxk1)/(xk-xk1);
correzionek = -fxk/pxk;
% disp([xk,abs(correzionek)])
while abs(correzionek)>delta_ass+eps*abs(xk)&k<=kmax	
    xk1 = xk; fxk1 = fxk;
    xk = xk + correzionek;
    fxk = funzione(xk);
    pxk = (fxk-fxk1)/(xk-xk1);
    correzionek = -fxk/pxk;
    k = k+1;
%    disp([xk,abs(correzionek)])
end
radice = xk;
