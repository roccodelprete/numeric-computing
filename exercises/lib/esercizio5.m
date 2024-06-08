% script esercizio 5 - 2011
% Disegnare (in 9 diverse figure) i nove poligoni di n lati, con n=3 4 5 6 8
% 10 12 18 24, iscritti nel cerchio di centro cx, cy e raggio r.
clc
cx=2; cy=3; r=1.5;
teta=linspace(0,2*pi,361);
x=cx+r*cos(teta); y=cy+r*sin(teta); 
k=0;
for nlati=[3 4 5 6 8 10 12 18 24]
    stride = 360./nlati;
    k = k+1;
    subplot(3,3,k)
    plot(x(1:stride:361),y(1:stride:361))
    xlabel(sprintf('  n = %2.0f',nlati));
    axis([min([0 cx-r-0.5]) r+cx+0.5 min([0 cy-r-0.5]) r+cy+0.5])
    axis equal
end