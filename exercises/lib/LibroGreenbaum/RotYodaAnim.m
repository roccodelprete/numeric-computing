% script RotYodaAnim
% Mostra una animazione della rotazione di Yoda 
% da zero fino a un angolo fissato in input
% compreso tra 0 e (7/10)*pi radianti
teta=input('inserire angolo di rotazione (0 < teta < 0.7*pi): ');
if teta<0 || teta > 0.7*pi
    disp('attenzione: angolo di rotazione errato');
    return;
end
load yodapose_low
% Yoda centrato nell'origine
medie=mean(V);
V0=V-ones(size(V,1),1)*medie;
Vt0 = V0;
figure(1)
patch('Vertices',Vt0,'Faces',F3,'FaceColor',[.76 .87 .78]);
patch('Vertices',Vt0,'Faces',F4,'FaceColor',[.76 .87 .78]);
axis tight equal vis3d
drawnow
cla
slides=20;
t=linspace(0,teta,slides);
for i=1:slides
    R=[cos(t(i)) 0 -sin(t(i)); 0 1 0; sin(t(i)) 0 cos(t(i))];
    Vt1=R*V0'; Vt1=Vt1';
    cla
    patch('Vertices',Vt1,'Faces',F3,'FaceColor',[.76 .87 .78]);
    patch('Vertices',Vt1,'Faces',F4,'FaceColor',[.76 .87 .78]);
    axis tight equal vis3d
    drawnow
end