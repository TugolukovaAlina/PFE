function answer = toDiscardAvg(P, experimentNumber)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if nargin ==1
    experimentNumber = 10;
end

mixingTime =  mixingTimeAvg(P);
fprintf('average mixingTime:%i \n', mixingTime);
mixingTime = ceil(mixingTime);

values = zeros(1, experimentNumber);
for i = 1:experimentNumber
    values(i) = findNeededNumberToDiscard(P, mixingTime);
end

answer = mean(values);

end

