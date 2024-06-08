%script di verifica della formula di fibonacci in termini di golden ratio
phi = (1+sqrt(5))/2;
fib2=0; fib1=1;
for i=2:15
     fib=fib1+fib2; fib2=fib1; fib1=fib;
     fibcalc=(phi^i-(1-phi)^i)/sqrt(5);
     disp([i,fib,fibcalc])
end