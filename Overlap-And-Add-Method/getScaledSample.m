function scaledSample = getScaledSample(original,segmentSize,hopSize,sf,shiftRatioContour)
	% Test shift contour values
	shiftRatioContour = ones(1,length(original)/segmentSize);
	shiftRatioContour = shiftRatioContour + 0.5*sin((1:length(shiftRatioContour))*2*pi/40);

	% Get Sampling Points
	[windowStartPoints samplePointsX]  = getSamplePoints(shiftRatioContour,hopSize,segmentSize);

	% Window at sampled points
	sampledSegments = getSegmentedSample(original,windowStartPoints,segmentSize);

	% Get the time stretched signal x
	stretchedX = overlapAndAdd(sampledSegments);
	length(original)
	length(stretchedX)

	% Interpolate to pitch shifted sample by arbitrary function
	scaledSample = interp1(stretchedX, [samplePointsX], 'spline');

	% Remove any NAN values that creeps in
	scaledSample(isnan(scaledSample)) = 0;
endfunction
