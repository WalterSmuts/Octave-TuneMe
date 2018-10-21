pkg load image;
sf = 44100;
t = 0:1/sf:5;

k = (2)^(1/10);
x = sin(2*pi*110*(k.^t-1)/log(k));
c = getFrequencyContourAutoCorr(x,2048,1024,sf);
c(1) = 110;
d = c;
groundTruth = log2(c);

for (i = 1:200)
	i
	noise = i/100*rand(1,length(x));
	it = getFrequencyContourAutoCorr(x+noise,2048,1024,sf);
	it(1) = 110;
	it = log2(it);
	logNoise(i) = 10*log10(i/100);
	err(i) = immse(groundTruth,it);
endfor

plot(logNoise,log10(err));
hold on;
plot(logNoise,log10(ones(1,length(logNoise))*0.59*10^(-6)));
grid;
hold off;
xlabel("Added White Noise (db)");
ylabel("Mean Square Pitch Error (log10)");
axis([min(logNoise) max(logNoise)]);

set(gca,'fontsize', 12)
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 30 8])
print -dpng 'NoiseRobustnessAutoCorr.png'
