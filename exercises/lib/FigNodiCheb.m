% script FigNodiCheb
n=12;
k=1:n;
xcheb=cos((2*k-1)*pi/(2*n));
y_circ=sqrt(1-xcheb.^2);
xx=linspace(-1,1,100);
circ=sqrt(1-xx.^2);hold on
plot(xx,circ,'k',xcheb,y_circ,'or')
plot([xx(1) xx(end)],[0 0],'k')
axis([-1.1 1.1 -0.2 1.3])
plot(xcheb,zeros(size(xcheb)),'sb')
for k=1:n
    plot([xcheb(k) xcheb(k)],[y_circ(k) 0],':')
end   
hold off
