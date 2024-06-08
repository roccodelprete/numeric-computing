function Matris = ProdottoEsterno1(x,y)
% prodotto scalare tra i vettori x e y 
% input:
%  x 		vettore – m elementi
%  y		vettore – n elementi
% output:
%  matris	matrice mxn
m = length(x); n = length(y);
Matris = zeros(m,n); 
 for j=1:n
    for i=1:m 
	   Matris(i,j) = x(i)*y(j);
    end
 end
