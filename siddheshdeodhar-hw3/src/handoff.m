


clear all, close all, clc
N=7; % change N value here


%% 1.Create data structure for matlab movie
video_flag = 1; % 0 (NO) || 1 (YES)
numFrames = 30;  
if video_flag
	videoName = 'demo1';
	movieFrames = moviein(numFrames);
	frame_interf = [];
end

% Note that the coordinate system is x+j*y
%  i.e. X is real axis, and Y is imaginary axis
%  Remember to be consistent with your units

%% 2. Set location of the mobile user for each frame in the movie
%   (gives the illusion of user movement)

% mobilePos = linspace( -500+150j, 515+150j, numFrames );
 mobilePos = linspace( 0+1j, 150+86.6j, numFrames );


%% 3. Create the animation



i=1; % array index for array B
 B=[];  % Array for storing real time distance between mobile and center of active hexagon
 C=[];




for index = 1:numFrames    % Draw each frame in the movie
    clf;
     
    hold on;
    axis off;
    
    % Draw the serving cell and label it

 % mobilePos = linspace( -500+150j, 515+150j, numFrames );
 
  
  drawCluster1( 100, N );  % Draw 7 clusters with cluster size N
  
       
   
    
  plot (mobilePos(index),'x')   % plot mobile's active position


% [B]= ServingCell3(mobilePos(index),B,i,N);  % Highlight the serving cell, draw a line between mobile and center of serving cell, store the values of real time distances in array B
  
 pl= line( [0 real(mobilePos(index) )], [0 imag(mobilePos(index))] );
  pl.Color = 'red';
pl1= line( [150 real(mobilePos(index) )], [86.6 imag(mobilePos(index))] );
pl1.Color='blue';
      hold off;

 

 i=i+1;  %increment array index

  p1 = [real(mobilePos(index));imag(mobilePos(index))];
        p2 = [0; 0];
        p3=[150;86.6];
    B(index)=norm(p1 - p2);
C(index)=norm(p1 - p3);
    % Capture the frame for the movie
	movieFrames(:, index) = getframe(gcf);	
end 
% B=sort(B);

% disp(B)
% disp(C)

d0=1;
sigma=2;
ple1=3;
ple2=4;
GT=1; 
GR=1;
s=size(B); % get size of array of real time distances. Size depends on frame rate
index2=s(2); % get size of array B
 reference_power=0;  % 10^-3 watts is 0 dBm
shadow = sigma*randn(1,numel(B)); % shadowing
 
shadow_1 = GT + GR + reference_power -10*ple1*log10(B/d0) - shadow ; % with shadow
 wo_shadow_1= GT + GR + reference_power -10*ple1*log10(B/d0);   % without shadow
%shadow_2 = GT + GR + reference_power -10*ple2*log10(B/d0) - shadow ; % with shadow
% wo_shadow_2= GT + GR + reference_power -10*ple2*log10(B/d0);   % without shadow

 
 

 
figure(2);
 
 hold on;

plot(B,shadow_1,'r');
plot(C,shadow_1,'b');
grid on;
xlabel('Distance (m)'); ylabel('Power_received (dBm)');
title('With Shadow for PLE=3');
for index1 = 1 : index2  % plot mobile user location in friss graph
   plot(B(index1),shadow_1(index1),'X')
      plot(C(index1),shadow_1(index1),'X')
end
hold off;

figure(3);
 hold on;
plot(B,wo_shadow_1,'r');
plot(C,wo_shadow_1,'b');
grid on;
xlabel('Distance (m)'); ylabel('Power_received (dBm) ');
title('Without Shadow for PLE=3 ');
for index1 = 1 : index2  % plot mobile user location in friss graph
    plot(B(index1),wo_shadow_1(index1),'X')
        plot(C(index1),wo_shadow_1(index1),'X')
end


hold off;


    








%% 4. Write the movie to a file (videoName.avi)
if video_flag
	v = VideoWriter(videoName);
	% Modify as needed to make your animation faster/slower
	v.FrameRate = 5;
	open(v);
	writeVideo(v,movieFrames);
	close(v);
end




