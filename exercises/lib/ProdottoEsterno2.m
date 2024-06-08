function Matris = ProdottoEsterno2(x,y)
% prodotto scalare tra i vettori x e y 
% input:
%  x 		vettore colonna – m elementi
%  y		vettore – n elementi
% output:
%  matris	matrice mxn
m = length(x); n = length(y);
Matris = zeros(m,n); 
 for j=1:n
	Matris(:,j) = x*y(j);  % scalare per vettore
 end
