t = 0:1/44100:1/440*3;
x = sin(2*pi*t*440);
x = 0.8*x + 0.2;

plot(t,x,"linewidth", 2);
xlabel("Time (s)");
ylabel("Amplitude");
set(gca,'YTick', [-1 0 1], 'fontsize', 30)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 20 5])
grid;
print -dpng 'ZeroCrossingRaised.png'
