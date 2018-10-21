function contour = getFrequencyContourAutoCorr(sample,segmentSize,hopSize,sf)
	% Pre-filter signal for ZCM: Assume: 20 < signal < 250Hz
	[b,a] = butter(8, 900/sf*2);
	sample = filter(b,a,sample);

	% Segment data (Input should be exact length!!!)
	sample = segment(sample,segmentSize,hopSize);

	% Pre populate array
	contour = ones(1,length(sample)/segmentSize)*220;

	% Get Frequency of each segment
	prev = 220;
	for (i = 1:columns(sample))
		contour(i) = getFrequencyAutoCorr(sample(:,i),prev,sf);
		prev = contour(i);
	endfor
endfunction
