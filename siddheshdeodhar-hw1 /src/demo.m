
%In line 11 increase numFrames to increase number of samples of mobile location
% value of N in line 6 can be set to 7,4 or 3 as asked

clear all, close all, clc
N=7; % change N value here


%% 1.Create data structure for matlab movie
video_flag = 1; % 0 (NO) || 1 (YES)
numFrames = 50;  
if video_flag
	videoName = 'demo';
	movieFrames = moviein(numFrames);
	frame_interf = [];
end

% Note that the coordinate system is x+j*y
%  i.e. X is real axis, and Y is imaginary axis
%  Remember to be consistent with your units

%% 2. Set location of the mobile user for each frame in the movie
%   (gives the illusion of user movement)

  mobilePos = linspace( -500+150j, 515+150j, numFrames );
%% 3. Create the animation



i=0; % array index for array B
 B=[];  % Array for storing real time distance between mobile and center of active hexagon
 




for index = 1:numFrames    % Draw each frame in the movie
    clf;
     
    hold on;
    axis off;
    
    % Draw the serving cell and label it


   drawCluster( 100, N );  % Draw 7 clusters with cluster size N
  
       
   
    
  plot (mobilePos(index),'x')   % plot mobile's active position


[B]= ServingCell3(mobilePos(index),B,i,N);  % Highlight the serving cell, draw a line between mobile and center of serving cell, store the values of real time distances in array B
  
  


      hold off;

 

 i=i+1;  %increment array index


    

    % Capture the frame for the movie
	movieFrames(:, index) = getframe(gcf);	
end 


fc = 900*10^6; 
lambda = 3*10^8/fc; 
Pt = 45; % power of transmission antenna 
Gt = 1; % gain of transmission antenna 
Gr = 1; % gain of receiving antenna 


B=sort(B); % sort real time distances in ascending order

 s=size(B); % get size of array of real time distances. Size depends on frame rate
index2=s(2); % get size of array B
power = 10*log10(Gr*Gt*Pt*lambda^2./(16*pi^2*B.^2));


figure(2) %plot friss equation graph. x indicates mobile locations
hold on
plot(B,power)  % plot friss graph of distance vs power(decibels)

for index1 = 1 : index2  % plot mobile user location in friss graph
    plot(B(index1),power(index1),'X')
    
end

grid on
hold off
title('Received power vs distance')

xlabel('distance in metres')
ylabel('Received power in decibels')





%% 4. Write the movie to a file (videoName.avi)
if video_flag
	v = VideoWriter(videoName);
	% Modify as needed to make your animation faster/slower
	v.FrameRate = 5;
	open(v);
	writeVideo(v,movieFrames);
	close(v);
end




