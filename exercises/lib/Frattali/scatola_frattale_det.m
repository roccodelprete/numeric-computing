function scatola_frattale_det
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
%  in un punto del quadrato i. % Una approssimazione della figura è 
%  ottenuta plottando l'insieme di  punti A_k con 
%         A_k=T_1(A_k-1) U ... T_M(A_k-1) 
%  dove T_i sono tutte le possibili trasformazioni.

 

shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Scatola Frattale')
x = [0; 1/3];
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


k=8;
% generazione dei 6^k punti 
    x=[x A1*x+b1 A2*x+b2 A3*x+b3 A4*x+b4 A5*x+b5];  
for m=1:k-1
    b1=repmat(b1,1,6);
    b2=repmat(b2,1,6);
    b3=repmat(b3,1,6);
    b4=repmat(b4,1,6);
    b5=repmat(b5,1,6);
    x=[x A1*x+b1 A2*x+b2 A3*x+b3 A4*x+b4 A5*x+b5];  
end
clear b1 b2 b3 b4 b5 
while ~get(stop,'value')
    set(h,'xdata',x(1,:),'ydata',x(2,:));
   drawnow
end
set(stop,'style','pushbutton','string','close','callback','close(gcf)')


 