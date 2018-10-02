multiplier = 1.0594631;
noteNumber = 24;
notes = 440*multiplier.^(0:noteNumber)
stem(0:(length(notes)-1),notes);
xlabel("Pitch (low to high)");
ylabel("Frequency");
set(gca,'XTick',0:2:noteNumber, 'fontsize', 20)
set(gca, 'xtickLabel', {
			'A',
			'B',
			'C#',
			'D#'
			'F'
			'G'
})
print -dpng 'Frequency-vs-Pitch.png'
