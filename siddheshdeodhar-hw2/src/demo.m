


clear all, close all, clc
N=7; % change N value here


%% 1.Create data structure for matlab movie
video_flag = 1; % 0 (NO) || 1 (YES)
numFrames = 80;  
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

% mobilePos = linspace( -500+150j, 515+150j, numFrames );
 mobilePos = linspace( -200+50j, 200+50j, numFrames );


%% 3. Create the animation



i=1; % array index for array B
 B=[];  % Array for storing real time distance between mobile and center of active hexagon
 




for index = 1:numFrames    % Draw each frame in the movie
    clf;
     
    hold on;
    axis off;
    
    % Draw the serving cell and label it

 % mobilePos = linspace( -500+150j, 515+150j, numFrames );
 
  
  drawCluster( 100, N );  % Draw 7 clusters with cluster size N
  
       
   
    
  plot (mobilePos(index),'x')   % plot mobile's active position


[B]= ServingCell1(mobilePos(index),B,i,N);  % Highlight the serving cell, draw a line between mobile and center of serving cell, store the values of real time distances in array B
  
  


      hold off;

 

 i=i+1;  %increment array index


    

    % Capture the frame for the movie
	movieFrames(:, index) = getframe(gcf);	
end 
B=sort(B);
d0=1;
sigma=0.5;
ple1=3;
ple2=4;
GT=1; 
GR=1;
s=size(B); % get size of array of real time distances. Size depends on frame rate
index2=s(2); % get size of array B
 

reference_power=0;  % 10^-3 watts is 0 dBm
shadow = sigma*randn(1,numel(B)); % shadowing
 

z= abs(sigma*randn(1,numel(B))+1i*sigma*randn(1,numel(B)));




shadow_1 = GT + GR + reference_power -10*ple1*log10(B/d0)  -z ; % with shadow
 wo_shadow_1= GT + GR + reference_power -10*ple1*log10(B/d0);   % without shadow


shadow_2 = GT + GR + reference_power -10*ple2*log10(B/d0) -z ; % with shadow
 wo_shadow_2= GT + GR + reference_power -10*ple2*log10(B/d0);   % without shadow


 
% interference_with_shadow = GT + GR + reference_power -10*ple2*log10(450/d0) - shadow % with shadow
 interference= GT + GR + reference_power -10*ple2*log10(450/d0)   % without shadow
 
 
 
 
 
 SI_for_path_loss_3=(4.58)^3/(6);
 SI_for_path_loss_4=(4.58)^4/(6);
 
 SI_for_path_loss_3=log10(SI_for_path_loss_3)
  SI_for_path_loss_4=log10(SI_for_path_loss_4)
 
 
 figure(2);
 
 
 hold on;

plot(B,shadow_1,'r');
grid on;
xlabel('Distance (m)'); ylabel('Power_received (dBm)');
title('With Shadow for PLE=3');
for index1 = 1 : index2  % plot mobile user location in friss graph
    plot(B(index1),shadow_1(index1),'X')
    
end

hold off;

figure(3);
 
 
 hold on;

plot(B,wo_shadow_1,'r');grid on;
xlabel('Distance (m)'); ylabel('Power_received (dBm) ');
title('Without Shadow for PLE=3 ');
for index1 = 1 : index2  % plot mobile user location in friss graph
    plot(B(index1),wo_shadow_1(index1),'X')
    
end

hold off

figure(4);
 
 
 hold on;

plot(B,shadow_2,'r');grid on;
xlabel('Distance (m)'); ylabel('Power_received (dBm) ');
title('with Shadow for PLE=4 ');
for index1 = 1 : index2  % plot mobile user location in friss graph
    plot(B(index1),shadow_2(index1),'X')
    
end

hold off

figure(5);
 
 
 hold on;

plot(B,wo_shadow_2,'r');grid on;
xlabel('Distance (m)'); ylabel('Power_received (dBm) ');
title('without Shadow for PLE=4 ');
for index1 = 1 : index2  % plot mobile user location in friss graph
    plot(B(index1),wo_shadow_2(index1),'X')
    
end

hold off






%% 4. Write the movie to a file (videoName.avi)
if video_flag
	v = VideoWriter(videoName);
	% Modify as needed to make your animation faster/slower
	v.FrameRate = 5;
	open(v);
	writeVideo(v,movieFrames);
	close(v);
end




