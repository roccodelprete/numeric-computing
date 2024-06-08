function vetris = ProdottoMatVet2(A,v)
% prodotto tra la matrice A e il vettore v
% - algoritmo di combinazione di colonne
% - versione a parallelismo sui dati (vettoriale,col.)
% input:
%   A  	matrice - mxn
%   v		vettore (colonna)- deve avere lunghezza n
% output:
%   vetris	vettore (colonna) di lunghezza m
%
m = size(A,1); n = size(A,2);
 if size(v,1) ~= n
   disp(' errore in input'); return; 
 end;
 vetris = zeros(m,1); 
 for j=1:n
	vetris = vetris + A(:,j)*v(j); % saxpy 
 end
