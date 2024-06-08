function radice=bisezione(funzione,a,b,delta)
% risoluzione dell'equazione f(x)=0 mediante bisezione
% input: 
%   funzione    handle della function che definisce f(x)
%   a,b         estremi di un intervallo tale che f(a)*f(b)<=0
%   delta       reale non negativo; il massimo errore assoluto
%               richiesto sul risultato
% output:
%   radice      il punto medio dell'intervallo [ak,bk] tale che
%                 f(ak)*f(bk)<=0
%                 |bk-ak|<=delta+eps*max(|ak|,|bk|)
%
ak=a; bk=b;
fak=funzione(ak);
fbk=funzione(bk);
while abs(bk-ak)>delta+eps*max(abs(ak),abs(bk))
    pmediok=(ak+bk)/2;
    fpmediok=funzione(pmediok);
    if fak*fpmediok <= 0
        %la radice e' nell'intervallo [ak,pmediok]
        bk=pmediok;
        fbk=fpmediok;
    else
        %la radice e' nell'intervallo [pmediok,bk]
        ak=pmediok;
        fak=fpmediok;
    end
%    disp([ak,bk,abs(ak-bk)])
end
radice=(ak+bk)/2;