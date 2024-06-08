 function ok = appross_in_ab(x,fx,fpx,a,b)
% determina l'appartenenza dell'approssimazione di un passo di Newton o
% selle Secanti all'intervallo [a,b]
% è usata da NewtonGlobale, SecantiGlobale
% input  
%  x     approssimazione corrente della radice
%  fx    valore di f  in x.
%  fpx   valore di f'(o di una sua approssimazione) in x.
%  a,b   [a,b] intervallo che contiene la radice
%
% output
%  ok    1 se la approssimazione di Newton/Secanti x - fx/fxp appartiene a [a,b]
%        0 se la approssimazione di Newton/Secanti x - fx/fxp NON appartiene a
%        [a,b]
%
%  if fpx > 0
%      ok = ((a-x)*fpx <= -fx) & (-fx <= (b-x)*fpx);
%   elseif fpx < 0
%      ok = ((a-x)*fpx >= -fx) & (-fx >= (b-x)*fpx);
%   else
%       ok = 0;
    mi = min([a b]);    ma = max([a b]);
	ok = (mi <= x-fx/fpx) & (x-fx/fpx <= ma);

   end
