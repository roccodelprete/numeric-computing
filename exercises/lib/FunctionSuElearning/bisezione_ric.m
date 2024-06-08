function radice=bisezione_ric(funzione,a,b,delta)
% risoluzione dell'equazione f(x)=0 mediante bisezione 
% con approccio ricorsivo.
%
% input: 
%   funzione    handle allafunction che definisce f(x)
%   a,b         estremi di un intervallo tale che f(a)*f(b)<=0
%   delta       reale non negativo; il massimo errore assoluto
%               richiesto sul risultato
% output:
%   radice      il punto medio dell'intervallo [ak,bk] tale che
%                 f(ak)*f(bk)<=0
%                 |bk-ak|<=delta+eps*max(|ak|,|bk|)
%
%    disp([a,b,abs(a-b)])
    if abs(b-a)<=delta+eps*max(abs(a),abs(b))
    % istanza banale
    radice=(a+b)/2;
else
    % autoattivazioni  
    fa=funzione(a);
    pmedio=(a+b)/2;
    fpmedio=funzione(pmedio);
    if fa*fpmedio <= 0
        %la radice e' nell'intervallo [a,pmedio]
        radice=bisezione_ric(funzione,a,pmedio,delta);
    else
        %la radice e' nell'intervallo [pmedio,b]
        radice=bisezione_ric(funzione,pmedio,b,delta);       
    end
end
   