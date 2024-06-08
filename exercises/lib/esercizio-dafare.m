M =[    13    11    14    14
        14     5    14     9
        6     7     6    13
        14    10    14     6];
vett =[0.6023 0.4876 0.3745 0.5091]';
n=10;
x=ones(4,1);
for i=1:n
     x=M*x/norm(x);
     simiglianza(i)=x'*vett/(norm(x)*norm(vett));
end
semilogy(simiglianza)
