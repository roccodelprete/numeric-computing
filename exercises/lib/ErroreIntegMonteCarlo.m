%  script ErroreIntegMonteCarlo
% calcola e visualizza l'errore assoluto della formula di quadratura Monte
% Carlo al variare di n tra 10^2 e 10^7.
% Si usa come funzione integranda la function humps; intervallo di
% integrazione [0,1.5]
nrand=logspace(2, 7, 7-2+1);
Qfn=zeros(size(nrand));
If=quad(@humps,0,1.5);
for n=1:length(nrand)
    Qfn(n)=IntegMonteCarlo(@humps,0,1.5,nrand(n));
end
Errore=abs(Qfn-If);
loglog(nrand,Errore,'o',nrand,Errore,'r',nrand,1./sqrt(nrand),'b',nrand,1./nrand,'g')
xlabel (' numero di ascisse casuali utilizzate (scala logaritmica)')
ylabel (' errore assoluto (scala logaritmica)')
title (' errore assoluto della formula di quadratura MonteCarlo al variare di n (scala logaritmica)')
legend('errore Monte Carlo (punti)', 'errore Monte Carlo (andamento)','andamento 1/sqrt(n)','andamento 1/n')