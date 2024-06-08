function [U,p]=GaussJordan_nip1(A,b)
% triangolarizzazione di Gauss
% non in place.
% Il sistema Ux=p e' equivalente al
% sistema Ax=b
% U e' triangolare superiore.
n=size(A,1);
U=A; p=b;
for k=1:n
    [U p]
    pause
  for i=[1:k-1 k+1:n]
    molt= U(i,k)/U(k,k);
    U(i,k)=0; % azzeramento esplicito
    for j=k+1:n
      U(i,j)=U(i,j)-molt*U(k,j);
    end
    p(i)=p(i)-molt*p(k);
  end
end