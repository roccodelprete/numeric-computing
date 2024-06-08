% script ErroreFormuleQ
% determina sprimentalmente l'errore delle
% formule di quadratura Rett, Pmedio,Trap, Simpson
% al variare di n 
% integrale tra 1 e 2 di 1/x
%
a=1; b=2; esatto=log(2); nprove=6;
QRett=zeros(nprove,1); Qpmedio=zeros(nprove,1);
QTrap=zeros(nprove,1); QSimps=zeros(nprove,1);
k=1;n=2.^[1:6]+1;
for nn=n
   QRett(k,1)=Rettangolare('GGunosux',a,b,nn);
   Qpmedio(k,1)=Puntomedio('GGunosux',a,b,nn);
   QTrap(k,1)=Trapezoidale('GGunosux',a,b,nn);  
   QSimps(k,1)=Simpson('GGunosux',a,b,nn);
   k=k+1;
end
EQRett=abs(QRett-esatto);EQpmedio=abs(Qpmedio-esatto);
EQTrap=abs(QTrap-esatto);EQSimps=abs(QSimps-esatto);
disp('  APPROSSIMAZIONI DELL''INTEGRALE')
disp(' n     Rett      PMedio      Trap      Simpson')
disp(sprintf('%2d %10.7f %10.7f %10.7f %10.7f\n',[n' QRett Qpmedio QTrap QSimps]'))
disp('  ERRORE DI APPROSSIMAZIONE')
disp(' n     Rett      PMedio      Trap      Simpson')
disp(sprintf('%2d %10.7f %10.7f %10.7f %10.7f\n',[n' EQRett ... 
        EQpmedio EQTrap EQSimps]'))
disp('  RAPPORTO ERRORE(n)/ERRORE(2n-1)')
disp(' n     Rett      PMedio      Trap      Simpson')
disp(sprintf('%2d %10.7f %10.7f %10.7f %10.7f\n',...
  [n(1:end-1)', ...
  EQRett(1:end-1)./EQRett(2:end),... 
  EQpmedio(1:end-1)./EQpmedio(2:end),... 
  EQTrap(1:end-1)./EQTrap(2:end),...
  EQSimps(1:end-1)./EQSimps(2:end)]'))
disp(' n     Rett      PMedio      Trap      Simpson')
disp(sprintf('%2d %5d %10d %10d %10d\n',...
  [n(1:end-1)', ...
  round(EQRett(1:end-1)./EQRett(2:end)),... 
  round(EQpmedio(1:end-1)./EQpmedio(2:end)),... 
  round(EQTrap(1:end-1)./EQTrap(2:end)),...
  round(EQSimps(1:end-1)./EQSimps(2:end))]'))
figure(1)
semilogy(n,EQRett,'b.-',n,EQpmedio,'r.-',... 
    n,EQTrap,'g.-',n,EQSimps,'k.-')
legend('Rettangolare','Punto medio','Trapezoidale','Simpson')
title('errore delle formule composite')
xlabel('errore assoluto')
ylabel('numero di nodi')