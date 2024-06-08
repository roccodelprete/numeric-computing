% script Graficisplinerunge
% disegna i grafici della Lezione 7 sull'interpolazione con spline
% della funzione di runge su nodi equispaziati
%
n=input('inserire il numero di nodi: ');
f=@(x) 1./(1+25*x.^2);
x=linspace(-1,1,n); y=f(x);
xx=linspace(-1,1,200); yf=f(xx);
yspline=spline(x,y,xx);
ynat=QScubicspline(x,y,xx);
ych=pchip(x,y,xx);
figure(1)
plot(x,y,'o',xx,yspline,'b')
title('interpolazione con spline not a knot')
figure(2)
plot(x,y,'o',xx,ych,'g')
title('interpolazione con cubiche di hermite a tratti')
figure(3)
plot(x,y,'o',xx,ynat,'r')
title('interpolazione con spline naturali')
figure(4)
plot(xx,abs(yf-yspline),'b')
title(sprintf('errore di ricostruzione spline not a knot %d nodi equispaziati',n))
figure(5)
plot(xx,abs(yf-ych),'g')
title(sprintf('errore di ricostruzione cubica di hermite a tratti %d nodi equispaziati',n))
figure(6)
plot(xx,abs(yf-ynat),'r')
title(sprintf('errore di ricostruzione spline naturale %n nodi equispaziati',n))