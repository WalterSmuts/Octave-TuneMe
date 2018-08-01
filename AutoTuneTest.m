clear;
y = audioread("whistling.wav");

% 20ms Segments
seg = segment(y,44100/50);

% Iterate over Segments
prevFreq = 440;
for (i = 1:length(seg(:,1)))
	% Extract Original Frequency Contour
	freqContour(i)   = getFrequency(seg(i,:),prevFreq);
	prevFreq = freqContour(i);

	% Snap to wanted Contour
	wantedContour(i) = getClosestFreq(freqContour(i));

	% MaxFFT Estimation
	[dummy MaxFFT(i)] = max(abs(fft(seg(i,:))));
endfor

% Plot original Frequency Contour
subplot(3,1,1);
stem(freqContour);
title("Original Frequency Contour");
axis([1,length(freqContour)]);

% Plot wanted Frequency Contour
subplot(3,1,2);
stem(wantedContour);
title("Wanted Frequency Contour");
axis([1,length(freqContour)]);

% Plot shift Frequency Contour
subplot(3,1,3);
stem(wantedContour .- freqContour);
title("Shift Contour");
axis([1,length(freqContour)]);
