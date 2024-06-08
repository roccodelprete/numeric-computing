function [Qf,Errore,n_val]=Puntomedio_Adattativa_ric(f_int,a,b,acc_rich)
%Algoritmo di quadratura adattativa che utilizza come formula base la
%formula del punto medio. 
%La function calcola l段ntegrale nel primo intervallo; se l段ntervallo non viene %accettato, si richiama la function Puntomedio_Adattativa_ricorsiva che %ricorsivamente calcola l段ntegrale dividendo l段ntervallo dato in due sott段ntervalli.
% INPUT:
% f_int          handle della funzione di cui calcolare l'integrale;
% a,b            estremi dell'integrale;
% acc_rich       accuratezza richiesta;  
% n_val_f              numero di valutazioni effettuate.
% OUTPUT:
% Qf             integrale della funzione;
% Errore         errore dell'approssimazione;
% n_val         numnero di valutazioni.

mk=(a+b)/2;
f_int_mk=f_int(mk); % valuta la funzione nel punto medio dell'intervallo 
n_val_f=1; % numero di valutazioni effettuate
Qfk=(b-a)*f_int_mk; 
% formula base del punto medio
[Qf,Errore,n_val]=Puntomedio_Adattativa_ricorsiva(f_int,a,b,Qfk,acc_rich)
% richiamo alla functione Puntomedio_ricorsiva per effettuare il calcolo
% dell'integrale nei due sott'intervalli


function [Qf,Errore,n_val]=Puntomedio_Adattativa_ricorsiva(f_int,a,b,Qfk,acc_rich)
% La function viene richiamata da quella precedente per calcolare l段ntegrale negli   % intervalli [a,mk]e [mk,b] applicando la formula del punto medio.
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
   % [Qf,Errore,n_val]=Puntomedio_Adattativa_ricorsiva(f_int,a,a+hk2,Qfk1,acc_rich/2)+Puntomedio_Adattativa_ricorsiva(f_int,a+hk2,b,Qfk2,acc_rich/2)
   [Qf1,Errore1,n_val1]=Puntomedio_Adattativa_ricorsiva(f_int,a,a+hk2,Qfk1,acc_rich/2);
   [Qf2,Errore2,n_val2]=Puntomedio_Adattativa_ricorsiva(f_int,a+hk2,b,Qfk2,acc_rich/2);
   Qf = Qf1 + Qf2;
   Errore = Errore1 + Errore2;
   n_val = n_val1 + n_val2;
end 
