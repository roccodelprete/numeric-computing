function P=CreaPuntiCasuali(n)
% genera un insieme di n punti casuali del piano nel quadrato
% [0,10]x[0,10].
% Ogni punto è rappresentato con una struct con campo x e campo y.
% L'insieme dei punti P è un array di struct di lunghezza n.
for i =1:n
    P(i)=struct('x',rand(1),'y',rand(1));
end
