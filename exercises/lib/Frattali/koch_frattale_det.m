function koch_frattale_det

%   e' una variante della function felce_frattale 
%   per l'implementazione della curva di kock.
%
%   la function non si ferma autonomamente, ma e' necessario premere sul
%   bottone stop

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
%  ottenuta plottando l'insieme di  punti A_k con 
%         A_k=T_1(A_k-1) U ... T_M(A_k-1) 
%  dove T_i sono tutte le possibili trasformazioni.


if nargin==0|(length(p) ~= 4) 
p  = [ 0.25 .50  0.75 1.00];
end

shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Curva di Koch')
x = [0; 0];
h = plot(x(1),x(2),'.');
darkgreen = [0 2/3 0];
set(h,'markersize',1,'color',darkgreen,'erasemode','none');


axis([0 1 0 .5])
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

a=4*pi/3;
c=cos(a); s=sin(a);
A3 = [ c -s  ; -s -c]/3;
b3 = [2/3; 0];

% trasformazione del piano A4,b4:   composizione tra  
%                      un'omotetia di centro (0,0) e rapporto 1/3, 
%                      e una traslazione a destra di 2/3.

A4 = [ 1/3  0 ; 0 1/3 ];  b4 = [2/3; 0];



k=8;
% generazione dei 5^k punti 
    x=[x A1*x+b1 A2*x+b2 A3*x+b3 A4*x+b4];  
for m=1:k-1
    b1=repmat(b1,1,5);
    b2=repmat(b2,1,5);
    b3=repmat(b3,1,5);
    b4=repmat(b4,1,5);
    x=[x A1*x+b1 A2*x+b2 A3*x+b3 A4*x+b4];  
end
clear b1 b2 b3 b4 
while ~get(stop,'value')
    set(h,'xdata',x(1,:),'ydata',x(2,:));
   drawnow
end
set(stop,'style','pushbutton','string','close','callback','close(gcf)')

