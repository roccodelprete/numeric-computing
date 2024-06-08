function VP=appr_int(x,y)
% determina e visualizza i polinomi
% di grado da 1 a length(x)-1 m.q. 
% che approssimano i dati x,y
lx=length(x);
minx=min(x);maxx=max(x);
xx=linspace(minx,maxx,10*lx);
for k=1:lx-1
   VP(:,k)=(polyval(polyfit(x,y,k),xx))';
end
plot(x,y,'o',xx,VP)
a=minx-0.5;b=maxx+0.5;
c=min(y)-0.5;d=max(y)+0.5;
axis([a b c d])
