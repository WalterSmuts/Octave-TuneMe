function scaledSample = getScaledSample(original,segmentSize,hopSize,sf,shiftRatioContour)
	addpath("lib/");
	% Get STFT of original
	spec = stft(original',segmentSize,segmentSize,hopSize);

	% Get Sampling Points
	[samplePointsSTFT samplePointsX]  = getSamplePoints(shiftRatioContour,hopSize,segmentSize); % CHECK n-1!!!

	% Actually apply arbitrary re-sampling of STFT
	newSpec = pvsample(spec,samplePointsSTFT,hopSize);

	% Get the time stretched signal x
	stretchedX = istft(newSpec,segmentSize,segmentSize,hopSize)';

	% Interpolate to pitch shifted sample by arbitrary function
	scaledSample = interp1(stretchedX, [samplePointsX], 'spline');

	% Remove any NAN values that creeps in
	scaledSample(isnan(scaledSample)) = 0;
endfunction
