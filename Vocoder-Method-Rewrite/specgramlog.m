function specgramlog(signal,segmentSize,sf)
	% Running this causes a Warning!!!
	% Might not be consistent over implementations
	% Get spectrogram
	[spec frequency time] = specgram(signal,segmentSize,sf);
	spec = 20*log10(abs(spec));

	% Draw spectrogram
	pcolor(flipud(time), frequency, spec);
	set(gca,'yscale','log');
	shading interp;
	xlabel("Time (seconds)");
	ylabel("Frequency");
	axis tight;
endfunction
