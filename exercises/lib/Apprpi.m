% script Apprpi
% Calcola una approssimazione di pi e 2*pi 
% e grafica l'andamento dell'errore assoluto.
N = 2.^(3:12);
ea=[];ep=[];
for n=N
[a ,p]= APennagono(n);
ea = [ea  abs(pi-a)];
ep=[ep abs(2*pi-p)];
end
semilogy(N,ea,'b',N,ep,'r')
legend('errore su pi','errore su 2*pi')