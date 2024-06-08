function scatola_frattale(p)

%   e' una variante della function felce_frattale 
%   per l'implementazione della scatola frattale.
%   la function non si ferma autonomamente, ma e' necessario premere sul
%   bottone stop

%   la function riceve opzionalmente in input il vettore di probabilità p
%    dove p(i)-p(i-1) indica la probabilità che si verifichi trasformazione i-esima 
%   (per convenzione p(0)=0)

%   La figura frattale generata è autosimile a ognuna delle 5 sottofigure che la
%   compongono. Ognuna di queste è contenuta in un quadrato. Denotiamo 
%   con 1 il quadrato in basso a sinistra,
%   con 2 il quadrato in alto a sinistra,
%   con 3 il quadrato in alto a destra,
%   con 4 il quadrato in basso a destra,
%   con 5 il quadrato al centro.

%  la trasformazione T_i trasforma un punto arbitrario della figura 
%  in un punto del quadrato i. Una approssimazione della figura è 
%  ottenuta plottando una successione x(k) di punti con 
%                   x(k)= T (x(k-1)) 
%  e con T scelta in modo casuale tra le 5 possibili trasformazioni 
%
%  Se la probabilità di ogni traformazione è non nulla 
%  allora la successione genera con probabilità 1 una fugura densa 
%  nella figura frattale. Se il numero di punti è sufficientemente 
%  grande (dipendentemente dalla dimensione dell'immagine) 
%  l'effetto visivo ottenuto è quello di una figura praticamente 
%  identica a quella frattale (limite).



if nargin==0|(length(p) ~= 5) 
p  = [ .2 .4 .6 .8  1];
end

shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Scatola frattale')
x = [0; 0];
h = plot(x(1),x(2),'.');
darkgreen = [0 2/3 0];
set(h,'markersize',1,'color',darkgreen,'erasemode','none');
axis([0 1 -0.5 1])
axis off
stop = uicontrol('style','toggle','string','stop', ...
   'background','white');
drawnow

% trasformazione del piano A1,b1:   
%                      omotetia di centro (0,0) e rapporto 1/3
A1 = [ 1/3  0; 0 1/3];  b1 = [0; 0];

% trasformazione del piano A2,b2:   composizione tra  
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione mediante il vettore [0; 2/3].
A2 = A1;  b2 = [0; 2/3];

% trasformazione del piano A3,b3:   composizione tra  
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione mediante il vettore [2/3; 2/3].
A3 = A1;  b3= [2/3 ; 2/3];

% trasformazione del piano A4,b4:   composizione tra  
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione mediante il vettore [2/3; 0].
A4 = A1;  b4 = [2/3; 0];

% trasformazione del piano A5,b5:   composizione tra  
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione mediante il vettore [1/3; 1/3].
A5 = A1;  b5 = [1/3; 1/3];

cnt = 1;
n=1;

tic
while ~get(stop,'value')
    r = rand;
    % nel p(1)% per cento dei casi si esegue la trasformazione A1,b1
    if r < p(1)
    x = A1*x + b1;
    % nel p(2)-p(1)% per cento dei casi si esegue la trasformazione A2,b2
    elseif r < p(2)
    x = A2*x + b2;
    % nel p(3)-p(2)% per cento dei casi si esegue la trasformazione A3,b3
    elseif r < p(3)
    x = A3*x + b3;
    % nel p(4)-p(3)% per cento dei casi si esegue la trasformazione A4,b4
    elseif r < p(4)
    x = A4*x + b4;
    % nel p(5)-p(4)% per cento dei casi si esegue la trasformazione A5,b5
    else
    x = A5*x+b5;
    end
    set(h,'xdata',x(1),'ydata',x(2));
    drawnow
    cnt = cnt + 1;
end
set(stop,'style','pushbutton','string','close','callback','close(gcf)')
t = toc;
s = sprintf(' generati %8.0f punti, in %6.3f secondi',cnt,t);
text(0,0.5,s,'fontweight','bold');
set(stop,'style','pushbutton','string','chiudi','callback','close(gcf)')
