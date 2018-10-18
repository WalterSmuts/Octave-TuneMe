addpath("../Vocoder-Method-Rewrite/");
sf = 44100;
t = 0:1/sf:5;

k = (2)^(1/20);
x = sin(2*pi*110*(k.^t-1)/log(k));
c = getFrequencyContour(x,2048,1024,sf);
c(1) = 110;
c = c.+rand(1,length(c));
d = getWantedFreqContour(c);
clog = log2(c);
dlog = log2(d);
plot(linspace(0,5,length(c)),clog);
hold on;
plot(linspace(0,5,length(c)),dlog);
hold off;

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

xlabel("Time          ");
ylabel("Pitch");
set(gca,'XTick', 0:8, 'fontsize', 12)
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 30 8])
grid;
set(gca,'YTick', log2(55):0.08333:log2(440))
print -dpng 'NoisyContourFixed.png'
