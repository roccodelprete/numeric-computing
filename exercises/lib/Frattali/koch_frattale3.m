function koch_frattale3(p)

%   seconda variante della curva di Kock  
%   la function non si ferma autonomamente, 
%   ma e' necessario premere sul
%   bottone stop

%   questa function differisce dalla prima per 
%   la terza e la quarta trasformazione

%   la function riceve opzionalmente in input il vettore di probabilità p
%    dove p(i)-p(i-1) indica la probabilità che si verifichi trasformazione i-esima 
%   (per convenzione p(0)=0)

%   La figura frattale generata è autosimile a ognuna delle 4 sottofigure 
%   che la compongono. Ognuna di queste è contenuta in un segmento
%   Denotiamo 
%   con 1 la parte di figura nel segmento orizzontale di sinistra,
%   con 2 la parte di figura nel segmento obliquo di sinistra,
%   con 3 la parte di figura nel segmento obliquo di destra,
%   con 4 la parte di figura nel segmento orizzontale di destra,

%  la trasformazione T_i trasforma un punto arbitrario della figura 
%  in un punto del segmento i. Una approssimazione della figura è 
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
if nargin==0|(length(p) ~= 4) 
p  = [ 0.25 .50  0.75 1.00];
end

shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Curva di Koch - 3')
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

A1 = [ 1/3  0 ; 0 1/3 ];  b1 = [0; 0];

% trasformazione del piano A2,b2:   composizione tra  
%                      una rotazione antioraria di angolo pi/3
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione a destra di 1/3.

a=pi/3;
c=cos(a); s=sin(a);
A2 = [ c -s  ; s c]/3;
b2 = [1/3; 0];

% trasformazione del piano A3,b3:   composizione tra  
%                      una rotazione antioraria di angolo 4pi/3
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      una simmetria assiale rispetto a y=0 
%                      e una traslazione a destra di 2/3.

a=2*pi/3;
c=cos(a); s=sin(a);
A3 = [ c -s  ; s c]/3;
b3 = [2/3; 0];

% trasformazione del piano A4,b4:   composizione tra  
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione a destra di 2/3.

A4 = [ 1/3  0 ; 0 -1/3 ];  b4 = [2/3; 0];




cnt = 1;
tic
k=p(4);
while ~get(stop,'value')
    r = k*rand;
    if r < p(1)
            % nel p(1)% per cento dei casi si esegue la trasformazione A1,b1
            x = A1*x + b1;
     elseif r < p(2)
            x = A2*x + b2;
     % nel p(2)-p(1)% per cento dei casi si esegue la trasformazione A2,b2
     elseif r < p(3)
            x = A3*x + b3;
            % nel p(3)-p(2)% per cento dei casi si esegue la trasformazione A3,b3
     else
            x = A4*x+b4;
            % nel p(4)-p(3)% per cento dei casi si esegue la trasformazione A4,b4
     end
   if cnt==50000
    darkred = [1 0 0];
    set(h,'markersize',1,'color',darkred,'erasemode','none');
    k=p(3);
    end
   if cnt==100000
    darkblue = [0 0 1];
    set(h,'markersize',1,'color',darkblue,'erasemode','none');
    k=p(2);
    end
   set(h,'xdata',x(1),'ydata',x(2));
   drawnow
   cnt = cnt + 1;
end
t = toc;
s = sprintf(' generati %8.0f punti, in %6.3f secondi',cnt,t);
text(0,0.5,s,'fontweight','bold');
set(stop,'style','pushbutton','string','chiudi','callback','close(gcf)')
