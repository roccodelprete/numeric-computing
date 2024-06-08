function y=f1(x)
ind1=find(x>0); ind2=find(x<=0);
y(ind1)=ones(size(ind1))./exp(ones(size(ind1))./x(ind1));
y(ind2)=zeros(size(ind2));
