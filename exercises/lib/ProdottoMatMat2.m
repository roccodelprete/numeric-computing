function Matris = ProdottoMatMat2(A,B)
% prodotto tra la matrice A e il vettore v
% - algoritmo basato sul prodotto matrice vettore
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
 for j=1:p
	Matris(:,j) = A*B(:,j); % prodotto matrice vettore
 end
