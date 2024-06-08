function c=scatola_frattale2(p)
%   e' una variante della function fern di Moler
%   per l'implementazione della spugna di Sierpinski. 

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

%  la function calcola inoltre una stima della distribuzione  
%  di probabilità utilizzata per la scelta della trasformazione
%  mediante il rapporto tra il numero di punti generati nel  
%  quadrato i-esimo e il numero di punti generati in totale.


if nargin==0|(length(p) ~= 5) 
p  = [ .2 .4 .6 .8  1];
end

shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Scatola frattale - 2')
x = [0; 0];
h = plot(x(1),x(2),'.');
darkgreen = [0 2/3 0];
set(h,'markersize',1,'color',darkgreen,'erasemode','none');
axis([0 1 -0.5 1])
axis off
stop = uicontrol('style','toggle','string','stop', ...
   'background','white');
drawnow

A1 = [ 1/3  0; 0 1/3];  b1 = [0; 0];
A2 = A1;  b2 = [2/3; 0];
A3 = A1;  b3 = [1/3; 1/3];
A4 = A1;  b4 = [0; 2/3];
A5 = A1;  b5= [2/3 ; 2/3];

cnt = 1;
n=1;
c1=0;   % punti generati nel quadrato 1
c2=0;   % punti generati nel quadrato 2
c3=0;   % punti generati nel quadrato 3
c4=0;   % punti generati nel quadrato 4
c5=0;   % punti generati nel quadrato 5

k=1
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
    elseif r < p(4)
    x = A4*x + b4;
    % nel p(5)-p(4)% per cento dei casi si esegue la trasformazione A5,b5
    else
    x = A5*x+b5;
    end
    if cnt==100000
    darkred = [1 0 0];
    set(h,'markersize',1,'color',darkred,'erasemode','none');
    k=p(4);
    end
   if cnt==200000
    darkblue = [0 0 1];
    set(h,'markersize',1,'color',darkblue,'erasemode','none');
    k=p(3);
    end
   set(h,'xdata',x(1),'ydata',x(2));
   drawnow
   cnt = cnt + 1;

   if(norm(x-1/6,inf) <=1/6)
    % in tal caso x è nel quadrato 1 
    c1=c1+1;
    elseif(norm(x-[1/6;5/6],inf) <=1/6)
    % in tal caso x è nel quadrato 2 
    c2=c2+1;
    elseif(norm(x-5/6,inf) <=1/6)
    % in tal caso x è nel quadrato 3 
    c3=c3+1;
    elseif(norm(x-[5/6;1/6],inf) <=1/6)
    % in tal caso x è nel quadrato 4 
    c4=c4+1;
    elseif(norm(x-1/2,inf) <=1/6)
    % in tal caso x è nel quadrato 5 
    c5=c5+1;
    end
end
set(stop,'style','pushbutton','string','close','callback','close(gcf)')

c1/cnt
c2/cnt
c3/cnt
c4/cnt
c5/cnt
c=[c1 c2 c3 c4 c5]