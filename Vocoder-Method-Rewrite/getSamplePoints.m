function [samplePointsSTFT samplePointsX] = getSamplePoints(shiftRatio,hop,windowSize)
	% Initialize variables
	samplePointsX = 0;
	pointerOut = 1;
	samplePointsSTFT(pointerOut) = 0;

	% Loop over each shift ratio point
	for (i = 1:length(shiftRatio)-2)

		% Fill sample points in STFT space until next shift ratio is reached
		while (samplePointsSTFT(pointerOut) < i-1)
			samplePointsSTFT(pointerOut+1) = samplePointsSTFT(pointerOut) + 1/shiftRatio(i);

			% Add sample points in time domain every 4th STFT point !!!75% overlap assumed!!!
			if (rem(pointerOut,4)==0)
				samplePointsX = [samplePointsX (samplePointsX(end) : shiftRatio(i) : (samplePointsX(end)+windowSize))];
			endif
			pointerOut = pointerOut + 1;
		endwhile
	endfor
endfunction
