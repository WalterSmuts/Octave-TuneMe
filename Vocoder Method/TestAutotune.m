pkg load signal;
addpath("lib/");

% Variable initialization
sf = 44100;
t = 0:1/sf:2;
x = sin(2*pi*440*t .+ 100*t.^2);
windowSize = 1024;
hop = windowSize/4;
ratio = 2;

% Convert to stft
spec = stft(x',windowSize,windowSize,hop);
original = columns(spec)-2;

% Get shift ratio from stft
freqContour = getFrequencyContourSTFT(spec,sf,windowSize);
wantedContour = getClosestFreqContour(freqContour);
shiftRatio = wantedContour./freqContour;

% Sample at arbitrary variable intervals
%sampleIntervals = cumsum(shiftRatio);
%sampleIntervals = sampleIntervals(1:end-1); % Not sure why???
%sampleIntervals = sampleIntervals .* length(sampleIntervals)/sampleIntervals(end); % This scaling feels weird

% Actually apply arbitrary re-sampling
%newSpec = pvsample(spec,t,hop);
%strechedSpec = istft(newSpec,windowSize,windowSize,hop);

% Interpolate to pitch shifted sample by arbitrary function
%tcompress = 1:length(strechedspec);
%tCompress = sqrt(tCompress);
%tCompress = tCompress .* tCompress(end);
%autoTunedX = interp1(strechedSpec, [tCompress], 'spline');

% Play
%soundsc(autoTunedX,sf);
