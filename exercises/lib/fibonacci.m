function y=fibonacci(n)
if n==0 ||n==1
    y=1;
else
    yn1=1; yn2=1;
    for i=2:n
        y=yn2+yn1;
        yn2=yn1; yn1=y;
    end
end    