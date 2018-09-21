function scaledPitchSample = setPitch(original,segmentSize,hopSize,sf,wantedPitchContour)
	% Get frequency contour
	frequencyControur = getFrequencyContour(original, segmentSize, hopSize, sf);

	% Get correct length of wanted contour
	paddingLength = length(frequencyControur) - length(wantedPitchContour);
	wantedPitchContour = [wantedPitchContour zeros(1,paddingLength)];

	% Set zeros to frequency contour so no scaling happens
	wantedPitchContour(wantedPitchContour == 0) = frequencyControur(wantedPitchContour==0);

	% Get shift ratio contour
	shiftRatioContour = wantedPitchContour./frequencyControur;

	% Do pitch scaling
	scaledPitchSample = getScaledSample(original,segmentSize,hopSize,sf,shiftRatioContour);
endfunction
