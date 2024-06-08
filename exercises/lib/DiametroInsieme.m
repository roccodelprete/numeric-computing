function [Q1,Q2]=DiametroInsieme(P)
% Calcola il diametro dell'insieme dei punti P (P e un array di struct, con
% campo x ascissa e campo y ordinata). Q1 e Q2 sono i due punti di massima
% distanza
n=length(P);
%visualizza l'insieme dei punti
hold on
for i=1:n
    plot(P(i).x,P(i).y,'*')
end
Q1=P(1); Q2=P(2); dmax=Distanza(Q1,Q2)
for i=1:n-1
    for j=i+1:n
        d=Distanza(P(i),P(j));
        if(d>dmax)
            dmax=d; Q1=P(i); Q2=P(j);
        end
    end
end
plot(Q1.x,Q1.y,'s',Q2.x,Q2.y,'s',[Q1.x Q2.x],[Q1.y Q2.y],'r')
hold off