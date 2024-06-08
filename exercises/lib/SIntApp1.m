% SCRIPT SIntApp1
% genera i valori della funzione sin(x)+ 0.3*sin(2*x)+ 0.2*sin(3*x) su una 
% griglia equispaziata di 12 punti su [-pi,pi]; i valori sono perturbati mediante
% un errore casuale uniforme in [-1,1] di modulo massimo 0.2.
% I valori perturbati sono:
%		interpolati con un polinomio
%		interpolati con una spline cubica
%		interpolati con una spline lineare (spezzata)
%		approssimati con polinomi di grado crescente (1,3,5,7)
%		nel senso dei minimi quadrati
%		approssimati con un polinomio trigonometrico dispari di grado 2,3,4.
n=12;
x=linspace(-pi,pi,n);
y=sin(x)+ 0.3*sin(2*x)+ 0.2*sin(3*x);
x=x';y=y';
ypert=y+0.2*(-1+2*rand(size(y)));
xx=linspace(x(1),x(n),10*n);xx=xx';
yy=sin(xx)+ 0.3*sin(2*xx)+ 0.2*sin(3*xx);
yintpol=polyval(polyfit(x,ypert,n-1),xx);
yintspl=interp1(x,ypert,xx,'spline');
yintlin=interp1(x,ypert,xx,'linear');
subplot(3,1,1)
plot(x,ypert,'o',xx,yy,'k:',xx,yintpol,'r',xx,yintspl,'g',xx,yintlin,'b')
yapppol1=polyval(polyfit(x,ypert,1),xx);
yapppol3=polyval(polyfit(x,ypert,3),xx);
yapppol5=polyval(polyfit(x,ypert,5),xx);
yapppol7=polyval(polyfit(x,ypert,7),xx);
subplot(3,1,2)
plot(x,ypert,'o',xx,yy,'k:',xx,yapppol1,'r',xx,yapppol3,'g',xx,yapppol5,'b',...
   xx,yapppol7,'k')
A=[ones(size(x)) sin(x) sin(2*x)];
coeff=A\y;
AA=[ones(size(xx)) sin(xx) sin(2*xx)];
yapptrig2=AA*coeff;
A=[A sin(3*x)];
coeff=A\y;
AA=[AA sin(3*xx)];
yapptrig3=AA*coeff;
A=[A sin(4*x)];
coeff=A\y;
AA=[AA sin(4*xx)];
yapptrig4=AA*coeff;
subplot(3,1,3)
plot(x,ypert,'o',xx,yy,'k:',xx,yapptrig2,'r',xx,yapptrig3,'b',xx,yapptrig4,'k')

