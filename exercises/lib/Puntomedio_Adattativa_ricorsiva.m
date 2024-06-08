function Qf=Puntomedio_Adattativa_ricorsiva(f_int,a,b,Qfk,acc_rich)
% La function viene richiamata da quella precedente per calcolare l’integrale negli   % intervalli [a,mk]e [mk,b] applicando la formula del punto medio.
% INPUT:
% f_int                     funzione di cui calcolare l'integrale;
% a,b,                    estremi dell'integrale;
% acc_rich                  accuratezza richiesta;
% Qfk                       integrale nell'intervallo.
% OUTPUT:
% Qf                        integrale della funzione;
% Errore                   errore dell'approssimazione;
% n_val                    numero di valutazioni.
hk2=abs(b-a)/2;    %ampiezza dei 2 sottointervalli
mk1=a+hk2/2;              
mk2=mk1+hk2;       %punti medi dei due sottointervalli
f_int_mk1=f_int(mk1);
f_int_mk2=f_int(mk2); %valutare la funzione nei punti medi dei due sottointervalli
Qfk1=hk2*f_int_mk1;             
Qfk2=hk2*f_int_mk2;   %punto medio base nei due sottointervalli
Qf2k=Qfk1+Qfk2;       %punto medio composita (somma degli integrali dei due sottointervalli)             
n_val=1;
Ek=abs(Qf2k-Qfk)/3;
Errore=Ek;
%calcolo dell'errore 
if  Ek <=acc_rich     % l'integrale sull'intervallo e' accetatto
    Qf=Qf2k;
    [Qf,Errore,n_val]
else
    %autoattivazione per calcolare l'integrale nei due sottintervalli    
    Qf=Puntomedio_Adattativa_ricorsiva(f_int,a,a+hk2,Qfk1,acc_rich/2)+...
                      Puntomedio_Adattativa_ricorsiva(f_int,a+hk2,b,Qfk2,acc_rich/2)
end
