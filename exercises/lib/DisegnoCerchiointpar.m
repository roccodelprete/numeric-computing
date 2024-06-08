%script DisegnoCerchiointpar
% disegno della circonferenza unitaria con interpolazione parametrica
% n punti equispaziati sulla circonferenza unitaria.
% usa le spline (spline matlab) con parametro indice [figura 1], le cubiche di Hermite  con parametro indice(pchip
% matlab)[figura 2], il parametro teta (spline), il parametro teta (pchip)
%
n=input('inserire il numero di nodi di interpolazione: ');
teta = linspace(0,2*pi,n);
x = cos(teta); y = sin(teta);
t = 1:length(teta);
% griglia “fitta” sul range dell’indice (parametro)
tt = linspace(t(1),t(end),250);
% interpolazione delle ascisse
xspline = spline(t,x,tt);
% interpolazione delle ordinate 
yspline = spline(t,y,tt);
figure(1)
plot(x,y,'o',xspline,yspline)
axis equal
title('interpolazione con curve parametriche spline cubiche')
% interpolazione delle ascisse
xch = pchip(t,x,tt);
% interpolazione delle ordinate 
ych = pchip(t,y,tt);
figure(2)
plot(x,y,'o',xch,ych)
title('interpolazione con curve parametriche cubiche di hermite')
axis equal

tteta = linspace(teta(1),teta(end),250);
% interpolazione delle ascisse
xsplineteta = spline(teta,x,tteta);
% interpolazione delle ordinate 
ysplineteta = spline(teta,y,tteta);
figure(3)
plot(x,y,'o',xsplineteta,ysplineteta)
axis equal
title('interpolazione con curve parametriche spline cubiche')
xlabel('teta')
% interpolazione delle ascisse
xchteta = pchip(teta,x,tteta);
% interpolazione delle ordinate 
ychteta = pchip(teta,y,tteta);
figure(4)
plot(x,y,'o',xchteta,ychteta)
title('interpolazione con curve parametriche cubiche di hermite')
xlabel('teta')
axis equal