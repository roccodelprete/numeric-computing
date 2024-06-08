function ris = ProdottoScalare(x,y)
% prodotto scalare tra i vettori x e y 
% input:
%  x e y 	vettori - devono avere lo stesso numero di 
%		elementi possono essere sia riga sia
%		colonna
% output:
%  ris	scalare
n = length(x);
 if length(y) ~= n
   disp(' errore in input'); return; 
 end;
 ris = 0; 
 for i=1:n
   ris = ris + x(i)*y(i);
 end