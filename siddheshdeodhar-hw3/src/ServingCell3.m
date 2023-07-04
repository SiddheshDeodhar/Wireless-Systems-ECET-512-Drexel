 function [B] = ServingCell3(mobilePosindex,B,i,N)

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
   % distance= norm(p1 - p2);
       if norm(p1 - p2) <100
         pl = line( [real1 real(mobilePosindex)], [imag1 imag(mobilePosindex)] );
        pl.Color = 'red';
 pl.LineStyle = '-';
 plot( real1+imag1*j  + radius * exp(j*pi*(0:2:12)/6),'r');
% disp(i)
B(i+1) = norm(p1 - p2);
      end
   
  end
   
 end

end


