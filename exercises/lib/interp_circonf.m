% script interp_circonf
% interpolazione di 9 punti equispaziati sulla
% circonferenza unitaria
teta=linspace(0,2*pi,9);
x=cos(teta);y=sin(teta);
figure(1)
plot(x,y,'o')
axis([-1.2 1.2 -1.2 1.2])
axis equal
figure(2)
plot(x,'s')
figure(3)
plot(y,'s')
t=1:length(teta);
tt=linspace(t(1),t(end),250);
xspline=spline(t,x,tt);
yspline=spline(t,y,tt);
figure(4)
plot(t,x,'s',tt,xspline,'r')
figure(5)
plot(t,y,'s',tt,yspline,'r')
figure(6)
plot(x,y,'o',xspline,yspline)
axis([-1.2 1.2 -1.2 1.2])
axis equal