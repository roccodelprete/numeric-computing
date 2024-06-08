function X=SGauss_M(A,B)
% risolve sistemi multipli
% SENZA PIVOTING
%  ....... e' inefficiente .......
n_sistemi=size(B,2);
X=zeros(size(B));
for j=1:n_sistemi
	X(:,j)=SGauss(A,B(:,j));
end