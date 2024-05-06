function [fp_num] = center_num_der(x, y)
    drl = length(x);
    
    fp_num = nan*zeros(1, drl);
    % Center distance aprox. method
    for i = 2:drl-1
        fp_num(i) = (y(i+1) - y(i-1))/(x(i+1) - x(i-1));
    end

    % Edge calculation (forward and backward difference methods)
    fp_num(1) = (y(2) - y(1))/(x(2)-x(1));
    fp_num(drl) = (y(drl)-y(drl-1))/(x(drl)- x(drl-1));

end