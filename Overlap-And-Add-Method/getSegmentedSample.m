function segmentedSample = getSegmentedSample(original,windowStartPoints,segmentSize)
	segmentedSample = [];
	windowStartPoints(1) = 1;
	for (i = 1:length(windowStartPoints))
		next = original(windowStartPoints(i):(windowStartPoints(i) + segmentSize-1)).*hann(segmentSize);
		segmentedSample = [segmentedSample next];
	endfor
endfunction
