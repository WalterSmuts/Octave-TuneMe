pkg load signal;
addpath("lib/");

% Variable initialization
sf = 44100;
t = 0:1/sf:2;
% x = sin(2*pi*440*t + 440*t.^2);
x = audioread("ahhh.wav");
windowSize = 1024;
hop = windowSize/4;
ratio = 2;

% Convert to stft
spec = stft(x',windowSize,windowSize,hop);

% Low-Pass Filter signal before ZCM
[b,a]=butter(10, 0.05);
xLPF = filter(b,a,x);

% Get shift ratio from ZCM
freqContour(1) = 440;
for (i = 2:(length(xLPF)/(1024/4)-10))
	freqContour(i) = getFrequencyZCM(xLPF((i*1024/4):(i*1024/4+1023)),freqContour(i-1));
endfor
wantedContour = getClosestFreqContour(freqContour);
shiftRatio = wantedContour./freqContour;

% Get Sampling Points
[samplePointsSTFT samplePointsX]  = getSamplePoints(shiftRatio,hop,windowSize); % CHECK n-1!!!

% Actually apply arbitrary re-sampling of STFT
newSpec = pvsample(spec,samplePointsSTFT,hop);

% Get the time stretched signal x
stretchedX = istft(newSpec,windowSize,windowSize,hop);

% Interpolate to pitch shifted sample by arbitrary function
autoTunedX = interp1(stretchedX, [samplePointsX], 'spline');

% Draw sampling density function
subplot(2,1,1);
stem(shiftRatio);
% Draw waveform
subplot(2,1,2);
plot(autoTunedX);


% Play
%soundsc(x,sf);
%soundsc(stretchedX,sf);
soundsc(autoTunedX,sf);
