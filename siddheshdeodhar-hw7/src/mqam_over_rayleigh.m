nSym=10^5;                %  Number of MPSK Symbols to transmit
EbN0dB = -15:2:20;       % bit to noise ratio
 MOD_TYPE='MQAM';         %modulation type - 'MPSK' or 'MQAM'
plotColor =['b','g','r','c','m','k']; p=1;
for M= 4     
    k=log2(M);              %number of bits per modulated symbol
    EsN0dB = 10*log10(k)+EbN0dB;  % converting to symbol energy to noise ratio
    symErrors= zeros(1,length(EsN0dB)); %to store symbol errors
    
    for i=1:length(EsN0dB)
        %-----------------Transmitter--------------------
        d=ceil(M.*rand(1,nSym));%uniformly distributed random data symbols from 1:M
      
        [s,ref]=mqam_modulator(M,d);
        %-------------- Channel ----------------
        h = 1/sqrt(2)*(randn(1,nSym)+1i*randn(1,nSym)); %CIR - 1 tap Rayleigh fading filter
        hs = h.*s; %Rayleigh flat fading effect on the modulated symbols
        r = add_awgn_noise(hs,EsN0dB(i));%add AWGN noise r = h*s+n
         %-----------------Receiver----------------------
        y = r./h; %single tap inverting equalizer
        [~,dcap]= iqOptDetector(y,ref);%Optimum IQ detector
        %----------------Error counter------------------
        symErrors(i)=sum(d~=dcap);%Count number of symbol errors
      end
   simulatedSER = symErrors/nSym;
  plot(EbN0dB,log10(simulatedSER),[plotColor(p) 'O']);hold on;
 legendString{2*p-1}=['Sim ',num2str(M),'-QAM'];
   end

  legend(legendString); 
title(['Performance of ',MOD_TYPE,' in Rayleigh flat fading']);
xlabel('Eb/N0 (dB)');ylabel('Symbol Error Rate - P_s');grid on;