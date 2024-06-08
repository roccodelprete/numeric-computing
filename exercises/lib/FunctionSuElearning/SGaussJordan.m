function x =SGaussJordan(A,b)
% risoluzione di un sistema di eq. lineari
% con il metodo di diagonalizzazione di Gauss-Jordan
%  (senza pivoting)
%  input:
%    A   matrice dei coefficienti
%        (inalterata in output)
%    b   vettore dei termini noti 
%        (inalterato in output)
% output:
%    x   soluzione 
%
n=size(A,1);
for k=1:n
  for i=[1:k-1 k+1:n]
    molt = A(i,k)/A(k,k);
    for j=k+1:n
      A(i,j)=A(i,j)-molt*A(k,j);
    end
    b(i)=b(i)-molt*b(k);
  end
end
x=b./diag(A);