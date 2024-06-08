%  script ErroreIntegS_CH_MC
% calcola e visualizza gli errori assoluti delle formula di quadratura con spline, con cubica di Hermite e Monte
% Carlo al variare di n tra 10^2 e 10^7.
% Si usa come funzione integranda la function humps; intervallo di
% integrazione [0,1.5]
nrand=logspace(2, 7, 7-2+1);
Qfn=zeros(size(nrand));QfSp=zeros(size(nrand));QfCH=zeros(size(nrand));
If=quad(@humps,0,1.5);
for n=1:length(nrand)
    Qfn(n)=IntegMonteCarlo(@humps,0,1.5,nrand(n));
end
for n=1:4
    QfSp(n)=IntegSpline(@humps,0,1.5,nrand(n));
    QfCH(n)=IntegCubHerm(@humps,0,1.5,nrand(n));
end
ErroreMC=abs(Qfn-If);ErroreSp=abs(QfSp-If);ErroreCH=abs(QfCH-If);
loglog(nrand,ErroreMC,'o',nrand,ErroreMC,'r',nrand,1./sqrt(nrand),'b',nrand,1./nrand,'g',...
    nrand(1:4),ErroreSp(1:4),'s',nrand(1:4),ErroreSp(1:4),'c',...
    nrand(1:4),ErroreCH(1:4),'d',nrand(1:4),ErroreCH(1:4),'k')
xlabel (' numero di ascisse casuali utilizzate (scala logaritmica)')
ylabel (' errore assoluto (scala logaritmica)')
title (' errore assoluto della formula di quadratura MonteCarlo al variare di n (scala logaritmica)')
legend('errore Monte Carlo (punti)', 'errore Monte Carlo (andamento)','andamento 1/sqrt(n)','andamento 1/n',...
    'errore Integ Spline (punti)', 'errore Integ Spline (andamento)',...
    'errore Integ Cub Herm (punti)', 'errore Cub Herm  (andamento)')