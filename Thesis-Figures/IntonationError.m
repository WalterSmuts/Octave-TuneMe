t = 0:1/50:8;
x = [ones(1,50)*8 ones(1,50)*9 ones(1,50)*11 ones(1,50)*13];
x = [x ones(1,50)*11 ones(1,50)*9 ones(1,50)*8 ones(1,51)*6];

xnoise = rand(1,length(x))-0.5;
[b, a] = butter (2, 0.07);
xnoise = filter(b,a,xnoise);

plot(t,x+xnoise*3);
set(gca, 'ytickLabel', {
			'A',
			'A#',
			'B',
			'C',
			'C#',
			'D'
			'D#'
			'E'
			'F'
			'F#'
			'G'
			'G#'
})

xlabel("Time");
ylabel("Pitch");
axis([0 8 4 16]);
set(gca,'YTick', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16], 'fontsize', 12)
set(gca,'XTick', 0:8)
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 30 8])
grid;
print -dpng 'IntonationError.png'
