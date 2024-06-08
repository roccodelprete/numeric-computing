function ris=fminfibo(f,a,b,delta)
% calcola il minimo (argmin) della funzione f unimodale in [a,b]
% con il metodo della ricerca di Fibonacci.
%input
% f     handle alla function che definisce la funzione da minimizzare f
% a,b   estremi dell'intervallo di unimodalita' che contine eil minimo
%delta  accuratezza assoluta richiesta
%
% l'approssimazione ha accuratezza delta
h=b-a;
n=fix(((log(h)-log(delta))/log(1.61803398874989)));
den=fibonacci(n);
c=(fibonacci(n-2)/den)*h+a;
d=(fibonacci(n-1)/den)*h+a;
ak=a;bk=b;hk=h;
% [n ak bk]
fc=f(c); fd=f(d);
for k=n-1:-1:2
    den=fibonacci(k);
    if fc<fd
        bk=d; d=c; fd=fc; 
%        [k ak bk]
        hk=bk-ak; c=(fibonacci(k-2)/den)*hk+ak; fc=f(c);
    else
        ak=c; c=d; fc=fd; 
%        [k ak bk]
        hk=bk-ak; d=(fibonacci(k-1)/den)*hk+ak; fd=f(d);
    end

end
ris=(ak+bk)/2;

   