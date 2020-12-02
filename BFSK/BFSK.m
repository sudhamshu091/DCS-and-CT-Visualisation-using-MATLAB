% MATLAB Script for a Binary FSK with two frequencies

format long;

% Clear all variables and close all figures
clear all;
close all;

% The number of bits to send - Frame Length
N = 8;

% Generate a random bit stream
bit_stream = round(rand(1,N));

% Enter the two frequencies 
% Frequency component for 0 bit
f1 = 3; 

% Frequency component for 1 bit
f2 = 5;

% Sampling rate - This will define the resoultion
fs = 100;

% Time for one bit
t = 0: 1/fs : 1;

% This time variable is just for plot
time = [];

FSK_signal = [];
Digital_signal = [];

for ii = 1: 1: length(bit_stream)
    
    % The FSK Signal
    FSK_signal = [FSK_signal (bit_stream(ii)==0)*sin(2*pi*f1*t)+(bit_stream(ii)==1)*sin(2*pi*f2*t)];
    
    % The Original Digital Signal
    Digital_signal = [Digital_signal (bit_stream(ii)==0)*zeros(1,length(t)) + (bit_stream(ii)==1)*ones(1,length(t))];
    
    time = [time t];
    t =  t + 1;
   
end

% Plot the FSK Signal
subplot(2,1,1);
plot(time,FSK_signal);
xlabel('Time:bit period');
ylabel('Amplitude');
title('FSK Signal with two Frequencies');
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
