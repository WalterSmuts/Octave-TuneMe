function freqContour = getFrequencyContourSTFT(frames,sf,windowSize)
	% freqContour = zeros(1,columns(frames)) + 400;
	[dummy index] = max(abs(frames));
	freqContour = index*sf/windowSize;
endfunction
