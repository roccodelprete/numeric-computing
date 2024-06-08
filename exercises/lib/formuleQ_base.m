% script formuleQ_base
% disegna le figure che illustrano
% le formule di base midpoint, rettangolare, 
% trapezoidale e di Simpson
f_int=inline('sin(x)');
a=1;b=3;
xx=linspace(a,b,30);
yy=f_int(xx);
figure(10)
plot([a a],[0 yy(1)],'b--', xx,yy,'b',[b b],[yy(end) 0],'b--')
title('funzione integranda sin(x)')
axis([0 3.5 0 1.2])
figure(1)
hold on;
plot(xx,yy,'b')
title('rettangoloide funzione integranda')
fill([a xx b],[0 yy 0],'b')
axis([0 3.5 0 1.2])
hold off;
% trapezoidale
figure (2)
plot([a a],[0 yy(1)],'b--', xx,yy,'b',...
    [b b],[yy(end) 0],'b--',[a b],[f_int(a)  f_int(b)],'r')
axis([0 3.5 0 1.2])
figure(3)
hold on
plot(xx,yy,'b')
fill([a a b b],[0 f_int(a) f_int(b) 0],'r')
title('formula trapezoidale')
axis([0 3.5 0 1.2])
hold off
%
% punto medio
m=(a+b)/2;
figure (4)
plot([a a],[0 yy(1)],'b--', xx,yy,'b',...
    [b b],[yy(end) 0],'b--',[a b],[f_int(m) f_int(m)],'c')
axis([0 3.5 0 1.2])
figure(5)
hold on
plot(xx,yy,'b')
fill([a a b b],[0 f_int(m) f_int(m) 0],'c')
title('formula del punto medio')
axis([0 3.5 0 1.2])
hold off
%
% rettangolare
figure (6)
plot([a a],[0 yy(1)],'b--', xx,yy,'b',...
    [b b],[yy(end) 0],'b--',[a b],[f_int(a)  f_int(a)],'k')
axis([0 3.5 0 1.2])
figure(7)
hold on
plot(xx,yy,'b')
fill([a a b b],[0 f_int(a) f_int(a) 0],'y')
title('formula rettangolare')
axis([0 3.5 0 1.2])
hold off
%
% Simpson
m=(a+b)/2;
% parabola intepolante sui tre punti
% (a,f_int(a)),(m,f_int(m)),(b,f_int(b))
parabola=polyfit([a m b],[f_int(a) f_int(m) f_int(b)],2);
yyparabola=polyval(parabola,xx);
figure (8)
plot([a a],[0 yy(1)],'b--', xx,yy,'b',[b b],[yy(end) 0],...
    'b--',xx,yyparabola,'g')
axis([0 3.5 0 1.2])
figure(9)
hold on
plot(xx,yy)
fill([a xx b],[0 yyparabola 0],'g')
title('formula di Simpson')
axis([0 3.5 0 1.2])
hold off
