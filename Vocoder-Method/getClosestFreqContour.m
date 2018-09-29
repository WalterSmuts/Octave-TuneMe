function out = getClosestFreqContour(input)
	multiplier = 1.0594631;
	base  = 440;
	i = -12*3:12*3;
	valid = 440*multiplier.^i;
	for i = 1:length(input)
		[dummy index(i)]= min(abs(input(i).-valid));
	endfor
	out = valid(index);
endfunction
