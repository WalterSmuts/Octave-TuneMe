addpath("../Overlap-And-Add-Method/")
sf = 44100;
t  = 0:1/sf:5;
x  = sin(2*pi*t*220);

tWindow = (0:(length(t)/2048-1))/sf*1024;
shiftRatioContour = 1 + 0.5*sin(2*pi*tWindow);
xOut = getScaledSample(x',2048,1024,sf,shiftRatioContour);

plot(linspace(0,5,length(shiftRatioContour)), shiftRatioContour*220);
xlabel("Time (s)");
ylabel("Frequency (Hz)");
newContour = getFrequencyContour(xOut, 2048,1024,sf);
hold on;
plot(linspace(0,5,length(newContour)),newContour);
hold off;

set(gca, 'fontsize', 12)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 3])
grid;
print -dpng 'TestScalingOLA.png'
