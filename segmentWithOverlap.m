function out = segmentWithOverlap(input,segmentSize,overlap)
	jumpSize = segmentSize - overlap;
	input = [zeros(1,overlap) input zeros(1,overlap)];

	for (i = 1:floor(length(input)/jumpSize)-1)
		out(i,:) = input(jumpSize*(i-1) + 1 : jumpSize*(i-1) + segmentSize);
	endfor

endfunction
