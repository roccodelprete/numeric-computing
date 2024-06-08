function y=mia_sqrt(a)
% calcola la radice quadrata, con una
% accuratezza di almeno 1e-12, usando il 
% metodo di Newton (versione vettorializzata)
a=abs(a);
ykprec = a/10; % approssimazione iniziale
yk = 0.5*(ykprec+a./ykprec);
% disp([yk,abs(yk-ykprec)])
while any(abs(yk-ykprec)>1.e-12) % tolleranza fissata
    ykprec=yk;
    yk = 0.5*(ykprec+a./ykprec);
    %disp([yk,abs(yk-ykprec)])
end
y=yk;



