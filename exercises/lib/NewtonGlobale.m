  function radice = NewtonGlobale(funzione,derivata,a,b,delta_ass,res_ass,kmax)
% risoluzione dell'equazione f(x)=0 mediante metodo ibrido Newton-bisezione
% input: 
%   funzione    puntatore (handle) alla function 
%               che definisce f(x)
%   derivata    puntatore (handle) alla function 
%               che definisce f'(x)
%   a           estremo sinistro di un intervallo che contiene la soluzione
%   b           estremo destro di un intervallo che contiene la soluzione
%   delta_ass   reale non negativo; il massimo errore assoluto 
%               richiesto sul risultato
%   res_ass     reale non negativo; il massimo residuo assoluto 
%               richiesto sul risultato
%   kmax        intero, massimo numero di iterazioni
% output:
%   radice
%
   fa  = funzione(a);
   fb  = funzione(b);
   if fa*fb>0
      disp(' Intervallo non contenente la soluzione')
	  return
   end
   x   = (a+b)/2;
   fx  = funzione(x);
   fpx = derivata(x);
   disp(sprintf('%20.15f  %20.15f    %20.15f',a,x,b))
   
   k = 1;
   while (abs(a-b) > delta_ass+eps*max(abs(a),abs(b)) && (abs(fx) > res_ass) && k <= kmax)
      %[a,b] contiene una radice e x = a o x = b.
      if appross_in_ab(x,fx,fpx,a,b)
	      % si effettua un passo di Newton 
		  disp('Newton')
	      x   = x-fx/fpx;
	  else
	      %si effettua un passo di Bisezione
		  disp('Bisezione')
		  x = (a+b)/2;
	  end
      fx  = funzione(x);
      fpx = derivata(x); 
	  k = k+1;  
      if fa*fx<=0
	     % radice in [a,x]
         b  = x; 
		 fb = fx;
      else
	     % radice in [x,b]
         a  = x; 
		 fa = fx;
      end 
	  disp(sprintf('%20.15f  %20.15f    %20.15f',a,x,b))
   end
   radice = x;
 

