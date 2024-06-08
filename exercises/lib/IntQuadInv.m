% La function IntQuadInv calcola una approssimazion dello zero della  funzione
% nella function fun. s e d sono estremo sinistro e 
% estremo destro dell’intervallo che contiene la 
% soluzione. La function IntQuadInv è basata sul metodo
% dell'interpolazione quadratica inversa.

function sol = IntQuadInv (fun,s,d,delta)
 a=s;
 c=d;
 b=(s+d)/2;
 fa=fun(a);
 fb=fun(b);
 fc=fun(c);
 x=[a b c];
 y=[fa fb fc];

while abs(c-b)>(delta+eps*(abs(c)))
  coef=polyfit(y,x,2);
  P0=coef(3);
  a=b;
  b=c;
  c=P0;
  fa = fb;
  fb = fc;
  fc=fun(c);
  x=[a b c];
  y=[fa fb fc]; 
end
sol=coef(3);
end
