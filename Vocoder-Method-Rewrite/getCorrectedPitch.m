function correctedPitch = getCorrectedPitch(original,segmentSize,hopSize,sf)
	% Get shift ratio contour
	shiftRatioContour = getFrequencyContour(original, segmentSize, hopSize, sf);
	shiftRatioContour = getWantedFreqContour(shiftRatioContour) ./ shiftRatioContour;

	% Do pitch shifting
	correctedPitch = getScaledSample(original,segmentSize,hopSize,sf,shiftRatioContour);
endfunction
