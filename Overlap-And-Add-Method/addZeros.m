function out = addZeros(in,segmentSize,hopSize)
	l = length(in);
	while !(l<segmentSize)
		l = l - hopSize;
	endwhile
	add = segmentSize - l;
	if (add == hopSize)
		out = in;
	else
		out = [in ; zeros(add,1)];
	endif
endfunction
