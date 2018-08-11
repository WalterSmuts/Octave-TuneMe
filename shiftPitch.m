function out = shiftPitch(input,p,q)
	pkg load signal;
	out = input;
	factor = p/q;

	if (factor>1);
		for (i=2:ceil(factor));
			out = [out input];
		endfor
	endif

	cut = round(length(input)*p/q);
	out = out(1:cut);

	out = resample(out,q,p);
endfunction
