t = 0:1/100:3;
x1 = sin(2*pi*t*1);
x2 = sin(2*pi*t*2);
x  = (x1 .+ x2)/2;

y1 = sin(2*pi*t*2);
y2 = sin(2*pi*t*3);
y  = (y1 .+ y2)/2;

plot(t,x1,"linewidth", 2);
hold on
plot(t,x2,"linewidth", 2);
hold off
title("Individual");
xlabel("Time");
ylabel("Amplitude");
set(gca,'XTick', [], 'YTick', [0], 'fontsize', 30)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 15 5])
grid;
print -dpng 'HarmonyOctaveSeparate'

plot(t,x,"linewidth", 2);
hold on;
plot([1,1],[-1,1],"color", 'k',"linestyle",'--');
plot([2,2],[-1,1],"color", 'k',"linestyle",'--');
hold off;
title("Superposition");
xlabel("Time");
ylabel("Amplitude");
set(gca,'XTick', [], 'YTick', [0], 'fontsize', 30)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 15 5])
grid;
print -dpng 'HarmonyOctaveSuper.png'

plot(t,y1,"linewidth", 2);
hold on
plot(t,y2,"linewidth", 2);
hold off;
title("Individual");
xlabel("Time");
ylabel("Amplitude");
set(gca,'XTick', [], 'YTick', [0], 'fontsize', 30)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 15 5])
grid;
print -dpng 'HarmonyFifthSeparate'

plot(t,y,"linewidth", 2);
hold on;
plot([1,1],[-1,1],"color", 'k',"linestyle",'--');
plot([2,2],[-1,1],"color", 'k',"linestyle",'--');
hold off;
title("Superposition");
xlabel("Time");
ylabel("Amplitude");
set(gca,'XTick', [], 'YTick', [0], 'fontsize', 30)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 15 5])
grid;
print -dpng 'HarmonyFifthSuper.png'
