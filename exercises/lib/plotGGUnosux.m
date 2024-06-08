% script plotGGUnosux
xx=linspace(0.5,2.5,100);
yy=GGunosux(xx);
xx1=linspace(1,2,60);
yy1=GGunosux(xx1);
hold on
plot(xx,yy,'b')
fill([1 xx1 2],[0 yy1 0],'r')
axis([0 3 0 2.5])
hold off