function xsucc=passoNewton(funzione,derivata,xk)
% esegue un passo del  metodo di Newton
% mediante metodo di Newton
fxk=feval(funzione,xk);
fprimoxk=feval(derivata,xk);
correzionek=fxk/fprimoxk;
xsucc=xk-correzionek;