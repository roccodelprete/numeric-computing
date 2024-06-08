function x=Sgauss_pivot(A,b)
% risoluzione di un sistema di eq.
% lineari con il metodo di Gauss
% (con pivoting parziale)
%  input:
%    A   matrice dei coefficienti
%        (inalterata in output)
%    b   vettore dei termini noti 
%        (inalterato in output)
% output:
%    x   soluzione 
%
 [A,b] = TriangGauss_pivot(A,b);
 x = STriangSup(A,b);