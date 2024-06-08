x=[0.5000 1.0000 1.3000 1.5000]';
y=[1.2000 1.6000 2.8000 2.6000]';
xx=linspace(0.2,1.8,200);
ypol=polyval(polyfit(x,y,length(x)-1),xx);
B=[ones(size(x)) cos(x) cos(2*x) sin(x)];
a=B\y;
ym1=a(1)+a(2)*cos(xx)+a(3)*cos(2*xx)+a(4)*sin(xx);
C=[ones(size(x)) sqrt(x) exp(x) x.^2];
c=C\y;
ym2=c(1)+c(2)*sqrt(xx)+c(3)*exp(xx)+c(4)*xx.^2;
plot(x,y,'o',xx,ypol,'b',xx,ym1,'r',xx,ym2,'g')
title('interpolazione su 4 nodi con 3 modelli')
legend('dati','pol grado 3 int','mod 1 int','mod 2 int')