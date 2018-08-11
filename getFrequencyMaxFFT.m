function freq = getFrequencyMaxFFT(signal, prevFreq)
	signal = [signal zeros(1,length(signal))];
	[x freq] = max(abs(fft(signal)));
	freq = freq*44100/length(signal);

	if (max(signal) < 0.02);
		freq = prevFreq;
	endif
endfunction
