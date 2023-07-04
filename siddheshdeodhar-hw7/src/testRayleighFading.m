clc;clear;
M=15; %number of multipaths
N=10^5; %number of samples to generate
% fd=100; % Maximum doppler spread in hertz
Ts=0.0001; % Sampling period in seconds
fc = 2000000000; %carrier frequency
v = 27.78;   %Velocity of wave in km/h
c = 300000000;  %Speed of light

for a = 1:100  %1000 samples 
        for n = 1:N  %Simulate Rayleigh channel for 16 scattering paths
lambda = c/fc;  %Wavelength
            alphan = (2*pi*n)/M;  %Doppler shift angle
            fd= (v/lambda)*cos(alphan);  %Doppler frequency
        end
end
h=rayleighFading(M,N,fd,Ts);                   %call subroutine to calculate doppler shift
amplitude=10*log10(abs(h));                    %amplitude in dB
ts=0.001;                                      %sampling time
normalised_amplitude=rms(amplitude);           %normalised amplitude
L=-10/normalised_amplitude;                      %level of crossing set as 0 and -10
AFD=0;
b=double((amplitude<L));
c=b;
for k=length(b):-1:2
    if b(k)==1 && b(k-1)==1
       c(k-1)=0;
    end
end
crossings_per_second =sum(c)
average_crossings_per_second =sum(c)/10^4;

AFD=(sum(b)).*ts./crossings_per_second

figure;
subplot(2,1,1);
plot([0:N-1]*Ts,10*log10(abs(h)));
title('Amplitude Response of the Flat Fading channel');
xlabel('time in seconds');ylabel('Magnitude');
subplot(2,1,2);
plot([0:N-1]*Ts,angle(h));
title('Phase response of the Flat Fading channel');
xlabel('time in seconds');ylabel('Phase angle');
