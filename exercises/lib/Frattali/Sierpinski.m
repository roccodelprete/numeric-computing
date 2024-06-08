% script Sierpinski
%
% creazione del Triangolo frattale di Sierpinski.
% NB: l'esecuzione non si ferma autonomamente, ma e'
% necessario premere sul bottone stop per arrestarla.
%
% crea e visualizza una finestra grafica con proprietà
% di default
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

cnt = 1;
tic
while ~get(stop,'value')
 r = fix(rand*3);

 if r == 0
    x = A*x + b1;

  elseif r == 1
    x = A*x + b2;

    elseif r == 2
      x = A*x + b3;
 end
 set(h,'xdata',x(1),'ydata',x(2));
 drawnow
 cnt = cnt + 1;
end
t = toc;
s = sprintf(' generati %8.0f punti, in %6.3f secondi',cnt,t);
text(0,1,s,'fontweight','bold');
% cambia alcune proprietà dell’oggetto stop (che diventa un
% bottone di chiusura)
set(stop,'style','pushbutton','string','chiudi','callback','close(gcf)')
