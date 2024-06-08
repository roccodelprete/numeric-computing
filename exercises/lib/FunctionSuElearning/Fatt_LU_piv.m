function [L,U,ipiv]=Fatt_LU_piv(A)
% fattorizzazione LU non in 
% place, con pivotingparziale,
% a parallelismo sui dati.
%           PP*A=L*U
% PP e' la matrice delle permutazioni,
% memorizzate mediante un array 1D di
% indici puntatori ipiv
%      P*A=A(ipiv,:)
n=size(A,1);ipiv=1:n;
for k=1:n-1
  % pivoting parziale
  [pivot,r]=max(abs(A(k:n,k)));
  r=r+k-1; % spiazzamento
  if pivot == 0
   disp('matrice singolare'); break;
  else
  %scambio righe; 
  %anche i moltiplicatori vengono scambiati
   A([k  r],:)=A([r  k],:);
   ipiv([k  r])=ipiv([r  k]);
  % eliminazione
   A(k+1:n,k)= A(k+1:n,k)/A(k,k);
   A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-...
			A(k+1:n,k)*A(k,k+1:n);
  end
end
L = eye(n,n)+tril(A,-1);
U = triu(A);
