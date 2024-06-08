function felce_frattale2(p)

%   e' una variante della function fern di Moler
%   per l'implementazione della felce frattale in 
%   Michael Barnsley, Fractals Everywhere, Academic Press, 1993.
%   la function non si ferma autonomamente, ma e' necessario premere sul
%   bottone stop

%   la function riceve opzionalmente in input il vettore di probabilità p
%    dove p(i)-p(i-1) indica la probabilità che si verifichi trasformazione i-esima 
%   (per convenzione p(0)=0)

%   La figura frattale generata (senzo lo stelo) è autosimile 
%   a ognuna delle 3 sottofigure che la compongono. 
%   Queste 3 figure sono 
%   -la felce in basso a sinistra, ottenibilie mediante 
%    la trasformazione T2  (A2,b2)
%   -la felce in basso a destra, ottenibile mediante 
%    la trasformazione T3  (A3,b3)
%   -la felce ottenuta dalla grande escludendo queste due
%    ottenibile mediante la trasformazione T1 (A1,b1)

%  La trasformazione T4 (A4,b4) è introdotta per riprodurre 
%  lo stelo, ma non è una affinità.

%  Una approssimazione della felce è 
%  ottenuta plottando una successione x(k) di punti con 
%                   x(k)= T (x(k-1)) 
%  e con T scelta in modo casuale tra le 4 possibili trasformazioni 

%  Se la probabilità di ogni traformazione è non nulla 
%  allora la successione genera con probabilità 1 una fugura densa 
%  nella figura frattale. Se il numero di punti è sufficientemente 
%  grande (dipendentemente dalla dimensione dell'immagine) 
%  l'effetto visivo ottenuto è quello di una figura praticamente 
%  identica a quella frattale (limite).


if nargin==0|(length(p) ~= 4) 
p  = [ 0.85 .92  0.99 1.00];
end

shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Felce frattale colorata')
x = [.5; .5];
h = plot(x(1),x(2),'.');
darkgreen = [0 2/3 0];
set(h,'markersize',1,'color',darkgreen,'erasemode','none');
axis([-3 3 0 10])
axis off
stop = uicontrol('style','toggle','string','stop', ...
   'background','white');
drawnow

p  = [ .85  .92  .99  1.00];
A1 = [ .85  .04; -.04  .85];  b1 = [0; 1.6];
A2 = [ .20 -.26;  .23  .22];  b2 = [0; 1.6];
A3 = [-.15  .33;  .26  .24];  b3 = [0; .44];
A4 = [  0    0 ;   0   .16];  b4=   [0;0];

cnt = 1;
k=1;
while ~get(stop,'value')
    r = k*rand;
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
    else 
    x = A4*x + b4;
    end
   if cnt==50000
    darkblue = [0 0 1];
    set(h,'markersize',1,'color',darkblue,'erasemode','none');
    k=p(3);
    end
   if cnt==150000
    darkred = [1 0 0];
    set(h,'markersize',1,'color',darkred,'erasemode','none');
    k=p(2);
    end
   set(h,'xdata',x(1),'ydata',x(2));
   drawnow
   cnt = cnt + 1;
end
set(stop,'style','pushbutton','string','chiudi','callback','close(gcf)')
