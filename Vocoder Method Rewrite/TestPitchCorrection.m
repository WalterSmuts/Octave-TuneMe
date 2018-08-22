% Define constants
filename = input("Please enter the name of a file to correct its pitch: ","s")
if (isempty(filename))
	filename = "singing.wav";
endif
[originalSample sf] = audioread(filename);
analysisWindowSize = 1024;

% Apply pitch correction
correctedSample = getCorrectedPitch(originalSample, sf);

% Get frequency contours
originalFrequencyContour = getFrequencyContour(originalSample,analysisWindowSize,sf);
correctedFrequencyContour = getFrequencyContour(correctedSample,analysisWindowSize,sf);

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
plot((0:(length(originalSample)-1))/sf,originalSample);
title("Corrected Waveform");
xlabel("Time (seconds)");
ylabel("Amplitude");

% Draw original frequency contour
subplot(2, 2, 3);
plot((0:(length(originalFrequencyContour)-1))/sf*analysisWindowSize,originalFrequencyContour);
title("Original Frequency Contour");
xlabel("Time (seconds)");
ylabel("Frequency");

% Draw corrected frequency contour
subplot(2, 2, 4);
plot((0:(length(correctedFrequencyContour)-1))/sf*analysisWindowSize,correctedFrequencyContour);
title("Corrected Frequency Contour");
xlabel("Time (seconds)");
ylabel("Frequency");

pause;
%%%%%%%%%%%%%%%%%%%
% Draw spectrograms
%%%%%%%%%%%%%%%%%%%

% Draw original spectrogram
subplot(2,1,1);
specgram(originalSample,analysisWindowSize,sf);
title("Original Spectrogram");

% Draw corrected spectrogram
subplot(2,1,2);
specgram(correctedSample,analysisWindowSize,sf);
title("Corrected Spectrogram");
