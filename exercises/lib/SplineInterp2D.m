function [XX,YY,ZZ]=SplineInterp2D(X,Y,Z)
% 2D interpolation on the 2D regular mesh stored in matrices X and Y of the
% data matrix Z
% 2D interpolation is performed by intepolating at x fixed and then by
% interpolating at y fixed (over a finer grid).
x=X(1,:);y=Y(:,1);n=length(x); m=length(y);
xx=linspace(min(x),max(x),6*n);
yy=linspace(min(y),max(y),6*m);
nn=length(xx);mm=length(yy);
[XX,YY]=meshgrid(xx,yy);
ZZ=zeros(size(XX));
zm=zeros(mm,n);
for j=1:n
    zm(:,j)=spline(y,Z(:,j),yy);
end
for i=1:mm
   ZZ(i,:)=spline(x,zm(i,:), xx);
end
