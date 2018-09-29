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
stretchedX = istft(newSpec,windowSize,windowSize,hop);

% Interpolate to pitch shifted sample
tCompress = 1:length(stretchedX);
tCompress = sqrt(tCompress);
tCompress = tCompress .* tCompress(end);
%tCompress = length(stretchedX) - flip((tCompress.^2)/length(stretchedX));
pitchShiftedX = interp1(stretchedX, [tCompress], 'spline');

% Play Slowed Down sample
soundsc(pitchShiftedX,sf);
