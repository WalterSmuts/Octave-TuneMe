pkg load image;
addpath("../Vocoder-Method-Rewrite/");
sf = 44100;
t = 0:1/sf:5;

k = (2)^(1/5);
x = sin(2*pi*110*(k.^t-1)/log(k));
contourBefore = getFrequencyContourZCM(x,2048,512,sf);
closestCorrect = getClosestFreqContour(contourBefore);
closestCorrect = log2(closestCorrect(2:end));
contourBefore = log2(contourBefore(2:end));

correct = getCorrectedPitch(x,2048,512,sf);
contourAfter = getFrequencyContourZCM(correct,2048,512,sf);
closestCorrectAfter = getClosestFreqContour(contourAfter);
contourAfter = log2(contourAfter(2:end));
closestCorrectAfter = log2(closestCorrectAfter(2:end));

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 30 8])
plot((1:length(contourBefore))/sf*512,contourBefore);
hold on;
plot((1:length(contourAfter))/sf*512,contourAfter);
plot((1:length(closestCorrectAfter))/sf*512,closestCorrectAfter);
hold off;

immse(contourBefore,closestCorrect)/immse(closestCorrectAfter,contourAfter)
immse(contourBefore,closestCorrect)
immse(closestCorrectAfter,contourAfter)

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
grid;
set(gca,'YTick', log2(55):0.08333:log2(440))

print -dpng 'EffectivenessPVZCM.png'
