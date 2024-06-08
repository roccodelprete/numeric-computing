% script formuleQ_composite
% disegna le figure che illustrano
% le formule composite midpoint, rettangolare, 
% trapezoidale e di Simpson
f_int=inline('sin(x)');
a=1;b=3;
breaks=[1  1.5  2  2.5  3];
n=length(breaks); 
p=n-1;      % numero di sottointervalli
h=(b-a)/p;  % ampiezza sottointervalli
fbreaks=f_int(breaks);
puntimedi=(breaks(1:end-1)+breaks(2:end))/2;
fpmedi=f_int(puntimedi);
xx=linspace(a,b,30);
yy=f_int(xx);
figure(1) 
hold on;
plot(breaks,zeros(size(breaks)),'rv',...
    [a a],[0 yy(1)],'b--', xx,yy,'b',[b b],[yy(end) 0],'b--')
legend('estremi dei sottointervalli')
title('sottointervalli')
axis([0 3.5 0 1.2])
hold off;
%
% trapezoidale composita
figure (2)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
for j=1:p
    plot([breaks(j) breaks(j+1)],[fbreaks(j) fbreaks(j+1)],'r')
    plot([breaks(j) breaks(j)],[0 fbreaks(j)],'r:')
    axis([0 3.5 0 1.2])
end
plot([breaks(n) breaks(n)],[0 fbreaks(n)],'r:')
axis([0 3.5 0 1.2])
hold off
figure(3)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
title('formula trapezoidale composita')
axis([0 3.5 0 1.2])
for j=1:p
    fill([breaks(j) breaks(j) breaks(j+1) breaks(j+1)],[0 fbreaks(j) fbreaks(j+1) 0],'r')
    axis([0 3.5 0 1.2])
end
hold off
%
% punto medio composita
figure (4)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
for j=1:p
    plot([breaks(j) breaks(j+1)],[fpmedi(j) fpmedi(j)],'c')
    plot([breaks(j) breaks(j)],[0 fbreaks(j)],'c:')
    axis([0 3.5 0 1.2])
end
hold off
figure(5)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
title('formula del punto medio composita')
axis([0 3.5 0 1.2])
for j=1:p
    fill([breaks(j) breaks(j) breaks(j+1) breaks(j+1)],[0 fpmedi(j) fpmedi(j) 0],'c')
    axis([0 3.5 0 1.2])
end
hold off
%
% rettangolare composita
figure (6)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
for j=1:p
    plot([breaks(j) breaks(j+1)],[fbreaks(j) fbreaks(j)],'k')
    plot([breaks(j) breaks(j)],[0 fbreaks(j)],'k:')
    axis([0 3.5 0 1.2])
end
hold off
figure(7)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
title('formula rettangolare composita')
axis([0 3.5 0 1.2])
for j=1:p
    fill([breaks(j) breaks(j) breaks(j+1) breaks(j+1)],[0 fbreaks(j) fbreaks(j) 0],'y')
    axis([0 3.5 0 1.2])
end
hold off
%
% Simpson composita
figure (8)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
for j=1:p
    parabola=polyfit([breaks(j) puntimedi(j) breaks(j+1)],[fbreaks(j) fpmedi(j) fbreaks(j+1)],2);
    xxx=linspace(breaks(j),breaks(j+1),15);
    yyyparabola=polyval(parabola,xxx);
    plot(xxx,yyyparabola,'g')
    plot([breaks(j) breaks(j)],[0 fbreaks(j)],'g:')
    axis([0 3.5 0 1.2])
end
plot([breaks(n) breaks(n)],[0 fbreaks(n)],'g:')
axis([0 3.5 0 1.2])
hold off
figure(9)
hold on
plot(xx,yy,'b',breaks,zeros(size(breaks)),'rv')
title('formula di Simpson composita')
axis([0 3.5 0 1.2])
for j=1:p
    parabola=polyfit([breaks(j) puntimedi(j) breaks(j+1)],[fbreaks(j) fpmedi(j) fbreaks(j+1)],2);
    xxx=linspace(breaks(j),breaks(j+1),15);
    yyyparabola=polyval(parabola,xxx);
    fill([breaks(j) xxx breaks(j+1)],[0 yyyparabola 0],'g')
    axis([0 3.5 0 1.2])
end
hold off
