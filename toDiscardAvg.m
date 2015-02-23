function answer = toDiscardAvg(P, mixingTime, experimentNumber)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if nargin == 1
    mixingTime =  findMixingTime(P);
end

if nargin <= 2
    experimentNumber = 10;
end



%mixingTime =  findMixingTime(P);
%fprintf('mixingTime:%i \n', mixingTime);

values = zeros(1, experimentNumber);
for i = 1:experimentNumber
    values(i) = findNeededNumberToDiscard(P, mixingTime);
end

answer = mean(values);

end

