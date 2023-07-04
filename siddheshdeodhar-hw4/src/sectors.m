


clear all, close all, clc
N=7; % change N value here


%% 1.Create data structure for matlab movie
video_flag = 1; % 0 (NO) || 1 (YES)
numFrames = 20;  
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

 
  % mobilePos = linspace( -50+150j, 50+150j, numFrames );
     
mobilePos = linspace( -100+50j, 100+50j, numFrames );
mobilePos1 = linspace( -70+200j, 60-200j, numFrames );
mobilePos2 = linspace( -100+200j, 50+200j, numFrames );
mobilePos3 = linspace( -10+200j, 30+100j, numFrames );
mobilePos4 = linspace( -50+50j, 70-100j, numFrames );
mobilePos5 = linspace( -100+50j, 70-100j, numFrames );

mobilePos6 = linspace( -100+50j, 60-150j, numFrames );
mobilePos7 = linspace( -20+70j, 40-150j, numFrames );
mobilePos8 = linspace( -60+70j, 45-100j, numFrames );
mobilePos9 = linspace( -80+70j, 20-30j, numFrames );
mobilePos10 = linspace( -60+90j, 50-70j, numFrames );
mobilePos11 = linspace( 100+50j, -50-100j, numFrames );
mobilePos12 = linspace( 100-100j, -65-5j, numFrames );
mobilePos13 = linspace( 55-35j, -85-70j, numFrames );
mobilePos14 = linspace( 70-80j, -50+50j, numFrames );
mobilePos15 = linspace( 100-20j, -20-100j, numFrames );
mobilePos16 = linspace( 50-50j, -50+100j, numFrames );
mobilePos17 = linspace( 76-50j, -40+100j, numFrames );
mobilePos18 = linspace( 39-20j, -90-100j, numFrames );
mobilePos19 = linspace( 89-40j, -20-75j, numFrames );
%% 3. Create the animation




  % Array for storing real time distance between mobile and center of active hexagon
 C=[];
 B=[]; 


 count_7=[0 0 0 0 0 0 0 0 0 0];



for index = 1:numFrames    % Draw each frame in the movie
    clf;
     
    hold on;
    axis off;
    
    % Draw the serving cell and label it

 % mobilePos = linspace( -500+150j, 515+150j, numFrames );

  drawCluster( 100, N );  % Draw 7 clusters with cluster size N
  drawSector( 100, N );  % Draw 7 clusters with cluster size N
       
   
    
   plot (mobilePos(index),'x')   % plot mobile's active position
 plot (mobilePos1(index),'x')
 plot (mobilePos2(index),'x')
  plot (mobilePos3(index),'x')
  plot (mobilePos4(index),'x')
   plot (mobilePos5(index),'x')
    plot (mobilePos6(index),'x')
   plot (mobilePos7(index),'x')
    plot (mobilePos8(index),'x')
     plot (mobilePos9(index),'x')
   plot (mobilePos10(index),'x')
  plot (mobilePos11(index),'x')
    plot (mobilePos12(index),'x')

    plot (mobilePos13(index),'x')
     plot (mobilePos14(index),'x')
      plot (mobilePos15(index),'x')
        plot (mobilePos16(index),'x')
           plot (mobilePos17(index),'x')
               plot (mobilePos18(index),'x')
                plot (mobilePos19(index),'x')

  [B]= ServingCell2(mobilePos(index),B,N,index,1);  % Highlight the serving cell, draw a line between mobile and center of serving cell, store the values of real time distances in array B
  [B]= ServingCell2(mobilePos1(index),B,N,index,2);
   [B]= ServingCell2(mobilePos2(index),B,N,index,3);
  [B]= ServingCell2(mobilePos3(index),B,N,index,4);
[B]= ServingCell2(mobilePos4(index),B,N,index,5);
[B]= ServingCell2(mobilePos5(index),B,N,index,6);
[B]= ServingCell2(mobilePos6(index),B,N,index,7);
[B]= ServingCell2(mobilePos7(index),B,N,index,8);
[B]= ServingCell2(mobilePos8(index),B,N,index,9);
[B]= ServingCell2(mobilePos9(index),B,N,index,10);
[B]= ServingCell2(mobilePos10(index),B,N,index,11);
[B]= ServingCell2(mobilePos11(index),B,N,index,12);
[B]= ServingCell2(mobilePos12(index),B,N,index,13);
[B]= ServingCell2(mobilePos13(index),B,N,index,14);
[B]= ServingCell2(mobilePos14(index),B,N,index,15);
[B]= ServingCell2(mobilePos15(index),B,N,index,16);
[B]= ServingCell2(mobilePos16(index),B,N,index,17);
[B]= ServingCell2(mobilePos17(index),B,N,index,18);
[B]= ServingCell2(mobilePos18(index),B,N,index,19);
[B]= ServingCell2(mobilePos19(index),B,N,index,20);

      hold off;

% Capture the frame for the movie
	movieFrames(:, index) = getframe(gcf);	
end 
% B(:,:,:)
 %disp(B)
 
 for index2 = 1 :numFrames
     count=0;
     count1=0;

count2=0;
count3=0;
count4=0;
count5=0;
count6=0;


for index1 = 1:(numFrames*20)
% disp(B(3,:,index1))


if ((B(3,:,index1))== 0 && abs(B(4,:,index1))<1 ) % A1
     % for index2 = 1:numFrames
    if B(1,:,index1)== index2
    count=count+1;
    count_1(B(1,:,index1))=count;
    end

     
end


  if ((B(3,:,index1))== -150  && B(4,:,index1)<-80  )% F1
   if B(1,:,index1)==index2
    count1=count1+1;
    count_2(B(1,:,index1))=count1;
   end
 end


if ((B(3,:,index1))== 0 && B(4,:,index1)>160 )% B1
   if B(1,:,index1)==index2
    count2=count2+1;
     count_3(B(1,:,index1))=count2;
   end
 end

if ((B(3,:,index1))== 0 && B(4,:,index1)<-160 )% E1
   if B(1,:,index1)==index2
    count3=count3+1;
    count_4(B(1,:,index1))=count3;
   end
end


if ((B(3,:,index1))== 150 && B(4,:,index1)<-80 )% D1
   if B(1,:,index1)==index2
    count4=count4+1;
    count_5(B(1,:,index1))=count4;
   end
end
if ((B(3,:,index1))== 150 && B(4,:,index1)>80 )% C1
   if B(1,:,index1)==index2
    count5=count5+1;
    count_6(B(1,:,index1))=count5;
   end
end

if ((B(3,:,index1))== -150 && B(4,:,index1)>85 )% G1
   if B(1,:,index1)==index2
    count6=count6+1;
    count_7(B(1,:,index1))=count6;
   end
 end

end
 end
disp('Every column represents a specific frame. Every row represents a specific cell')
disp(count_1)
disp(count_2)
disp(count_3)
disp(count_4)
disp(count_5)
disp(count_6)
disp(count_7)




%% 4. Write the movie to a file (videoName.avi)
if video_flag
	v = VideoWriter(videoName);
	% Modify as needed to make your animation faster/slower
	v.FrameRate = 5;
	open(v);
	writeVideo(v,movieFrames);
	close(v);
end




