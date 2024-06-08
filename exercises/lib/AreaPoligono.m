function area = AreaPoligono( x,y )
% AreaPoligono(x,y)calcola l'area del poligono x, y (ascisse ordinate dei
% vertici). Il primo vertice è duplicato.
 area = 0.5*abs(sum(x(1:end-1).*y(2:end))-sum(y(1:end-1).*x(2:end)));
end

