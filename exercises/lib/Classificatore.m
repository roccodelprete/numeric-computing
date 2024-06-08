function [ xc1 yc1 xc2 yc2 ] = Classificatore( x, y, c1, c2 )
% Classificatore binario dei punti x,y nella classe dei punti più vicini a c1 
% e nella classe dei punti più vicini a c2.
%   
n=length(x);
p=1; q=1;
for i=1:n
    if norm(c1 - [x(i) y(i)]') < norm(c2 - [x(i) y(i)]')
        xc1(p)=x(i); yc1(p)=y(i);p=p+1;
    else
        xc2(q)=x(i); yc2(q)=y(i);q=q+1;
    end
end
end

