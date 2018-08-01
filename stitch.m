function out = stitch(input)
	out = [];
	for (i = 1:length(input(:,1)))
		out = [out, input(i,:)];
	endfor
endfunction
