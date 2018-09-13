function correctedPitch = getCorrectedPitch(original,segmentSize,hopSize,sf)
	addpath("lib/");
	% Get shift ratio contour
	shiftRatioContour = getFrequencyContour(original, segmentSize, hopSize, sf);
	shiftRatioContour = getClosestFreqContour(shiftRatioContour) ./ shiftRatioContour;

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
