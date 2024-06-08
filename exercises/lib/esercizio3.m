% script esercizio3 disegna la bandiera italiana, ricevendo in input l’ascissa e
% l’ordinata dal punto in basso a sinistra, la larghezza e l’altezza della bandiera. 
larg= input('larghezza della bandiera: ');
alt = input('altezza della bandiera: '); 
x0 = input('ascissa del vertice in basso a sinistra: '); 
y0 = input('ordinata del vertice in basso a sinistra: ');
h=larg/3;
R1x=[x0 x0+h x0+h x0 x0];
Ry=[y0 y0 y0+alt y0+alt y0];
hold on
fill(R1x,Ry,'g')
R2x=[x0+h x0+2*h x0+2*h x0+h x0+h];
fill(R2x,Ry,'w')
R3x=[x0+2*h x0+3*h x0+3*h x0+2*h x0+2*h];
fill(R3x,Ry,'r')
axis([x0-0.1*larg x0+larg+0.1*larg y0-0.1*alt y0+alt+0.1*alt])
hold off
axis off
