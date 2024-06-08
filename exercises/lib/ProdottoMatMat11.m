function Matris = ProdottoMatMat11(A,B)
% prodotto tra la matrice A e il vettore v
% - algoritmo base (prodotto scalare righe per colonne)
% - versione a parallelismo sui dati (vettoriale)
% input:
%   A  	matrice - mxn
%   B		matrice - nxp
% output:
%   Matris	matrice mxp
%
 m = size(A,1); n = size(A,2); p = size(B,2); 
 if size(B,1) ~= n
   disp(' errore in input'); return;
 end;
 Matris = zeros(m,p); 
 for i=1:m
   for j=1:p
	Matris(i,j) = A(i,:)*B(:,j); % prodotto scalare
   end
 end
