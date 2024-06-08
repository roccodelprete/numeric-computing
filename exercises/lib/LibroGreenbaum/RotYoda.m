% script RotYoda
% ruota attorno a y (asse verticale) Yoda di un angolo fissato in input
% compreso tra 0 e (7/10)*pi radianti
teta=input('inserire angolo di rotazione (0 < teta < 0.7*pi): ');
if teta<0 || teta > 0.7*pi
    disp('attenzione: angolo di rotazione errato');
    return;
end
load yodapose_low
% Yoda originale
figure(1)
patch('Vertices',V,'Faces',F3,'FaceColor',[.76 .87 .78]);
patch('Vertices',V,'Faces',F4,'FaceColor',[.76 .87 .78]);
axis tight equal vis3d
drawnow
%
% Yoda centrato nell'origine
medie=mean(V);
V0=V-ones(size(V,1),1)*medie;
Vt0 = V0;
figure(2)
patch('Vertices',Vt0,'Faces',F3,'FaceColor',[.76 .87 .78]);
patch('Vertices',Vt0,'Faces',F4,'FaceColor',[.76 .87 .78]);
axis tight equal vis3d
drawnow
%
% Yoda ruotato centrato nell'origine
R=[cos(teta) 0 -sin(teta); 0 1 0; sin(teta) 0 cos(teta)];
Vt1=R*V0'; Vt1=Vt1';
figure(3)
patch('Vertices',Vt1,'Faces',F3,'FaceColor',[.76 .87 .78]);
patch('Vertices',Vt1,'Faces',F4,'FaceColor',[.76 .87 .78]);
axis tight equal vis3d
drawnow