% script animNewton per generare l'animazione del metodo di Newton
% richiede di fissare un valore di xniz nella finestra comandi.
%
% usa passoNewton.m, f1, f1primo
%
x=0.2:0.05:2.0; y=f1(x); 
plot(x,y)
axis([0 2.5 -1 2.5])
hold on
plot([0 2.5],[0 0],'k')
%xprec=2.0;
xprec=xiniz;
for k=1:4
    xsucc=passoNewton('f1','f1primo',xprec);pause;
    plot([xsucc xprec],[0 f1(xprec)],'r.',[xsucc xprec],[0 f1(xprec)],'r')
    axis([0 2.5 -1 2.5])
    xprec=xsucc;
end
hold off