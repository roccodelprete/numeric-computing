% x=vec(X) transforms matrix X into a vector by stacking columns of X
function x=vec(X)
[m,n]=size(X);
x=zeros(n*m,1);
for j=1:n
    x((j-1)*m+1:j*m)=X(:,j);
end
