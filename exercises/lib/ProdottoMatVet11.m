function vetris = ProdottoMatVet11(A,v)
% prodotto tra la matrice A e il vettore v 
% - algoritmo base
% -versione a parallelismo sui dati (vettoriale,righe)
% input:
%   A  	matrice - mxn
%   v		vettore (colonna)- deve avere lunghezza n
% output:
%   vetris	vettore (colonna) di lunghezza m
%
 m = size(A,1); 
 if size(v,1) ~= size(A,2);
   disp(' errore in input'); return;
 end
 vetris = zeros(m,1); 
 for i=1:m
	vetris(i) = A(i,:)*v;   % prodotto scalare
 end