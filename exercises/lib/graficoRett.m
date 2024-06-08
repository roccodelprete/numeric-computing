% script graficoRett
% grafico dell'errore di approssimazione
% della Rettangolare composita
% 
% f_int = sin
% a= 1, b=3
nvet=2.^[1:12];
errore=zeros(size(nvet));
errorepm=zeros(size(nvet));
vesatto=quad('sin',1,3);
for k=1:length(nvet)
   Qf=Rettangolare('sin',1,3,nvet(k));
   errore(k)=abs(vesatto-Qf);
   Qfpm=Puntomedio('sin',1,3,nvet(k));
   errorepm(k)=abs(vesatto-Qfpm);
end
figure(1)
plot(nvet,errore,'o',nvet,errore,...
   nvet,errorepm,'o',nvet,errorepm,'k')
figure(2)
semilogy(nvet,errore,'o',nvet,errore,...
   nvet,errorepm,'o',nvet,errorepm,'k')
figure(3)
loglog(nvet,errore,'o',nvet,errore,...
   nvet,ones(size(nvet))*2./(nvet-1),'r',...
   nvet,errorepm,'o',nvet,errorepm,'k',...
   nvet,ones(size(nvet))*2./((nvet-1).^2),'r')
