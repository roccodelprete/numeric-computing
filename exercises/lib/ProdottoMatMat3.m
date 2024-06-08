function Matris = ProdottoMatMat3(A,B)
% prodotto tra la matrice A e il vettore v
% - algoritmo basato sulla somma di matrici(prod. esterno) 
% - versione a parallelismo sui dati (matriciale)
% input:
%   A  	matrice - mxn
%   B		matrice - nxp
%
% output:
%   Matris	matrice mxp
%
 m = size(A,1); n = size(A,2); p = size(B,2); 
 if size(B,1) ~= n
   disp(' errore in input'); return; 
 end;
 Matris = zeros(m,p); 
 for j=1:n
	Matris = Matris + A(:,j)*B(j,:); % prodotto esterno
 end