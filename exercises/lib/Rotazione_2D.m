function PR = Rotazione_2D( P,teta )
% se la rotazione è oraria teta < 0
%   Restituisce array punti ruotati
% np è il numero di punti
% P è 2 x num.punti
% se in P ci sono almeno 2  punti ed il primo è uguale all'ultimo
% allora diminuisco il numero di punti di 1
% (non faccio contare l'ultimo nel calcolo della media perche 
% serve solo per visualizzare la curva chiusa)



np= size(P,2);

if np > 1 && norm(P(:,1),2) == norm(P(:,end),2)
 np=np-1;
end


if size(P,1) ~= 2
    
    disp('dimensione non compatibile');
    return;
end


if teta < 0
  
    teta= abs(teta);
  
    R=[cos(teta) sin(teta);
       -sin(teta) cos(teta)]; 
   
   
   
else
    
     R=[cos(teta) -sin(teta);
       sin(teta) cos(teta)];
   
end 

   % centro il poligono
   
 % se il numero di punti passati è 1 allora è applicato
 % nell'origine e non serve centrarlo
 
   if size(P,2) > 1
       
   cx = mean(P(1,1:np) );
   cy = mean(P(2,1:np) );
   
   P(1,:) = P(1,:) - cx;
   P(2,:) = P(2,:) - cy;
   end
   
   PR= R*P;
   
   
   
   
end

