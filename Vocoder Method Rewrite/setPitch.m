function correctedPitch = setPitch(original,segmentSize,hopSize,sf,wantedPitchContour)
	addpath("lib/");

	% Get frequency contour
	frequencyControur = getFrequencyContour(original, segmentSize, hopSize, sf);

	% Get correct length of wanted contour
	paddingLength = length(frequencyControur) - length(wantedPitchContour);
	wantedPitchContour = [wantedPitchContour zeros(1,paddingLength)];

	% Set zeros to frequency contour so no scaling happens
	wantedPitchContour(wantedPitchContour == 0) = frequencyControur(wantedPitchContour==0);

	% Get shift ratio contour
	shiftRatioContour = wantedPitchContour./frequencyControur;

	% Get STFT of original
	spec = stft(original',segmentSize,segmentSize,hopSize);

	% Get Sampling Points
	[samplePointsSTFT samplePointsX]  = getSamplePoints(shiftRatioContour,hopSize,segmentSize); % CHECK n-1!!!

	% Actually apply arbitrary re-sampling of STFT
	newSpec = pvsample(spec,samplePointsSTFT,hopSize);

	% Get the time stretched signal x
	stretchedX = istft(newSpec,segmentSize,segmentSize,hopSize)';

	% Interpolate to pitch shifted sample by arbitrary function
	correctedPitch = interp1(stretchedX, [samplePointsX], 'spline');

	% Remove any NAN values that creeps in
	correctedPitch(isnan(correctedPitch)) = 0;
endfunction
