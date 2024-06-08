% YODA      Load low or high resolution model of Yoda character. 
%           and rotate model about x, y, or z axis. 
%
% Code created by Tim Chartier - June 2006
% Models created by Kecskemeti B. Zoltan.  
% Images courtesy of Lucasfilm LTD.

%% Load the model/tessellation information

load yodapose_low

%% Create initial plot

Vt = V;
clf
patch('Vertices',Vt,'Faces',F3,'FaceColor',[.76 .87 .78]);
patch('Vertices',Vt,'Faces',F4,'FaceColor',[.76 .87 .78]);
axis tight equal vis3d
drawnow

%% Create translation matrix 

slides = 24;

% Create the translation matrix

yMinValue = min(V(:,2,:));  % Find minimum y value in the model
axisValues = axis;          % Get the min and max values on each axis
yAxesMax = axisValues(4);   % Get the upper limit on the y-axis
shift = (yAxesMax - yMinValue)/slides;  % Create a shift that 
                            % will have animation exit axes on last frame
[n,m] = size(V);
T = [zeros(n,1),shift*ones(n,1),zeros(n,1)];  % translation matrix

%% Animate translation

for i=1:slides
    Vt = Vt + T;
    cla
    patch('Vertices',Vt,'Faces',F3,'FaceColor',[.76 .87 .78]);
    patch('Vertices',Vt,'Faces',F4,'FaceColor',[.76 .87 .78]);
    axis(axisValues)
    drawnow
end