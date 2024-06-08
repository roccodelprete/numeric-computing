function vetris = SommaVettori(x,y)
% somma tra i vettori x e y 
% input:
%   x e y 	 vettori - devono avere lo stesso size
% output:
%   vetris	 vettore somma
n = length(x);
 if size(x) ~= size(y)
   disp(' errore in input'); return; 
 end;
 vetris = zeros(size(x)); 
 for i=1:n
   vetris(i) = x(i)+y(i);
 end
