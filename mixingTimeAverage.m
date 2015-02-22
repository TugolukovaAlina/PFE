function answer = mixingTimeAverage(P, max, experimentNumber)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if nargin ==1
    experimentNumber = 10;
end

values = zeros(1, experimentNumber);
for i = 1:experimentNumber
    values(i) = findMixingTime(P, max);
end

answer = mean(values);

end

