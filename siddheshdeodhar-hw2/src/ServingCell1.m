 function [B] = ServingCell1(mobilePosindex,B,i,N)

  radius=100;
 

 real1=-600;   % set initial value of real coordinate

 for index1 = 1 : 7     %traverse real axis
     if (rem(index1,2)==0)
imag1=10*86.60;    % set imaginary coordinate
     else
       imag1=7*86.60;  % set imaginary coordinate
     end 
  


real1=real1+150;
  
  for index2 = 1 : 8  %traverse imaginary axis
         
      imag1=imag1-173.2;
        
       
     p1 = [real(mobilePosindex);imag(mobilePosindex)];
        p2 = [real1; imag1];
       
    distance= norm(p1 - p2);
       if distance <=100
         pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
        pl.Color = 'red';
 pl.LineStyle = '-';
 plot( real1+imag1*j  + radius * exp(j*pi*(0:2:12)/6),'r');
 B(i) = norm(p1 - p2); 

 
imag1= imag1+3.46*100; %346
real1=real1+radius*3; % 300
 pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
 pl.Color = 'blue';
imag1= imag1+0.8660*100;  %432
real1=real1-radius*4.5;  %150
 pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
 pl.Color = 'green';
imag1= imag1-346;  %86.60
real1=real1-radius*3; % -450
pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
 pl.Color = 'cyan';
imag1=imag1-433;  % -346.4
real1=real1+150;   % -300
  pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
 pl.Color = 'blue';

  imag1=imag1-86.6;   % -433
real1=real1+450;  % 150
        pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
 pl.Color = 'black';
        imag1=imag1+346.4;  % -86.60
real1=real1+300;   % 450
pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
        pl.Color = 'magenta';
 
       end  
    
       
       
  
  
  end
   
  end


      
 

 
 
 
 
 end


