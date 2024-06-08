function x=STriangSup(U,b)
% risoluzione di un sistema di eq. lineari
% triangolare superiore (backward substitution)
% La matrice dei coefficienti U e' memorizzata
% in formato standard
n=size(U,1);x=zeros(size(b));
x(n)=b(n)/U(n,n); 
for i=n-1:-1:1
  x(i)=(b(i)-U(i,i+1:n)*x(i+1:n))/(U(i,i));
end
