% script BandieraOlimpica
teta=linspace(0,2*pi,40);
r=1; h=0.2;
c1x= 2; c1y=2;
c2x= 2+h+2*r; c2y=2;
c3x= 2-r; c3y=2+h+r;
c4x= c3x+h+2*r; c4y=2+h+r;
c5x= c4x+h+2*r; c5y=2+h+r;
x=r*cos(teta);y=r*sin(teta);
hold on
set(0,'defaultlinelinewidth',7)
plot(c1x+x,c1y+y,'y')
plot(c2x+x,c2y+y,'g')
plot(c3x+x,c3y+y,'c')
plot(c4x+x,c4y+y,'k')
plot(c5x+x,c5y+y,'r')
axis([-0.5 6.5 0 5])
axis equal
hold off
set(0,'defaultlinelinewidth',1)
