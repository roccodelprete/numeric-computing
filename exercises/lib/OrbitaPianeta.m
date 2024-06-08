% script OrbitaPianeta
% detrmina l'orbita di un pianeta a partire da misure di punti dell'orbita
%usa i minimi quadrati
x=[ 1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
y=[0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';
B=[y.^2 x.*y x y ones(size(x))];
v=x.^2;
coef=B\v;
xx=linspace(min(x),max(x),100);
a=coef(1); b=coef(2); c=coef(3); d=coef(4); e=coef(5);
yy=(-(b*xx+d)+sqrt((b*xx-d).^2-4*(a*(c*xx+e-xx.^2))))/(2*a);
yyy=(-(b*xx+d)-sqrt((b*xx-d).^2-4*(a*(c*xx+e-xx.^2))))/(2*a);
plot(x,y,'o',xx,yy,xx,yyy)