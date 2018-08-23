function out = addZeros(in,segmentSize)
	r = rem(length(in),segmentSize);
	add = segmentSize - r;
	if (add == segmentSize)
		out = in;
	else
		out = [in ; zeros(add,1)];
	endif
endfunction
