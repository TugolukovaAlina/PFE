function lastSamples = takeMSamples(initialDistribution, P, stop_number, number)
% take 'number' of samples, each time starting from begginig and take 'last' element 
if nargin == 3
    number = length(P);
end

% fprintf ('%i - %i', stop_number, number);
lastSamples = zeros(1, length(P));
for j = 1 : number
    samples = takeSamples(initialDistribution, P, stop_number);
    lastSamples(j) = samples(stop_number);         
end

end