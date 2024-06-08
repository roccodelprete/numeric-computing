% script animPFisso per generare l'animazione del metodo di punto fisso
% richiede di fissare un valore di xniz nella finestra comandi.
%
% usa f3, 
%
x=linspace(0,4.3,100); y=f3(x); 
plot(x,y)
hold on
plot([0 4.5],[0 4.5],'k')
axis([0 5 0 4.5])
xprec=xiniz;
for k=1:4
    xsucc=f3(xprec);pause;
    plot([xprec xprec],[0 f3(xprec)],'r',...
        [xprec],[f3(xprec)],'b.',...
        [xprec xsucc],[f3(xprec) f3(xprec)],'r')
    xprec=xsucc;
end
hold off