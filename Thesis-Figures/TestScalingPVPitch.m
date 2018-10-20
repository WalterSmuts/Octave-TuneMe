addpath("../Vocoder-Method-Rewrite/")
sf = 44100;
t  = 0:1/sf:5;
x  = sin(2*pi*t*220);

tWindow = (0:(length(t)/2048))/sf*1024;
tWindow = interp1(tWindow,1:0.25:length(tWindow));
shiftRatioContour = (1.03).^tWindow;
xOut = getScaledSample(x',2048,1024/2,sf,shiftRatioContour);

plot(linspace(0,5,length(shiftRatioContour)), log2(shiftRatioContour*220));
xlabel("Time (s)");
ylabel("Pitch");
newContour = getFrequencyContour(xOut, 2048,1024,sf);
newContour = newContour(3:end);
hold on;
plot(linspace(0,5-0.17,length(newContour)),log2(newContour));
hold off;

set(gca, 'fontsize', 12)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 3])
grid;

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
print -dpng 'TestScalingPVPitch.png'
