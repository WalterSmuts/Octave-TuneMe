pkg load signal;
addpath("lib/");

% Variable initialization
[x sf] = audioread("testData.wav");
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
strechedSpec = istft(newSpec,windowSize,windowSize,hop);

% Interpolate to pitch shifted sample
tCompress = 1:length(strechedSpec);
tCompress = sqrt(tCompress);
tCompress = tCompress .* tCompress(end);
%tCompress = length(strechedSpec) - flip((tCompress.^2)/length(strechedSpec));
pitchShiftedX = interp1(strechedSpec, [tCompress], 'spline');

% Play Slowed Down sample
soundsc(pitchShiftedX,sf);
