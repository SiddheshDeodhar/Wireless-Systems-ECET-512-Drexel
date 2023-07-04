B=1:1:100;
% V=8.33;
% T=B/V;

d0=1;
sigma=2;
ple1=3;

GT=1; 
GR=1;
s=size(B); % array of distances from 1 to 100 with increment of 1.
index2=s(2); % get size of array B
 

reference_power=0;  % 10^-3 watts is 0 dBm
shadow = sigma*randn(1,numel(B)); % random shadowing 
 

z= abs(sigma*randn(1,numel(B))+1i*sigma*randn(1,numel(B)));




shadow_fading = GT + GR + reference_power -10*ple1*log10(B/d0)  -z -shadow ; 
 wo_shadow_fading= GT + GR + reference_power -10*ple1*log10(B/d0);   


wo_shadow = GT + GR + reference_power -10*ple1*log10(B/d0) -z ;
 wo_fading= GT + GR + reference_power -10*ple1*log10(B/d0)-shadow;  


 

figure(1);
 
 
 hold on;

plot(B,shadow_fading,'b');
grid on;
xlabel('Time'); ylabel('Power_received (dBm)');
title('With Shadow and fading for PLE=3');


hold off;

figure(2);
 
 
 hold on;

plot(B,wo_shadow_fading,'r');grid on;
xlabel('Time'); ylabel('Power_received (dBm) ');
title('Without Shadow and fading for PLE=3 ');


hold off

figure(3);
 
 
 hold on;

plot(B,wo_shadow,'b');grid on;
xlabel('Time'); ylabel('Power_received (dBm) ');
title('without Shadow for PLE=3 ');


hold off

figure(4);
 
 
 hold on;

plot(B,wo_fading,'r');grid on;
xlabel('Time'); ylabel('Power_received (dBm) ');
title('without Fading for PLE=3 ');


hold off


