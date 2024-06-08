% script graficologErrore
% grafico dell'errore di approssimazione
% delle formule composite
% 
% f_int = sin
% a= 1, b=3
a=1;b=3;
nvet=2.^[2:6]+1;
errorer=zeros(size(nvet));
errorepm=zeros(size(nvet));
erroret=zeros(size(nvet));
erroreS=zeros(size(nvet));
vesatto=quad('sin',a,b);
for k=1:length(nvet)
   Qfr=Rettangolare('sin',a,b,nvet(k));
   errorer(k)=abs(vesatto-Qfr);
   Qfpm=Puntomedio('sin',a,b,nvet(k));
   errorepm(k)=abs(vesatto-Qfpm);
   Qft=Trapezoidale('sin',a,b,nvet(k));
   erroret(k)=abs(vesatto-Qft);
   QfS=Simpson('sin',a,b,nvet(k));
   erroreS(k)=abs(vesatto-QfS);
end
figure(1)
plot(nvet,errorer,'o',nvet,errorer,'b',...
   nvet,errorepm,'o',nvet,errorepm,'c',...
   nvet,erroret,'o',nvet,erroret,'r',...
   nvet,erroreS,'o',nvet,erroreS,'g')
axis([0 70 0 0.001])
figure(2)
semilogy(nvet,errorer,'o',nvet,errorer,'b',...
   nvet,errorepm,'o',nvet,errorepm,'c',...
   nvet,erroret,'o',nvet,erroret,'r',...
   nvet,erroreS,'o',nvet,erroreS,'g')
figure(3)
loglog(nvet,errorer,'o',nvet,errorer,'b',...
   nvet,(nvet-1).^(-1),'k',...
   nvet,errorepm,'o',nvet,errorepm,'c',...
   nvet,(nvet-1).^(-2),'k',...
   nvet,erroret,'o',nvet,erroret,'r',...
   nvet,erroreS,'o',nvet,erroreS,'g',...
   nvet,(nvet-1).^(-4),'k')

