function PF = anim_rot( P,passo,nr,nfig )
% riceve in input i punti P da ruotare
%   il passo(angolo) di ogni rotazione ,
% num. di rotazioni e numero di figura
% il ciclo for parte da zero
% perche non ho voluto fare
% la prima visualizzazione della mano
% fuori dal for
% e quindi la prima volta i punti restituiti saranno gli stessi
% di partenza
% rotazione 2D() sceglie in base al segno di passo
% quale matrice di rotazione usare
% Viene restituito PF con i punti
% dell'ultima posizione della mano dopo le nr rotazioni

figure(nfig)




for k=0:nr

rotp=Rotazione_2D(P,passo*k);


  
     
     
    plot(rotp(1,:),rotp(2,:),'r')
    
    axis([-1  1  -1  2])
    
    axis equal
    
     drawnow expose
  
    
    
end 


PF=rotp;


end

