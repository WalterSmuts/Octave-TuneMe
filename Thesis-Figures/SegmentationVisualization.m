addpath("../Vocoder-Method-Rewrite/");
set(gca, 'fontsize', 30)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 5])
[x sf] = audioread("hello.wav");
start  = 2048;
finish = 2048*3;
offset = 7500;
x = x((start+offset):(finish+offset));
x = hann(length(x)).*x;

seg = segment(x,2048,2048/2);

subplot(2,1,1);
plot(x);
title("Original");
xlabel("Sample Number");
ylabel("Amplitude");
axis([1 length(x) -0.801 0.801]);
grid;

subplot(2,3,4);
plot(seg(:,1));
title("Segment 1");
ylabel("Amplitude");
axis([1 length(seg(:,1)) -0.801 0.801]);
grid;

subplot(2,3,5);
plot(2048/2:(2048*1.5-1),seg(:,2));
title("Segment 2");
ylabel("Amplitude");
axis([2048/2 (2048*1.5-1) -0.801 0.801]);
grid;

subplot(2,3,6);
plot(2048:(2048*2-1),seg(:,3));
title("Segment 3");
ylabel("Amplitude");
axis([2048 (2048*2-1) -0.801 0.801]);
grid;

print -dpng 'SegmentationVisualization.png'
