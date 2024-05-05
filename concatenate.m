function [xaExport] = concatenate (xa, ta)
drl = length(ta);
xaExport = zeros(101,1);
for j = 1:drl
    sum = 0;
for i = 1:100
    sum = sum + xa(j,i);

end
sum = sum / length(ta);
xaExport(j) = sum;
end
end