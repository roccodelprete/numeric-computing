function [a,b]=PaTLin(x,y)
% interpolazione con polinomio lineare
% a tratti
% input
%    x,y   vettori dei nodi e di valori
%          (ascisse e ordinate dei punti
%           da interpolare)
% output
%    a     a(i) � il primo coefficiente
%          dell'i-simo polinomio
%    b     b(i) � il secondo coefficiente
%          dell'i-simo polinomio
%          a,b hanno n-1 componenti
n=length(x);
a=y(1:n-1);
b=diff(y)./diff(x);