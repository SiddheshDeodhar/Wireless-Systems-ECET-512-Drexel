function drawCluster(radius,N)

imagc1=0; %imaginary coordinate of center of first cell
realc1=0; %real coordinate of center of first cell
plot (0,7*86.60,'x')
 
loopindex=1;
number=1;

  for index = 1 : 7
     alphabet='A';



str = {alphabet number};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %1st cell plotted
text( real(realc1), imag(imagc1*j), str);
 
unicodeValues = double(alphabet); % get ascii value of alphabet
 unicodeValues = unicodeValues+1; %increment the retrieved ascii value
 alphabet=char(unicodeValues); %convert the incremented ascii value back to alphabet

 str = {alphabet number}; % store the alphabet and the number in a string
 imagc=imagc1+173.205;  %imaginary coordinate of center of second cell
realc=realc1; % real coordinate of center of second cell
 plot( realc+imagc*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %2nd cell plotted
 text( real(realc), imag(imagc*j), str );

 
 unicodeValues = double(alphabet);
 unicodeValues = unicodeValues+1;
 alphabet=char(unicodeValues);

 str = {alphabet number};
 
 imagc=imagc-86.602; % 86.602
realc=realc+150;  % 150
 plot( realc+imagc*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %3rd cell
text( real(realc), imag(imagc*j), str );
unicodeValues = double(alphabet);
 unicodeValues = unicodeValues+1;
 alphabet=char(unicodeValues);

 str = {alphabet number};

  if (N==4 || N==7 )
imagc=imagc-173.205; %-86.602
realc=realc; %150
plot( realc+imagc*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %4th cell
text( real(realc), imag(imagc*j), str);
  end
  unicodeValues = double(alphabet);
 unicodeValues = unicodeValues+1;
 alphabet=char(unicodeValues);

 str = {alphabet number};
  if (N==7)
imagc=imagc-86.602; %-173.205
realc=realc-150;  %0 
plot( realc+imagc*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %5
text( real(realc), imag(imagc*j), str );
  end
  unicodeValues = double(alphabet);
 unicodeValues = unicodeValues+1;
 alphabet=char(unicodeValues);

 str = {alphabet number};
 if (N==7)
imagc=imagc+86.602; % -86.602
realc=realc-150; % -150
plot( realc+imagc*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %6
text( real(realc), imag(imagc*j), str );
 end
unicodeValues = double(alphabet);
 unicodeValues = unicodeValues+1;
 alphabet=char(unicodeValues);

 str = {alphabet number};

 if (N==7)
imagc=imagc+173.205; %86.602
% realc=realc;
 plot( realc+imagc*j  + radius * exp(j*pi*(0:2:12)/6), 'k'); %7
text( real(realc), imag(imagc*j), str );
 end

loopindex=loopindex+1;   %loopindex in for drawing loopindex number of clusters
 
% code from here onwards is for shifting the center of cell A1 to draw
% multiple clusters
if (loopindex==2)

imagc1= 3.46*100;
realc1=radius*3;
end


if (loopindex==2 && N==3)

imagc1= 1.73*100*1.5;
realc1=radius*1.5;
end

if (loopindex==2 && N==4)

imagc1= 3.46*100*0.75;
realc1=radius*1.5;
end



if loopindex==3

imagc1= 3.46*100+0.8660*100;
realc1=-radius*1.5;
end

if (loopindex==3 && N==3)

imagc1= 3.46*100-0.8660*100;
realc1=-radius*1.5;
end

if (loopindex==3 && N==4)

imagc1= 3.46*100*1.25;
realc1=-radius*1.5;
end


if loopindex==4

imagc1= 0.8660*100;
realc1=-radius*4.5;
end


if (loopindex==4 && N==3)

imagc1= 0;
realc1=-radius*3;
end

if (loopindex==4 && N==4)

imagc1= 0.8660*100*2;
realc1=-radius*3;
end


if loopindex==5

imagc1=-0.8660*100*4;
realc1=-radius*3;
end

if (loopindex==5 && N==3)

imagc1=-0.8660*100*3;
realc1=-radius*1.5;
end

if (loopindex==5 && N==4)

imagc1= -0.8660*100*3;
realc1=-radius*1.5;
end


if loopindex==6

imagc1=-0.8660*100*5;
realc1=radius*1.5;
end

if (loopindex==6 && N==3)

imagc1=-0.8660*100*3;
realc1=radius*1.5;
end

if (loopindex==6 && N==4)

imagc1=-0.8660*100*2;
realc1=radius*3;
end


if loopindex==7

imagc1=-0.8660*100;
realc1=radius*4.5;
end

if (loopindex==7 && N==3)

imagc1= 0;
realc1=radius*3;
end
if (loopindex==7 && N==4)

imagc1= 0.8660*100;
realc1=radius*4.5;
end
number=number+1;
 end