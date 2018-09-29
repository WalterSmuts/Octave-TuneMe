% Define constants
filename = input("Please enter the name of a file to test with: ","s")
if (isempty(filename))
	filename = "singing.wav";
endif
[originalSample sf] = audioread(filename);
segmentSize = 2048;
con = zeros(length(originalSample)/segmentSize,1);

% Add zeros to complete final segment
originalSample = addZeros(originalSample,segmentSize,hopSize);

% Pre-filter signal for ZCM: Assume: 20 < signal < 250Hz
[b,a] = butter(8, 250/sf*2);
filteredSample = filter(b,a,originalSample);

% Segment sample
segO = segment(originalSample,segmentSize,hopSize);
segF = segment(filteredSample,segmentSize,hopSize);

% Iterate over segment
for (i = 1:columns(segF))
	% Calculate frequency of segment
	s = segF(:,i);
	con(i) = getFrequencyZCM(s,0,sf);
	con(i)

	% Plot segment
	subplot(2,1,1);
	plot(s);
	grid;

	% Plot frequency contour
	subplot(2,1,2);
	stem(con);

	pause;
endfor
