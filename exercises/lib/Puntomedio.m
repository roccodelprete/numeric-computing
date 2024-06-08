function Qf=Puntomedio(f_int,a,b,n)
% la function Puntomedio implementa la
% formula del punto medio composita su n punti
% equispaziati (n-1 sottointervalli)
% per l'integrale tra a e b di f_int
h=(b-a)/(n-1);
breaks=a+h*[0:n-1]; 
puntimedi=(breaks(1:end-1)+breaks(2:end))/2; % i nodi della formula
fpmedi=feval(f_int,puntimedi);
Qf=h*sum(fpmedi);