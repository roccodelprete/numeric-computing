% script esercizio 4 - 2011
% Disegnare (in 9 diverse figure) i nove poligoni di n lati, con n=3 4 5 6 8
% 10 12 18 24, iscritti nel cerchio unitario.
clc
teta=linspace(0,2*pi,361);
x=cos(teta); y=sin(teta); 
k=0;
for nlati=[3 4 5 6 8 10 12 18 24]
    stride = 360./nlati;
    k = k+1;
    subplot(3,3,k)
    plot(x(1:stride:361),y(1:stride:361))
    xlabel(sprintf('  n = %2.0f',nlati));
    axis([-1.2 1.2 -1.2 1.2])
    axis square
end