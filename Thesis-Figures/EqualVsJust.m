multiplier = 1.0594631;
noteNumber = 12;
notes = multiplier.^(0:noteNumber)

notesB = [1 1.066 1.125 1.2 1.25 1.33 1.4 1.5 1.6 1.666 1.777 1.875 2]

scatter(0:(length(notes)-1),notes,150,"r",'+');
hold on;
scatter(0:(length(notesB)-1),notesB,150,"b",'x');
hold off;
grid
h = legend("Equal Tuning                ","Just Tuning","location","northwest");
set (h, "fontsize", 20);
xlabel("Pitch (low to high)");
ylabel("Interval Ratio");
title("Equal vs Just Interval Ratio")
set(gca,'XTick',0:1:noteNumber, 'fontsize', 20)
set(gca, 'xtickLabel', {
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
print -dpng 'EqualVsJust.png'

stem(0:(length(notesB)-1),(notesB.-notes)*100)
grid
xlabel("Pitch (low to high)");
ylabel("Error as %");
title("Error of Equal Tempered Tuning")
set(gca,'XTick',0:1:noteNumber, 'fontsize', 20)
set(gca, 'xtickLabel', {
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
print -dpng 'ErrorEqual.png'
