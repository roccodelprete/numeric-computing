function lung  = Lunghezza( x,y )
% Lunghezza(x,y) calcola la lunghezza della 
% spezzata di vertici x (ascisse) y (ordinate)
lung = 0;
for i =1:length(x)-1
    lung = lung + sqrt((x(i)-x(i+1))^2+(y(i)-y(i+1))^2);
end
end

