% script esercizio 6 - 2011
% Disegnare una griglia quadrata.
x0 = input('ascissa (e ordinata) del vertice in basso a destra: '); 
y0 = x0; 
s = input('passo di griglia: ');
n = input('dimensione della griglia: ');
figure(1); hold on;
for k = 1:n+1
    % segmenti orizzontali
    ascisse=[x0 x0+n*s]; ordinate = [y0+(k-1)*s y0+(k-1)*s];
    plot(ascisse, ordinate)
    % segmenti verticali
    plot(ordinate,ascisse)
end
for k = 1:n
    % segmenti con pendenza 1
    ascisse=[x0 x0+k*s]; ordinate = [y0+k*s y0];
    plot(ascisse, ordinate)
    ascisse=[x0+k*s x0+n*s]; ordinate = [y0+n*s y0+k*s];
    plot(ascisse, ordinate)
    % segmenti con pendenza -1
    ascisse=[x0+k*s x0+n*s]; ordinate = [y0 y0+(n-k)*s];
    plot(ascisse, ordinate)
    plot(ordinate,ascisse)
end
ascisse=[x0 x0+n*s]; ordinate=[y0 y0+n*s];
plot(ascisse, ordinate)
hold off

