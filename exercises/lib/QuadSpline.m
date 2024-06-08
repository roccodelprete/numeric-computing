function Qfs=QuadSpline(f_int,a,b,n)
x = linspace(a,b,n);
y = f_int(x);
% calcolo della spline interpolante
s = spline(x,y);
Qfs = 0;
for i=1:(n-1)
    % calcolo dell'integrale indefinito dell'i-simo polinomio della spline
    % interpolante
    polinteg = polyint(s.coefs(i,:));
    % calcolo dell'integrale definito sulla i-sima cella e aggiornamento
    % del valore dell'integrale definito sulle prime i celle
    Qfs = Qfs + polyval(polinteg,x(i+1))-polyval(polinteg,x(i));
end

    
