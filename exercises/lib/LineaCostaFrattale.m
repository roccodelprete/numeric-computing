% script LineaCostaFrattale
% genera una linea di costa frattale a partire da un segmento di retta verticale
% il numero di iterazioni è fissato in input.
n=input('inserire il numero di iterazioni: ');
clf
y=[0 0.5 1]; x=[0 -0.2 0];
plot(x,y,'b')
for i=1:n
    lx=length(x);
    xnew=zeros(1,2*lx-1);
    ly=length(y);
    ynew=zeros(1,2*ly-1);
    deltax=abs(diff(x)/2); deltax(deltax==0)=0.2*rand();
    deltay=abs(diff(y)/2);
    xrand = -1+2*rand(size(deltax)); yrand = -1+2*rand(size(deltay));
    newx=((x(1:end-1)+x(2:end))/2)+xrand.*deltax;
    newy=abs(((y(1:end-1)+y(2:end))/2)+yrand.*deltay);newy(newy>1)=1-1000*eps;
    xnew(1:2:end)=x;xnew(2:2:end-1)=newx;
    ynew(1:2:end)=y;ynew(2:2:end-1)=newy;
    plot(xnew,ynew,'b')
    axis([-1 1 0 1])
    x=xnew; y=ynew;
end