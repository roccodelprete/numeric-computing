%   felceapezzi.m
%   E' una variante della function felce_frattale
%   Sfrutta un menu per scegliere quale figura generare fra le 4 che
%   compongono la felce finale. Ogni figura viene ottenuta 
%   usando sempre e solo la propria trasformazione affine.
%   E' possibile scegliere, come ultima possibilità, 
%   la visualizzazione della felce intera.
%   La function non si ferma automaticamente, ma è necessario premere
%   sul bottone Stop. Per terminare l’esecuzione, invece, bisogna usare il tasto Chiudi 

shg % Significa "Show Graphic Window" e porta in primo piano la finestra grafica
clf reset % Resetta le impostazioni grafiche ai loro valori di default
set(gcf,'color','white','menubar','none', ... % Cambia il colore dello sfondo in bianco 
   'numbertitle','off','name','Felce Frattale') % e da' un titolo alla finestra grafica
x=[-1;5];  % Attribuisce valori iniziali -1 all'ascissa e 5 all'ordinata del punto x della Felce
v1=[1;1]; % Attribuisce valori iniziali 1 all'ascissa e 1 all'ordinata del punto v1 della Prima Traformazione
v2=[1;1]; % Attribuisce valori iniziali 1 all'ascissa e 1 all'ordinata del punto v2 della  della Seconda Traformazione
v3=[1;1]; % Attribuisce valori iniziali 1 all'ascissa e 1 all'ordinata del punto v3 della  della Terza Traformazione
v4=[1;1]; % Attribuisce valori iniziali 1 all'ascissa e 1 all'ordinata del punto v4 della  della Quarta Traformazione
h=plot(x(1),x(2),'.'); % Disegna il punto x e lo salva nella variabile h, in modo da poter successivamente modificare le proprieta' del grafico
rosso = [99/100 0 0]; % Definisce il colore rosso ponendo a zero a 0 le componenti di blu e verde, e a 99/100 dell'intensita' massima il rosso
set(h,'markersize',1,'color',rosso,'erasemode','none'); % modifica la variabile h facendo rendendo il punto piu' piccolo
                                                        % di colore rosso,  facendo in  modo che esso non venga cancellato
                                                        % quando verranno cambiate le sue coordinate
axis([-3 3 0 10]) % Setta il range degli assi in questo modo:  -3 <= x(1) <= 3,  0 <= x(2) <= 10
axis off          % Non traccia gli assi cartesiani
stop = uicontrol('style','toggle','string','Stop!','background','white'); % Cambia lo stile, il nome e il colore del tasto di stop
drawnow % Disegna il punto h

p  = [ .85  .92  .99  1.00];  % Definisce un vettore di probabilita'
A1 = [ .85  .04; -.04  .85];  b1 = [0; 1.6]; % Definiamo Matirce e Vettore per la Prima Trasformazione Affine
A2 = [ .20 -.26;  .23  .22];  b2 = [0; 1.6]; % Definiamo Matirce e Vettore per la Seconda Trasformazione Affine
A3 = [-.15  .28;  .26  .24];  b3 = [0; .44]; % Definiamo Matirce e Vettore per la Terza Trasformazione Affine
A4 = [  0    0 ;   0   .16];                 % Definiamo Matirce per la Quarta Trasformazione (che non è un'affinità)
% Definisce un menu di scelta per la visualizzazione delle Traformazioni Affini oppure della Felce intera
scelta=menu('','Prima Operazione','Seconda Operazione','Terza Operazione','Quarta Operazione','Figura Intera','Chiudi');
% Inizio del ciclo WHILE
while ~get(stop,'value') % Finchè non viene premuto il tasto di stop
    r = rand; % r e' un numero casuale compreso tra 0 e 1
    if r < p(1) % nell' 85% per cento dei casi esegue la Trasformazione A1,b1 disegnando la parte alta della felce
      x = A1*x + b1; 
      elseif r < p(2) % nel 7% per cento dei casi esegue la trasformazione A2,b2 disegnando la parte in basso a destra della felce
            x = A2*x + b2; 
        elseif r < p(3) % nel 7% per cento dei casi esegue la trasformazione A3,b3 disegnando la parte in basso a sinistra della felce
               x = A3*x + b3; 
           else
               x = A4*x; % nell' 1% per cento dei casi esegue la trasformazione A4 disegnando lo stelo della  felce
           end % Termina il cilco WHILE

    v1=A1*x+b1; % Attribuisce a v1 ascissa e ordinata calcolati;
    v2=A2*x+b2; % Attribuisce a v2 ascissa e ordinata calcolati;    
    v3=A3*x+b3; % Attribuisce a v3 ascissa e ordinata calcolati;
    v4 = A4*x;  % Attribuisce a v4 ascissa e ordinata calcolati;     
  switch scelta % Costrutto SWITCH per la selezione di una scelta da menu
  case 1
       set(h,'xdata',v1(1),'ydata',v1(2)); % Cambia le coordinate di h nel nuovo punto (v1(1), v1(2) )
       s=sprintf('La Prima Trasformazione Affine crea l''85%% della Felce'); % Stampa stringa s
  case 2
       set(h,'xdata',v2(1),'ydata',v2(2)); % Cambia le coordinate di h nel nuovo punto (v2(1), v2(2) )
       s=sprintf('La Seconda Trasformazione Affine crea il 7%% della Felce'); % Stampa stringa s
  case 3
       set(h,'xdata',v3(1),'ydata',v3(2)); % Cambia le coordinate di h nel nuovo punto (v3(1), v3(2) )
       s=sprintf('La Terza Trasformazione Affine crea il 7%% della Felce'); % Stampa stringa s
  case 4
       set(h,'xdata',v4(1),'ydata',v4(2)); % Cambia le coordinate di h nel nuovo punto (v4(1), v4(2) )
       s=sprintf('La Quarta Trasformazione Affine crea l''1%% della Felce ovvero il gambo'); % Stampa stringa s
  case 5
       set(h,'xdata',x(1),'ydata',x(2)); % Cambia le coordinate di h nel nuovo punto (x(1), x(2) )
       s=sprintf('L''unione delle 4 Trasformazioni Affini genera la Felce'); % Stampa stringa s
  otherwise % Ultima possibilità di scelta
     close all; % chiudi tutto
  return; % interrompe l'esecuzione del ciclo e torna alla function
 end % Termina Costrutto SWITCH
 drawnow % Disegna il punto h
end
text(-2.5,-0.5,s,'fontweight','bold'); % Definisce posizione e grassetto per i testi stampati alla fine di ogni schermata
set(stop,'style','pushbutton','string','Menu','callback','felce') % Modifica le caratteristiche del tasto di Stop!
                                                                                              % rendendolo un tasto che richiama il Menu  
