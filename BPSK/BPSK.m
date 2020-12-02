format long;

% Clear all variables and close all figures
clear all;
close all;

% The number of bits to send - Frame Length
N = 8;

% Generate a random bit stream
bit_stream = round(rand(1,N));

% Enter the two Phase shifts - in Radians
% Phase for 0 bit
P1 = 0; 

% Phase for 1 bit
P2 = pi;

% Frequency of Modulating Signal
f = 3;

% Sampling rate - This will define the resoultion
fs = 100;

% Time for one bit
t = 0: 1/fs : 1;

% This time variable is just for plot
time = [];

PSK_signal = [];
Digital_signal = [];

for ii = 1: 1: length(bit_stream)
    
    % The FSK Signal
    PSK_signal = [PSK_signal (bit_stream(ii)==0)*sin(2*pi*f*t + P1)+...
        (bit_stream(ii)==1)*sin(2*pi*f*t + P2)];
    
    % The Original Digital Signal
    Digital_signal = [Digital_signal (bit_stream(ii)==0)*...
        zeros(1,length(t)) + (bit_stream(ii)==1)*ones(1,length(t))];
    
    time = [time t];
    t =  t + 1;
   
end

% Plot the PSK Signal
subplot(2,1,1);
plot(time,PSK_signal,'LineWidth',2);
xlabel('Time:bit period');
ylabel('Amplitude');
title('PSK Signal with two Phase Shifts');
axis([0 time(end) -1.5 1.5]);
grid  on;

% Plot the Original Digital Signal
subplot(2,1,2);
plot(time,Digital_signal,'r','LineWidth',2);
xlabel('Time:bit period');
ylabel('Amplitude');
title('Original Digital Signal');
axis([0 time(end) -0.5 1.5]);
grid on;
