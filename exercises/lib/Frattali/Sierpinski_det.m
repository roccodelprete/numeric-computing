% script Sierpinski_det
%
% creazione del Triangolo frattale di Sierpinski.
% NB: l'esecuzione non si ferma autonomamente, ma e'
% necessario premere sul bottone stop per arrestarla.

%   La figura frattale generata è autosimile a ognuna delle 3 sottofigure 
%   che la compongono. Ognuna di queste è contenuta in un triangolo
%   Denotiamo 
%   con 1 la parte di figura nel triangolo in basso a sinistra,
%   con 2 la parte di figura nel triangolo in basso a destra,
%   con 3 la parte di figura nel triangolo in alto.

%  la trasformazione T_i trasforma un punto arbitrario della figura 
%  in un punto mel triangolo i. Una approssimazione della figura è 
%  ottenuta plottando l'insieme di  punti A_k con 
%         A_k=T_1(A_k-1) U ... T_M(A_k-1) 
%  dove T_i sono tutte le possibili trasformazioni.


shg
clf reset
% il commando set definisce le proprietà dell’oggetto
% grafico gcf (nome standard della figura corrente in Matlab)
set(gcf,'color','white','menubar','none', ...
'numbertitle','off','name','Triangolo di Sierpinski')
x = [0; 0];
% h è l’handle (puntatore) di un oggetto grafico, in questo
% caso un punto
h = plot(x(1),x(2),'.');
% definisce il vettore dei colori (componenti RGB)
darkgreen = [0 2/3 0];
% modifica alcune proprietà dell’oggetto grafico h
set(h,'markersize',1,'color',darkgreen,'erasemode','none');
axis([0 1 0 1])
axis off
% crea un oggetto grafico di tipo bottone, il cui
% handle è stop
stop = uicontrol('style','toggle','string','ferma', ...
'background','white');
drawnow
% matrice e vettori delle trasformazioni affini che generano
% il Triangolo frattale di Sierpinski
A = [ .5 0; 0 .5];
b1 = [0; 0];
b2 = [.5; 0];
b3 = [.25; sqrt(3)/4];

k=10;
% generazione dei 3^k punti 
    x=[x A*x+b1 A*x+b2 A*x+b3];  
for m=1:k-1
    b1=repmat(b1,1,4);
    b2=repmat(b2,1,4);
    b3=repmat(b3,1,4);
    x=[x A*x+b1 A*x+b2 A*x+b3]; 
end
clear b1 b2 b3 b4 
while ~get(stop,'value')
    set(h,'xdata',x(1,:),'ydata',x(2,:));
   drawnow
end
set(stop,'style','pushbutton','string','close','callback','close(gcf)')

