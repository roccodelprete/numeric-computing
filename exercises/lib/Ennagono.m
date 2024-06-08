function areaennag=Ennagono(n)
% disegna l'n-gono regolare inscritto nel cerchio unitario, il cerchio
% unitario; poi calcola (e restituisce) e visualizza l'area dell'ennagono e la differenza con pi
teta=linspace(0,2*pi,n+1);
x=cos(teta); y=sin(teta);
clf
hold on
plot(x,y,'b')
axis equal square
axis([-2 2 -2 2])
tteta=linspace(0,2*pi,20*n);
xcerchio=cos(tteta); ycerchio=sin(tteta);
plot(xcerchio,ycerchio,'r')
lato=sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);
areaennag=n*0.25*sqrt(4*lato^2-lato^4);%usa una versione speciale della formula di Erone
title(['area ',int2str(n),'-gono: ',num2str(areaennag, '%25.16f')])
text(-1,-1.5,['differenza con pi: ',num2str(abs(pi-areaennag))])
hold off

