function P = curva_int_H( x,y )
% costruisce una curva parametrica di Hermite 
%   che interpola i punti (x,y) passati in input


x=[x;x(1)];

y=[y;y(1)];


t= 1:length(x);

tt=linspace(min(t),max(t),250);


xt= pchip(t,x,tt);


yt = pchip(t,y,tt);

P=[xt;yt];



end

