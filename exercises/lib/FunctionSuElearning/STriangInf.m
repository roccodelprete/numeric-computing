function x=STriangInf(L,b)
% risoluzione di un sistema di eq. lineari
% triangolare inferiore (forward substitution)
% La matrice dei coefficienti L e' memorizzata
% in formato standard
n=size(L,1);x=zeros(size(b));
x(1)=b(1)/L(1,1); 
for i=2:n
  x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/(L(i,i));
end