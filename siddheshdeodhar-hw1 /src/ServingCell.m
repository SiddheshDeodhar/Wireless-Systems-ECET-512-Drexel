% function ServingCell(mobilePosindex,B )
 function [B] = ServingCell(mobilePosindex,B,i,N)

 radius=100;

  if -500<real(mobilePosindex)  && real(mobilePosindex) <-385 && N==7
  pl = line( [-450 real(mobilePosindex)], [86.60 imag(mobilePosindex)] );
   pl.Color = 'red';
pl.LineStyle = '-';
 % disp(A)

  p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [-450; 86.60];

 %code from here onwards highlight the serving cell
 imagc1= 0.8660*100;
realc1=-radius*4.5;
str = {'A' '4'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1
 % hightlighting code ends here
B(i) = norm(p1 - p2);  % store euclidean distance between mobile and active cell



    elseif -385<real(mobilePosindex) && real(mobilePosindex)<-215 
  pl= line( [-300 real(mobilePosindex)], [86.60*2 imag(mobilePosindex)] );
      pl.Color = 'blue';
pl.LineStyle = '-';
  p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [-300; 86.60*2];
 imagc1= 0.8660*100*2;
realc1=-radius*3;
str = {'C' '4'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1
 
B(i) = norm(p1 - p2);

    elseif -215<mobilePosindex && mobilePosindex<-85 
  pl= line( [-150 real(mobilePosindex)], [86.60 imag(mobilePosindex)] );
 pl.Color = 'green';
pl.LineStyle = '-';
  p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [-215; 86.60];
 imagc1= 0.8660*100*1;
realc1=-radius*1.5;
str = {'G' '1'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1
 
B(i) = norm(p1 - p2);

  elseif -85<mobilePosindex && mobilePosindex<85 
  pl= line( [0 real(mobilePosindex)], [86.60*2 imag(mobilePosindex)] );
 pl.Color = 'red';
pl.LineStyle = '-';  
p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [0; 86.60*2];
imagc1= 0.8660*100*2;
realc1=0;
str = {'B' '1'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1

 text( real(realc1), imag(imagc1*j), str);

 
B(i) = norm(p1 - p2);

    
  
  elseif 85<mobilePosindex &&  mobilePosindex<215
 pl= line( [150 real(mobilePosindex)], [86.60 imag(mobilePosindex)] );
 pl.Color = 'blue';
pl.LineStyle = '-';
  p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [150; 86.60];
 imagc1= 0.8660*100*1;
realc1=1.5*100;
str = {'C' '1'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1
B(i) = norm(p1 - p2);

  elseif 215<mobilePosindex &&  mobilePosindex<385
  pl=line( [300 real(mobilePosindex)], [86.60*2 imag(mobilePosindex)] );
    pl.Color = 'green';
pl.LineStyle = '-';
  p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [300; 86.60*2];
  imagc1= 0.8660*100*2;
realc1=3*100;
str = {'E' '2'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1
 
B(i) = norm(p1 - p2);


    elseif 385<mobilePosindex && mobilePosindex <516
  pl= line( [450 real(mobilePosindex)], [86.60 imag(mobilePosindex)] );
     pl.Color = 'red';
pl.LineStyle = '-';
  p1 = [real(mobilePosindex);imag(mobilePosindex)];
 p2 = [450; 86.60];
 imagc1= 0.8660*100*1;
 realc1=4.5*100;
str = {'B' '7'};
 plot( realc1+imagc1*j  + radius * exp(j*pi*(0:2:12)/6),'r');%1
 
B(i) = norm(p1 - p2);

  end
    end
