 function perimetro = PerimetroPoligono( x,y )
% PerimetroPoligono(x,y) calcola il perimetro del poligono
% i cui vertici sono in x e y (ascisse, ordinate).
% i vettori x e y devono avere il primo vertice duplicato
% (rappresentazione standard di una spezzata chiusa)

 perimetro = sum(sqrt(diff(x).^2 + diff(y).^2));
 
end

