function x=SGauss(A,b)
% risoluzione di un sistema di eq.
% lineari con il metodo di Gauss
%  (senza pivoting)
%  input:
%    A   matrice dei coefficienti
%        (inalterata in output)
%    b   vettore dei termini noti 
%        (inalterato in output)
% output:
%    x   soluzione 
%
 [A,b] = TriangGauss(A,b);
 x = STriangSup(A,b);