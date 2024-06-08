function [Qf,Errore,ind_errore,n_val_f]=.... 
 Trapezoidale_Adattativa(f_int,a,b,acc_rich,nmax)
% calcolo l'approssimazione dell'integrale
% definito di f_int sull'intervallo [a,b]
% input
%   f_int  handle della function per la funzione
%          integranda
%   a,b    estremi dell'intervallo di integrazione
% acc_rich accuratezza richiesta sul valore della
%          approssimazione calcolata dell'integrale
%  nmax    massimo numero di valutazioni consentite
%          della funzione integranda
%
% output
%   Qf     approssimazione dell'integrale
% Errore   stima dell'errore di approssimazione
% ind_errore indicatore di errore: 
%          =0 se tutto OK
%          <0 altrimenti
% n_val_f  numero di valutazioni effettuate
%
Qf=0; Errore=0;ind_errore=0;
f_int_a= f_int(a);
f_int_b=  f_int(b);
n_val_f=2;
pila=pila_crea(0);
elem=struct('estr_sin',a,'estr_des',b,...
    'f_estr_sin',f_int_a,'f_estr_des',f_int_b,'val_appr_integ',(b-a)*(f_int_a+f_int_b)/2);
pila=pila_push(pila,elem);
while ~pila_vuota(pila) & n_val_f<nmax
    [pila,elem]=pila_pop(pila);
    ak=elem.estr_sin; bk=elem.estr_des;
    mk=(ak+bk)/2;
    hk2=abs(bk-ak)/2;
    f_int_mk=  f_int(mk);
    n_val_f=n_val_f+1;
    f_int_ak=elem.f_estr_sin;
    f_int_bk=elem.f_estr_des;
    Qfk1=hk2*(f_int_ak+f_int_mk)/2; 
    Qfk2=hk2*(f_int_mk+f_int_bk)/2;
    Qf2k=Qfk1+Qfk2;
    Ek=abs(Qf2k-elem.val_appr_integ)/3;
    if Ek<=abs(bk-ak)*acc_rich/(b-a);
        Qf=Qf+Qf2k;
        Errore=Errore+Ek;
    else
        elem1=struct('estr_sin',ak,'estr_des',mk,...
        'f_estr_sin',f_int_ak,'f_estr_des',f_int_mk,'val_appr_integ',Qfk1);
        elem2=struct('estr_sin',mk,'estr_des',bk,...
        'f_estr_sin',f_int_mk,'f_estr_des',f_int_bk,'val_appr_integ',Qfk2);
        pila=pila_push(pila,elem1);
        pila=pila_push(pila,elem2);
    end
end
if n_val_f >= nmax
    ind_errore=-1;
end