% script di rotazione completa di un poligono P
for t=teta
  R=[cos(t) sin(t); -sin(t) cos(t)];
  Pruotati= R*P;
  clf, shg
  plot(Pruotati(1,:),Pruotati(2,:))
  axis([-2 2 -2 2])
  axis equal
  shg
end