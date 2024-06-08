function [ a,p ] = APennagono(n)
% APennagono(n) calcola l'area e il perimetro dell'n-gono
% regolare iscritto nel cerchio unitario
%
% calcolo dei vertici dell'n-gono
teta = linspace(0,2*pi,n+1);
x=cos(teta); y=sin(teta);
%
a = AreaPoligono(x,y);
p = PerimetroPoligono(x,y);
end

