function clipped = clip(signal,threshold)
	signal(abs(signal)<threshold) = 0;
	signal( (signal>0) & (signal>threshold) ) = signal( (signal>0) & (signal>threshold) ) - threshold;
	signal( (signal<0) & (signal<-threshold) ) = signal( (signal<0) & (signal<-threshold) ) + threshold;
	clipped = signal;
endfunction
