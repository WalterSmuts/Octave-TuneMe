pkg load image;
addpath("../Vocoder-Method-Rewrite/");
sf = 44100;
t = 0:1/sf:5;

k = (2)^(1/5);
x = sin(2*pi*110*(k.^t-1)/log(k));
correct = getCorrectedPitch(x,2048,512,sf);
correctX2 = getCorrectedPitch(correct,2048,512,sf);

100*max(xcorr(correctX2,correct))/max(xcorr(correct))
100*max(xcorr(correctX2,correct))/max(xcorr(correctX2))

subplot(1,3,1);
specgramlog(x,2048,sf);
title("No correction");
set(gca,'fontsize', 20)

subplot(1,3,2);
specgramlog(correct,2048,sf);
title("Single correction");
set(gca,'fontsize', 20)

subplot(1,3,3);
specgramlog(correctX2,2048,sf);
title("Double correction");
set(gca,'fontsize', 20)

%print -dpng 'DistortionPVZCM.png'
