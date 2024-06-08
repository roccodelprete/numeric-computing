% SCRIPT IntGolfo.m
% visualizzazione del contorno del golfo di 
% Napoli,ottenuto mediante interpolazione con spline dei
% dati contenuti nello script Golfo.m
%
clf;
% le ascisse e le ordinate dei punti sul contorno
% sono generati nello script seguente e memorizzati
% in xgolf e ygolfo, rispettivamente
Golfo;
t=1:length(xgolfo);
tt=1:.25:length(xgolfo);
% le ascisse vengono interpolate con una spline cubica
xintspl=spline(t,xgolfo,tt);
% le ordinate vengono interpolate con una spline cubica
yintspl=spline(t,ygolfo,tt);
plot(xgolfo,ygolfo,'o')
axis([-1 45 -1 40])
hold on
pause
% visualizzazione del grafico relativo all'insieme 
% delle ascisse e delle ordinate interpolate
plot(xintspl,yintspl)
pause
% le ascisse e le ordinate vengono approssimate con un polinomio
% di quinto grado nel senso dei minimi quadrati
xappol=polyval(polyfit(t,xgolfo,5),tt);
yappol=polyval(polyfit(t,ygolfo,5),tt);
% visualizzazione del grafico relativo all'insieme 
% delle ascisse e delle ordinate approssimate
plot(xappol,yappol)
hold off

