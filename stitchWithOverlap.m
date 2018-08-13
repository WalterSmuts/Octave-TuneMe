function out = stitchWithOverlap(input,overlap)
	prev = zeros(1,length(input(1,:)));
	prev(length(prev)-overlap+1:length(prev)) = input(1,1:overlap)
	out = [];

	for (i = 1:length(input(:,1)))
		worked = input(i,1:overlap);
		worked = prev(length(prev)-overlap+1:length(prev)) .+ worked;
		worked = worked ./ 2;
		worked = [worked input(i,overlap+1:length(prev)-overlap)];

		out = [out worked];
		prev = input(i,:);
	endfor
endfunction
