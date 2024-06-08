function fai_ciao( P,nciao ,fig)
% riceve in input P contente i punti da ruotare
%   ,il num. di ciao richiesti ed il numero della figura
% dove svolgere la rotazione
% ogni iterazione del ciclo for
% svolge le rotazioni necessarie per far fare alla mano
% un ciao completo(la mano parte perpendicolare e ritorna perpendicolare)
% pi/6 positivo fara fare ad anim_rot() 3 rotazioni antiorarie
% nella figura fig
% -pi/6 invece ne fara fare 3 orarie

PF=P;

for k=1:nciao


PF = anim_rot(PF,pi/6,3,fig);
PF = anim_rot(PF,-pi/6,3,fig);
PF = anim_rot(PF,-pi/6,3,fig);
PF = anim_rot(PF,pi/6,3,fig);


end


end

