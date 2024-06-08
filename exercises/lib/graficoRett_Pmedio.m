% script graficoRett_Pmedio
% grafico dell'errore di approssimazione
% della Rettangolare composita
% 
% f_int = sin
% a= 1, b=3
a=1;b=3;
nvet=2.^[1:6];
errore=zeros(size(nvet));
errorepm=zeros(size(nvet));
vesatto=quad('sin',a,b);
for k=1:length(nvet)
   Qf=Rettangolare('sin',a,b,nvet(k));
   errore(k)=abs(vesatto-Qf);
   Qfpm=Puntomedio('sin',a,b,nvet(k));
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
   nvet,(b-a)*(nvet-1).^(-1),'r',...
   nvet,errorepm,'o',nvet,errorepm,'k',...
   nvet,(b-a)*(nvet-1).^(-2),'c')
