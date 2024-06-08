function Qfs=IntSpline(f_int,a,b,n)
x = linspace(a,b,n);
y = f_int(x);
s = spline(x,y);
p = n-1;
h=(b-a)/p;
pesi = [(h^4)/4 (h^3)/3  (h^2)/2 h]';
Qfs = 0;
for i=1:p
    Qfs = Qfs + s.coefs(i,:)*pesi;
end

    
