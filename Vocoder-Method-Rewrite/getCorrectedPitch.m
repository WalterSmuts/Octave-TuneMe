function correctedPitch = getCorrectedPitch(original,segmentSize,hopSize,sf)
	% Get shift ratio contour
	shiftRatioContour = getFrequencyContour(original, segmentSize, hopSize, sf);
	shiftRatioContour = getClosestFreqContour(shiftRatioContour) ./ shiftRatioContour;

	% Do pitch shifting
	correctedPitch = getScaledSample(original,segmentSize,hopSize,sf,shiftRatioContour);
endfunction
