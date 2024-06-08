function x_t=visualizza_trasf_affine(x,A,b)
% visualizza nel piano il vettore x e il vettore x_t ottenuto
% mediante la trasformazione affine x_t=A*x+b
x_t=A*x+b;
plot([0,x(1)],[0,x(2)],'k.-',[0,x_t(1)],[0,x_t(2)],'b',x(1),x(2),'o',x_t(1),x_t(2),'s')
grid on
axis on
% axis([-1.3*min([0,x(1),x_t(1)]) 1.3*max([0,x(1),x_t(1)]) -1.3*min([0,x(2),x_t(2)]) 1.3*max([0,x(2),x_t(2)]) ])
