function y=ennagono_reg(n)
% disegna l'n-gono regolare inscritto nel cerchio unitario
teta=linspace(0,2*pi,n+1);
x=cos(teta); y=sin(teta);
plot(x,y)
axis square
axis([-2 2 -2 2])