% Suppress warnings
warning('off');

% Define constants
filename = input("Please enter the name of a file to correct its pitch: ","s");
if (isempty(filename))
	filename = "singing.wav";
endif
[originalSample sf] = audioread(filename);
segmentSize = 2048;
hopSize = segmentSize/2;

% Apply pitch correction
correctedSample = getCorrectedPitch(originalSample, segmentSize, hopSize, sf);

% Get frequency contours
originalFrequencyContour = getFrequencyContour(originalSample,segmentSize,hopSize,sf);
correctedFrequencyContour = getFrequencyContour(correctedSample,segmentSize,hopSize,sf);

% Metric to evaluate effectiveness of pitch correction
% Mean squared error metric (TODO: possibly scale to Max out of tune possible)
pkg load image;
mseBefore = immse(ones(1,length(originalFrequencyContour)),originalFrequencyContour./getClosestFreqContour(originalFrequencyContour))*100^2
mseAfter  = immse(ones(1,length(correctedFrequencyContour)),correctedFrequencyContour./getClosestFreqContour(correctedFrequencyContour))*100^2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Draw draw waveforms vs frequency contours
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Draw original waveform
subplot(2, 2, 1);
plot((0:(length(originalSample)-1))/sf,originalSample);
title("Original Waveform");
xlabel("Time (seconds)");
ylabel("Amplitude");

% Draw corrected waveform
subplot(2, 2, 2);
plot((0:(length(correctedSample)-1))/sf,correctedSample);
title("Corrected Waveform");
xlabel("Time (seconds)");
ylabel("Amplitude");

% Draw original frequency contour
subplot(2, 2, 3);
plot((0:(length(originalFrequencyContour)-1))/sf*hopSize,originalFrequencyContour);
title("Original Frequency Contour");
xlabel("Time (seconds)");
ylabel("Frequency");

% Draw corrected frequency contour
subplot(2, 2, 4);
plot((0:(length(correctedFrequencyContour)-1))/sf*hopSize,correctedFrequencyContour);
title("Corrected Frequency Contour");
xlabel("Time (seconds)");
ylabel("Frequency");

pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Draw contours on top of one another
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Draw original frequency contour
subplot(1, 1, 1);
plot((0:(length(originalFrequencyContour)-1))/sf*hopSize,originalFrequencyContour);
title("Original Frequency Contour");
xlabel("Time (seconds)");
ylabel("Frequency");
pause;

% Draw wanted frequency contour on top of corrected contour
hold on;
plot((0:(length(originalFrequencyContour)-1))/sf*hopSize,getClosestFreqContour(originalFrequencyContour));
title("Original Frequency Contour and Wanted Contour");
legend("Original Frequency Contour","Wanted Contour");
pause;

% Draw corrected frequency contour on top of rest
plot((0:(length(correctedFrequencyContour)-1))/sf*hopSize,correctedFrequencyContour);
title("Original Frequency Contour, Wanted Contour and corrected contour");
legend("Original Frequency Contour","Wanted Contour","Corrected Contour");

hold off;
pause;
%%%%%%%%%%%%%%%%%%%
% Draw spectrograms
%%%%%%%%%%%%%%%%%%%

% Draw original spectrogram
subplot(2,1,1);
specgramlog(originalSample,segmentSize,sf);
title("Original Spectrogram");

% Draw corrected spectrogram
subplot(2,1,2);
specgramlog(correctedSample,segmentSize,sf);
title("Corrected Spectrogram");
