function stretchedX = overlapAndAdd(seg)
	windowSize = rows(seg);
	hopSize = windowSize/2;

	%% Overlap and add
	stretchedX = zeros((rows(seg)*columns(seg)+rows(seg))/2,1);
	begin = 1;
	for (i = 1:(columns(seg)))
		last = begin + windowSize-1;
		stretchedX(begin:last) = stretchedX(begin:last) .+ seg(:,i);
		begin = begin + hopSize;
	endfor
endfunction
