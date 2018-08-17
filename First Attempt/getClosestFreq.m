function out = getClosestFreq(input)
	multiplier = 1.0594631;
	base  = 440;
	i = -12*3:12*3;
	valid = 440*multiplier.^i;
	[dummy index]= min(abs(input.-valid));
	out = valid(index);
endfunction
