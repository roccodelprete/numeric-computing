function A=scambia(A,r1,r2,c1,c2)
% scambia le righe r1 e r2 e poi le colonne c1 e c2 di A
if any([r1 r2 c1 c2]<=0)
    disp('errore in input'); return;
end
if any([r1 r2]>size(A,1))
    disp('errore in input'); return;
end
if any([c1 c2]>size(A,2))
    disp('errore in input'); return;
end
A([r1 r2],:)=A([r2 r1],:);
A(:,[c1 c2])=A(:,[c2 c1]);
