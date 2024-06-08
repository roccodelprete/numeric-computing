function [A,b]=TriangGauss_pd(A,b)
% triangolarizzazione di Gauss
% in place, a parallelismo sui dati.
% Il sistema Ax=b e' equivalente al
% sistema Ux=p
% U e' triangolare superiore ed e'
% memorizzata nel triangolo superiore di
% A; p e'memorizzato in b.
n=size(A,1);
for k=1:n-1
  for i=k+1:n
    molt= A(i,k)/A(k,k);
    A(i,k+1:n)=A(i,k+1:n)-...
                 molt*A(k,k+1:n);
    b(i)=b(i)-molt*b(k);
  end
end