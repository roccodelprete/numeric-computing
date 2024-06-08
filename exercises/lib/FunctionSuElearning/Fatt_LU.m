function [A]=Fatt_LU(A)
% fattorizzazione LU in 
% place, (senza pivoting),
% a parallelismo sui dati.
%           A=L*U
n=size(A,1);
for k=1:n-1
   A(k+1:n,k)= A(k+1:n,k)/A(k,k);
   A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-...
			A(k+1:n,k)*A(k,k+1:n);
end