function Y=Visualizza_vettori3D(X)
% visualizza i vettori colonna (di 3 componenti) della matrice X di due
% colonne (lol 1 in blu, col 2 in rosso)
hold on
plot3([0 X(1,1)],[0 X(2,1)],[0 X(3,1)],'b')
plot3([0 X(1,2)],[0 X(2,2)],[0 X(3,2)],'r')
axis([min(0,min(X(1,:))) max(2,max(X(1,:))) ...
    min(0,min(X(2,:))) max(2,max(X(2,:)))...
    min(0,min(X(3,:))) max(2,max(X(3,:)))])
grid
xlabel('asse x')
ylabel('asse y')
zlabel('asse z')
hold off