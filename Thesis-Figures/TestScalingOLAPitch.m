addpath("../Overlap-And-Add-Method/")
sf = 44100;
t  = 0:1/sf:5;
x  = sin(2*pi*t*220);

tWindow = (0:(length(t)/2048-1))/sf*1024;
shiftRatioContour = 1 + 0.5*sin(2*pi*tWindow);
xOut = getScaledSample(x',2048,1024,sf,shiftRatioContour);
oldContour = shiftRatioContour*220;

% Change to pitch y-axis
oldContour = log2(oldContour);


plot(linspace(0,5,length(shiftRatioContour)), oldContour);
xlabel("Time (s)");
ylabel("Pitch");
newContour = getFrequencyContour(xOut, 2048,1024,sf);
newContour = log2(newContour);
hold on;
plot(linspace(0,5,length(newContour)),newContour);
hold off;

set(gca, 'fontsize', 12)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 3])
grid;

set(gca, 'ytickLabel', {
			'A',
			'',
			'',
			'C',
			'',
			''
			'D#'
			''
			''
			'F#'
			''
			''
})

set(gca,'YTick', log2(55):0.08333:log2(440))
print -dpng 'TestScalingOLAPitch.png'
