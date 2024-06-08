%script esercizio8
% Data la matrice M e il vettore vett, calcolare e visualizzare i 15 valori
% della simiglianza (val ass coseno dell'angolo) tra vett e i primi 15 vettori 
% generati dalla formula ricorrente x=M*x, con x che assume il valore
% iniziale [1 -1 1 -1]'.
M =[    -13    11    0    14
        14     5    14     9
        -6     7     0    13
        14    10    0     6];
vett =[0.3698    0.6645    0.3473    0.5488]';
n=15;
x=[1 -1 1 -1]';
simiglianza(1)=abs(x'*vett/(norm(x)*norm(vett)));
for i=2:n
     x=M*x/norm(x);
     simiglianza(i)=abs(x'*vett/(norm(x)*norm(vett)));
end
plot(simiglianza)
ylabel('similarità')
xlabel('iterazioni')