function [x,y]= CamminoCasuale(n)
% Cammino casuale 2D di un robot. Il robot si ferma se il valore assoluto
% di una delle sue coordinate è uguale a n.
cont=0;
xc=0; yc=0;
while abs(xc)<n && abs(yc)<n
    %il robot si trova in xc,yc e compie un passo casuale
    r=rand(1);
    if r<=0.25 % passo verso N
        yc=yc+1;
    elseif r<=0.50 % passo verso E
        xc=xc+1;
    elseif r<=0.75 % passo verso S
        yc=yc-1;
    else % passo verso W
        xc=xc-1;
    end
    cont=cont+1; x(cont)=xc; y(cont)=yc;
end
plot(x(1),y(1),'s',x,y,'.',x(end),y(end),'d')
axis([-n-1 n+1 -n-1 n+1])