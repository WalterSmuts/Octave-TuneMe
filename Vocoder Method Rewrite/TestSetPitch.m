% Define constants
sf = 44100;
t = 0:1/sf:5;
originalFrequency = 200;
originalSample = sin(2*pi*t*originalFrequency);
segmentSize = 2048;
hopSize = segmentSize/4;

% Get contours
originalContour = getFrequencyContour(originalSample,segmentSize,hopSize,sf);
t = linspace(0,5,length(originalContour));
wantedContour = ones(1,length(originalContour))*200 + sin(2*pi*t/2)*10;
wantedContour = wantedContour(1:end/2);

% Do pitch shift
changedSample = setPitch(originalSample,segmentSize,hopSize,sf,wantedContour);
changedContour = getFrequencyContour(changedSample,segmentSize,hopSize,sf);

% Plot contours
plot((0:(length(originalContour)-1))/sf*hopSize,originalContour);
hold on;
plot((0:(length(wantedContour)-1))/sf*hopSize,wantedContour);
plot((0:(length(changedContour)-1))/sf*hopSize,changedContour);
title("Original Frequency Contour");
xlabel("Time (seconds)");
ylabel("Frequency");
hold off;
