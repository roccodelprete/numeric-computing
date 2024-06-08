function ris=fminrand1(f,a,b,delta)
% minimizzazione della funzione in f, unimodale in [a,b].
% input
% f     handle alla function che definisce la funzione da minimizzare f
% a,b   estremi dell'intervallo di unimodalita' che contine eil minimo
%delta  accuratezza assoluta richiesta
%
% l'approssimazione ha accuratezza delta
% 
if abs(b-a)<delta
    ris=(a+b)/2;
else 
    r=0.5*rand;
    c=a+(b-a)*r;
    d=a+(b-a)*(1-r);
    fc=f(c); fd=f(d)
    if fc<=fd
        b=d; 
    else
        a=c;
    end
    ris=fminrand(f,a,b,delta);
end
