R=@(x) ones(size(x))./(1+25*x.^2);
n=9; x=linspace(-1,1,n);
xx=linspace(-1,1,200);
yR= R(x); yyR=R(xx);
ypol=polyval(polyfit(x,yR,length(x)-1),xx);
%grafico punti da interpolare, Runge, pol int
plot(x,yR,'o',xx,yyR,'r',xx,ypol,'b')
