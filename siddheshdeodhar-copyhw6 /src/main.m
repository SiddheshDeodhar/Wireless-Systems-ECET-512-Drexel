close all
clear all
clc
cellRadius = 100;
centerPos = 0;
iValue = 1;
jValue = 2;
global M
M = containers.Map('KeyType','char','ValueType','any')
%%
%% 1.Create data structure for matlab movie
video_flag = 1; % 0 (NO) || 1 (YES)
numFrames = 50;
if video_flag
	videoName = 'demo';
	movieFrames = moviein(numFrames);
	frame_interf = [];
end

servingCellName = '';
servingCellArray = [];
distCentArray = {};
indArray = {};
y = {};

fc = 1.8e9;
lambda = 3.8*10^8/fc;
array = phased.ULA('NumElements',10,'ElementSpacing',lambda/2);
array.Element.FrequencyRange = [8e8 2e9];
t = (1:5:5.*numFrames)';
testsig = ones(size(t));

%% 3. Create the animation

mobilePos = linspace( -200+250*j, 200+200*j, numFrames );
    

for index = 1:numFrames    % Draw each frame in the movie

    
    % Draw the serving cell and label it
    %drawCell( 0, 100, 'A_1' );
    clf;
    drawCell(centerPos, 400);
    hold on;
    axis off;
    % Draw the mobile user at the appropriate location
    plot(mobilePos(index), 'x' );
    distToCent = findComplexDistance(mobilePos(index),centerPos);
    distCentArray{end+1} = distToCent;
    indArray{end+1} = index;
    diffReal = real((mobilePos(index)) - centerPos);
    diffImag = imag((mobilePos(index)) - centerPos);
    mobAngle = atand(diffImag./diffReal);
    angle_of_arrival = [mobAngle;0];
    x = collectPlaneWave(array,testsig,angle_of_arrival,fc);
    beamformer = phased.PhaseShiftBeamformer('SensorArray',array, ...
    'OperatingFrequency',1e9,'Direction',angle_of_arrival, ...
    'WeightsOutputPort',true);
    [yTemp,wTemp] = beamformer(x);
    y{end+1} = yTemp(1);
    % Capture the frame for the movie
	movieFrames(:, index) = getframe(gcf);	

end

%% 4. Write the movie to a file (videoName.avi)
if video_flag
	v = VideoWriter(videoName);
	% Modify as needed to make your animation faster/slower
	v.FrameRate = 5;
	open(v);
	writeVideo(v,movieFrames);
	close(v);
end



% 
% %%5. Plot received signal power
y = cell2mat(y);
wavelength = cellRadius/10;  %wavelength
distCentArray = cell2mat(distCentArray); 
indArray = cell2mat(indArray);
receivedPowerArray = (1.5e-6).*((wavelength./(4.*pi.*distCentArray)).^2); %received power
beamformedPower = receivedPowerArray.*abs(y); % power of beamformer
[v, w] = unique(servingCellArray,'stable');
startInd = 1;
figure;
    subplot(211)
    plot(t,receivedPowerArray)
    axis tight
    title('Received Signal Power without Beamforming')
    ylabel('Power')
    subplot(212)
    plot(indArray,beamformedPower);
    hold on;
    title('Received Signal Power with Beamforming')
    ylabel('Power')
    xlabel('Seconds')
    hold on;
    figure;
    pmusic(receivedPowerArray,4)  
figure;

for space = 1:10
    dist = 70;
    angle_of_arrival = [45;0];
    receivedPowerArray = (1.5e-6).*((wavelength./(4.*pi.*distCentArray)).^2);
    fc = 1.8e9;
    lambda = physconst('LightSpeed')/fc;
    array = phased.ULA('NumElements',10,'ElementSpacing',space*lambda/10);
    array.Element.FrequencyRange = [8e8 2e9];
    testsig = ones(size(t));
    x = collectPlaneWave(array,testsig,angle_of_arrival,fc);
    beamformer = phased.PhaseShiftBeamformer('SensorArray',array, ...
    'OperatingFrequency',1e9,'Direction',angle_of_arrival, ...
    'WeightsOutputPort',true);
    [y,w] = beamformer(x);
    beamformedPower = (1.5e-6).*((wavelength./(4.*pi.*dist)).^2)*abs(y);
    [v, w] = unique(servingCellArray,'stable');
    startInd = 1;
    plot(space,beamformedPower,'x');
    hold on;
    title('Received Signal Power with Beamforming 45 Angle of Arrival')
    ylabel('Magnitude')
    xlabel('Interelement spacing in increments of lambda/10')
    hold on;
end
% legend(v)
% title('Recieved Power vs Time');
% ylabel('Received Power [W]')
% xlabel('Movie Frame')