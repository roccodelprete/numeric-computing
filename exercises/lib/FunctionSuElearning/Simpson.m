function Qf=Simpson(f_int,a,b,n)
% la function Simpson implementa la
% formula di Simpson composita su n punti
% equispaziati.
%%%%% n deve essere dispari %%%%%%%%
% per l'integrale tra a e b di f_int
hbarrato=(b-a)/(n-1);
tutti_i_nodi=a+hbarrato*[0:n-1]; % i nodi della formula
puntimedi=tutti_i_nodi(2:2:end-1);
estremi_sottoint=tutti_i_nodi(3:2:end-1);
fpmedi=feval(f_int,puntimedi);
festremi_sott=feval(f_int,estremi_sottoint);
fa=feval(f_int,a);
fb=feval(f_int,b);
Qf=(hbarrato/3)*(fa+4*sum(fpmedi)+2*sum(festremi_sott)+fb);