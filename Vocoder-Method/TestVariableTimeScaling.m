pkg load signal;
addpath("lib/");

% Variable initialization
[x sf] = audioread("counting.wav");
windowSize = 1024;
hop = windowSize/4;
ratio = 2;

% Convert to stft
spec = stft(x',windowSize,windowSize,hop);
original = columns(spec)-2;

% Sample at variable intervals
t = 1:original;
t = (t.^2)./original;

% Sample at constant intervals
%t = 0:ratio:original

% Actually apply re-sampling
newSpec = pvsample(spec,t,hop);
newX = istft(newSpec,windowSize,windowSize,hop);

% Play Slowed Down sample
soundsc(newX,sf);
