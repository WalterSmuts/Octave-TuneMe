function freq = getFrequencyZCM(signal, prevFreq,sf)
	% Calculate crossing points
	zc = zerocrossing(1:length(signal),signal);
	firstIndex = zc(1);
	lastIndex  = zc(end);

	% Calculate frequency
	sum = length(zc)-1;
	freq = sum/2*(sf/(lastIndex-firstIndex));

	% Somewhat a voice presence check
	if (max(signal) < 0.02);
		freq = prevFreq;
	endif
endfunction
