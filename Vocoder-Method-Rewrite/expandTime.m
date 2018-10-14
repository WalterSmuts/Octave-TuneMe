function expanded = expandTime(original,windowSize,fac)
	hopSize = windowSize/2;
	% Segment and apply window
	seg = segment(original,windowSize,hopSize*(1/fac));
	seg = seg.*hann(windowSize);

	%% Overlap and add
	expanded = zeros(length(original)*fac+windowSize,1);
	begin = 1;
	for (i = 1:(columns(seg)))
		last = begin + windowSize-1;
		expanded(begin:last) = expanded(begin:last) .+ seg(:,i);
		begin = begin + hopSize;
	endfor
endfunction
