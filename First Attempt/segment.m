function out = segment(input,segmentSize)
	for (i = 1:floor(length(input)/segmentSize))
		out(i,:) = input(segmentSize*(i-1)+1:segmentSize*i);
	endfor
endfunction
