function [A,b]=TriangGauss(A,b)
% triangolarizzazione di Gauss
% in place.
% Il sistema Ux=p e' equivalente al
% sistema Ax=b
% U e' triangolare superiore ed e'
% memorizzata nel triangolo superiore di
% A; p e'memorizzato in b.
n=size(A,1);
for k=1:n-1
  for i=k+1:n
    molt= A(i,k)/A(k,k);
    for j=k+1:n
      A(i,j)=A(i,j)-molt*A(k,j);
    end
    b(i)=b(i)-molt*b(k);
  end
end