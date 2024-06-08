function [A,b]=TriangGauss_pivot(A,b)
% triangolarizzazione di Gauss in place
% con pivoting, a parallelismo sui dati.
% Il sistema Ax=b e' equivalente al
% sistema Ux=p
% U e' triangolare superiore ed e'
% memorizzata nel triangolo superiore di
% A; p e'memorizzato in b.
n=size(A,1);
for k=1:n-1
  % pivoting parziale
  [pivot,ind_piv]=max(abs(A(k:n,k)));
  ind_piv=ind_piv+k-1; % spiazzamento dell'indice locale
  if pivot == 0
      disp('matrice singolare');break;
  else
  %scambio righe
   A([k  ind_piv],k:n)=A([ind_piv  k],k:n);
   b([k  ind_piv])=b([ind_piv  k]);
  % eliminazione
   for i=k+1:n
     molt= A(i,k)/A(k,k);
     A(i,k+1:n)=A(i,k+1:n)-molt*A(k,k+1:n);
     b(i)=b(i)-molt*b(k);
   end
  end
end