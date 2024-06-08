% script esercizio 7.
% Simulare 1000 lanci di una coppia di dadi e disegnare l’istogramma delle
% frequenze assolute e relative dei risultati. Visualizzare il risultato piu' frequente
dado1 = 1 + floor(6*rand(1000,1));
dado2 = 1 + floor(6*rand(1000,1));
risultato = dado1 + dado2;
figure (1)
hist(risultato,linspace(2,12,11));
title(' frequenze assolute di mille lanci di coppie di dadi')
figure (2)
h=hist(risultato,linspace(2,12,11));
bar(linspace(2,12,11),h/1000,1);
title(' frequenze relative di mille lanci di coppie di dadi')
disp(sprintf('risultato piu'' frequente = %2.0f',mode(risultato)))
