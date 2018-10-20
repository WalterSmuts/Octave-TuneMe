addpath("../AutoCorr/");
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 6])
set(gca,'fontsize', 12)

[x sf] = audioread("singing.wav");
start  = 1024;
finish = 2048;
offset = 10000;
x = x((offset + start):(offset + finish));
xclip = clip(x,0.6*max(abs(x)));
t = 0:1/sf:1024/sf;

xAutoCorr = xcorr(x);
xAutoCorr = xAutoCorr(ceil(length(xAutoCorr)/2):end);
xClipAutoCorr = xcorr(xclip);
xClipAutoCorr = xClipAutoCorr(ceil(length(xClipAutoCorr)/2):end);
size(t)
size(xClipAutoCorr)

subplot(2,2,1);
plot(t,x,"linewidth", 2);
title("Original Signal");
xlabel("Time (s)")
grid;

subplot(2,2,2);
plot(t,xclip,"linewidth", 2);
title("Clipped Signal");
xlabel("Time (s)")
grid;

subplot(2,2,3);
plot(t, xAutoCorr,"linewidth", 2);
title("Original Signal forward Autocorrelation");
xlabel("Delay (s)")
grid;

subplot(2,2,4);
plot(t, xClipAutoCorr,"linewidth", 2);
title("Clipped Signal forward Autocorrelation");
xlabel("Delay (s)")
grid;

print -dpng 'ClipVsNoDemo.png'
