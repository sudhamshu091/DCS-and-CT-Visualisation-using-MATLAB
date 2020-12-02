clc
clear

% Generating the bit pattern with each bit 20 samples long

b=round(rand(1,30));
pattern=[];
for k=1:30
    if b(1,k)==0
        sig=-ones(1,20);
    else
        sig=ones(1,20);
    end
    
    pattern=[pattern sig];
end
subplot(4,1,1)
plot(pattern);
axis([-1 620 -1.5 1.5]);
title('Original Bit Sequence');


% Generating the pseudo random bit pattern for spreading
d=round(rand(1,120));
pn_seq=[];
carrier=[];
t=[0:2*pi/4:2*pi];     % Creating 5 samples for one cosine 
for k=1:120
    if d(1,k)==0
        sig=-ones(1,5);
    else
        sig=ones(1,5);
    end
    c=cos(t);   
    carrier=[carrier c];
    pn_seq=[pn_seq sig];
   
end

% Spreading of sequence
spreaded_sig=pattern.*pn_seq;
subplot(4,1,2)
plot(spreaded_sig)
axis([-1 620 -1.5 1.5]);
title('Spreaded signal');

% BPSK Modulation of the spreaded signal
bpsk_sig=spreaded_sig.*carrier;   % Modulating the signal
subplot(4,1,3);
plot(bpsk_sig)
axis([-1 620 -1.5 1.5]);
title('BPSK Modulated Signal');

%Plotting the FFT of DSSS signal

y=abs(fft(xcorr(bpsk_sig)));
subplot(4,1,4)
plot(y/max(y))
xlabel('Frequency')
ylabel('PSD')

%Demodulation and Despreading of Received Signal

figure
rxsig=bpsk_sig.*carrier;
demod_sig=[];
for i=1:600
    if rxsig(i)>=0
    rxs =1;
else
    rxs =-1;
    end
    demod_sig=[demod_sig rxs];
end
subplot(3,1,1)
plot(demod_sig)
axis([-1 620 -1.5 1.5]);
title('Demodulated Signal')

despread_sig=demod_sig.*pn_seq;
subplot(3,1,2)
plot(despread_sig)
axis([-1 620 -1.5 1.5]);
title('Despreaded data')

%Power Spectrum of Despreaded data 
z=0.5+0.5*despread_sig;
y=abs(fft(xcorr(z)));
subplot(3,1,3)
plot(y/max(y))
axis([0 500 0 1.5])
xlabel('Frequency')
ylabel('PSD')
