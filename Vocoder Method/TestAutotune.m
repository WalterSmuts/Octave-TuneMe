pkg load signal;
addpath("lib/");

% Variable initialization
sf = 44100;
t = 0:1/sf:2;
x = sin(2*pi*440*t );
windowSize = 1024;
hop = windowSize/4;
ratio = 2;

% Convert to stft
spec = stft(x',windowSize,windowSize,hop);

% Get shift ratio from stft
freqContour = getFrequencyContourSTFT(spec,sf,windowSize);
wantedContour = getClosestFreqContour(freqContour);
shiftRatio = wantedContour./freqContour;

% Sample at arbitrary variable intervals
samplePoints = 1:columns(spec)-1; % -1 because needs n+1 to interpolate
samplePoints = samplePoints.^2/(samplePoints(end));

% Actually apply arbitrary re-sampling
newSpec = pvsample(spec,samplePoints,hop);
strechedSpec = istft(newSpec,windowSize,windowSize,hop);

% Interpolate to pitch shifted sample by arbitrary function
tCompress = 1:length(strechedSpec);
tCompress = sqrt(tCompress);
tCompress = tCompress .* tCompress(end);
autoTunedX = interp1(strechedSpec, [tCompress], 'spline');

% Play
soundsc(autoTunedX,sf);
