function Qf=Rettangolare(f_int,a,b,n)
% la function Rettangolare implementa
% la formula rettangolare composita
% su n punti equispaziati (n-1 sotto-
% intervalli) per l'integrale tra
% a e b di f_int
h =(b-a)/(n-1);
breaks = a+h*[0:n-1]; % i nodi 
fbreaks = feval(f_int,breaks);
Qf = h*sum(fbreaks(1:end-1));