function y=f2(x)
ind1=find(abs(x)<1); ind2=find(abs(x)>=1);
y(ind1)=ones(size(ind1))./exp(ones(size(ind1))./(1-x(ind1).^2));
y(ind2)=zeros(size(ind2));