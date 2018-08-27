function freq = getFrequencyZCM(signal, prevFreq,sf)
	% Somewhat a voice presence check
	if (max(signal) < 0.02);
		freq = prevFreq;
		return;
	endif

	% Calculate crossing points
	zc = zerocrossing(1:length(signal),signal);

	% If no crossings
	if (length(zc) == 0)
		freq = prevFreq;
		return;
	endif

	% Get considered length
	consideredLength = zc(end) - zc(1);

	% Calculate frequency
	sum = length(zc)-1;
	freq = sum/2*(sf/consideredLength);
endfunction
