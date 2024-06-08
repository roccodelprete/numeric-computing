function ris=fmingolden(f,a,b,delta)
% calcola il minimo (argmin) della funzione f unimodale in [a,b]
% con il metodo della ricerca golden (golden search).
%input
% f     handle alla function che definisce la funzione da minimizzare f
% a,b   estremi dell'intervallo di unimodalita' che contine eil minimo
%delta  accuratezza assoluta richiesta
%
% l'approssimazione ha accuratezza delta
%  
if abs(b-a)<delta
    ris=(a+b)/2;
else 
    phi = 1.61803398874989;
    duemphi = 2 - phi;
    phim1 = phi - 1;
    c=a+(b-a)*duemphi;
    d=a+(b-a)*phim1;
    fc=f(c); fd=f(d);
    if fc<=fd
        b=d; 
    else
        a=c;
    end
    ris=fmingolden(f,a,b,delta);
end