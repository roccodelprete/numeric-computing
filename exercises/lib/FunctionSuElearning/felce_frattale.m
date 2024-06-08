function felce_frattale
%   e' una variante della function fern di Moler
%   per l'implementatzone della felce frattale in 
%   Michael Barnsley, Fractals Everywhere, Academic Press, 1993.
%   la function non si ferma autonomamente, ma e' necessario premere sul
%   bottone stop


shg
clf reset
set(gcf,'color','white','menubar','none', ...
   'numbertitle','off','name','Fractal Fern')
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
A3 = [-.15  .28;  .26  .24];  b3 = [0; .44];
A4 = [  0    0 ;   0   .16];

cnt = 1;
tic
while ~get(stop,'value')
    r = rand;
    % nell' 85% per cento dei casi esegue la trasformazione A1,b1
    if r < p(1)
      x = A1*x + b1;
     % nel 7% per cento dei casi esegue la trasformazione A2,b2
     elseif r < p(2)
            x = A2*x + b2;
        % nel 7% per cento dei casi esegue la trasformazione A3,b3
        elseif r < p(3)
               x = A3*x + b3;
           % nell' 1% per cento dei casi esegue la trasformazione A4
           else
               x = A4*x;
      end
   set(h,'xdata',x(1),'ydata',x(2));
   drawnow
   cnt = cnt + 1;
end
t = toc;
s = sprintf(' generati %8.0f punti, in %6.3f secondi',cnt,t);
text(-1.5,-0.5,s,'fontweight','bold');
set(stop,'style','pushbutton','string','close','callback','close(gcf)')
