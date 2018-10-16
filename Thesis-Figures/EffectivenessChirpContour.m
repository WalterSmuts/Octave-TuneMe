addpath("../Vocoder-Method-Rewrite/");
sf = 44100;
t = 0:1/sf:5;

k = (2)^(1/5);
x = sin(2*pi*110*(k.^t-1)/log(k));
c = getFrequencyContour(x,2048,1024,sf);
d = getClosestFreqContour(c);
clog = log2(c);
dlog = log2(d);
plot(linspace(0,5,length(c)),clog);
hold on;
plot(linspace(0,5,length(c)),dlog);
hold off;

ylabel("Pitch");
xlabel("Time [seconds]");

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
set(gca,'YTick', log2(55):0.08333:log2(440))

grid;
set(gca,'fontsize', 20);
legend("Original Pitch Contour","Wanted Pitch Contour","location","northwest");
