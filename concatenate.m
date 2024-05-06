function [xaExport] = concatenate (xa, ta)
    drl = length(ta);
    xaExport = zeros(101,1);
    for j = 1:drl
        sum = 0; %Reset Variable
        for i = 1:100
            sum = sum + xa(j,i); %summing function
        
        end
        sum = sum / length(ta); %average function
        xaExport(j) = sum; %stores average against time
    end
end