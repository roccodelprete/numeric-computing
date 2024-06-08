function felce_frattale_det
%   e' una variante della function fern di Moler
%   per l'implementatzone della felce frattale in 
%   Michael Barnsley, Fractals Everywhere, Academic Press, 1993.
%   la function non si ferma autonomamente, ma e' necessario premere sul
%   bottone stop

%  la trasformazione T_i trasforma un punto arbitrario della felce
%  in un punto delle felci più piccole. Una approssimazione della figura 
%  è ottenuta plottando l'insieme di  punti A_k con 
%         A_k=T_1(A_k-1) U ... T_M(A_k-1) 
%  dove T_i sono tutte le possibili trasformazioni.


shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Felce frattale senza stelo')
x = rand(2,1);
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
A3 = [-.15  .28;  .26  .24];  b3 = [0; .44];
% A4 = [  0    0 ;   0   .16];


k=10;
% generazione dei 4^k punti 
%    x=[x A1*x+b1 A2*x+b2 A3*x+b3 A4*x];  
    c=-1/3;
while ~get(stop,'value')
    x=[x A1*x+b1 A2*x+b2 A3*x+b3];  
for m=1:k-1
    b1=repmat(b1,1,4);
    b2=repmat(b2,1,4);
    b3=repmat(b3,1,4);
%    x=[x A1*x+b1 A2*x+b2 A3*x+b3 A4*x];  
     x=[x A1*x+b1 A2*x+b2 A3*x+b3];  
end
c=-c;
darkgreen = [0 2/3+c/2 0];
set(h,'markersize',1,'color',darkgreen,'erasemode','none');
set(h,'xdata',x(1,:),'ydata',x(2,:));
   drawnow

b1 = [0; 1.6];
b2 = [0; 1.6];
b3 = [0; .44];
x=x(:,floor(4^10*rand))
end
set(stop,'style','pushbutton','string','close','callback','close(gcf)')



