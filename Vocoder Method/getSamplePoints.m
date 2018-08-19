function [samplePointsSTFT samplePointsX] = getSamplePoints(shiftRatio,hop,windowSize)
	samplePointsX = 0;
	pointerOut = 1;
	samplePointsSTFT(pointerOut) = 0;
	for (i = 1:length(shiftRatio)-2)
		while (samplePointsSTFT(pointerOut) < i-1)
			samplePointsSTFT(pointerOut+1) = samplePointsSTFT(pointerOut) + 1/shiftRatio(i);
			if (rem(pointerOut,4)==0)
				samplePointsX = [samplePointsX (samplePointsX(end) : shiftRatio(i) : (samplePointsX(end)+windowSize))];
			endif
			pointerOut = pointerOut + 1;
		endwhile
	endfor
endfunction
