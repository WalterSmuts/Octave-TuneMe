function freq = getFrequency(signal, prevFreq)
	sum = 0;
	firstIndex = 0;
	lastIndex  = 0;
	for (i = 1:length(signal) - 1);
		if ( ( ( signal(i) >= 0 ) && ( signal(i+1) < 0 ) ) || ( ( signal(i) <= 0 ) && ( signal(i+1) > 0 ) ) )
			sum = sum + 1;
			lastIndex = i;
			if ( firstIndex == 0 )
				firstIndex = i;
			endif
		endif
	endfor
	sum = sum - 1;
	freq = sum/2*(44100/(lastIndex-firstIndex));
	if (max(signal) < 0.02);
		freq = prevFreq;
	endif
endfunction
