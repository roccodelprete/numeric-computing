function Qf=Trapezoidale(f_int,a,b,n)
% la function Trapezoidale implementa la
% formula trapezoidale composita su n punti
% equispaziati (n-1 sottointervalli)
% per l'integrale tra a e b di f_int
h=(b-a)/(n-1);
breaks=a+h*[0:n-1]; % i nodi della formula
fbreaks=feval(f_int,breaks);
Qf=h*(0.5*fbreaks(1)+sum(fbreaks(2:end-1))+0.5*fbreaks(end));
