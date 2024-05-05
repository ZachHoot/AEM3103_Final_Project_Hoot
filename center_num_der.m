function [fp_num] = center_num_der(x, y)
drl = length(x);

fp_num = nan*zeros(1, drl);
% Center distance aprox.
for i = 2:drl-1
    fp_num(i) = (y(i+1) - y(i-1))/(x(i+1) - x(i-1));
end
end