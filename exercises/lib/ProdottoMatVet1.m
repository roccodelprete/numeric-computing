function vetris = ProdottoMatVet1(A,v)
% prodotto tra la matrice A e il vettore v
% - algoritmo base
% - versione elementare
% input:
%   A  	matrice - mxn
%   v		vettore (colonna)- deve avere lunghezza n
% output:
%   vetris	vettore (colonna) di lunghezza m
 m = size(A,1); n = size(A,2);
 if size(v,1) ~= n
 disp(' errore in input'); return;
 end
 vetris = zeros(m,1); 
 for i=1:m
	for j=1:n
   		vetris(i) = vetris(i)+A(i,j)*v(j);
 	end
 end
