function radice=Newton(funzione,derivata,xiniz,delta,kmax)
% risoluzione dell'equazione f(x)=0 
% mediante metodo di Newton
% input: 
%   funzione    handle alla function che definisce f(x)
%   derivata    handle alla function che definisce f'(x)
%   xiniz       approssimazione iniziale della soluzione
%   delta       reale non negativo; il massimo errore assoluto
%               richiesto sul risultato
%   kmax        intero, massimo numero di iterazioni
% output:
%   radice      
%
xk=xiniz; k=1;
fxk=funzione(xk);
fprimoxk=derivata(xk);
correzionek=fxk/fprimoxk;
% disp([xk,abs(correzionek)])
while abs(correzionek)>delta+eps*abs(xk)&& k<=kmax
    xk=xk-correzionek;
    fxk=funzione(xk);
    fprimoxk=derivata(xk);
    correzionek=fxk/fprimoxk;
    k=k+1;
%    disp([xk,abs(correzionek)])
end
radice=xk;