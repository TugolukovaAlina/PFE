function rtime = findTime(P, min , max) 


%min max rtime
if nargin == 1
    min = 1;
    max = 1000;
end
%begin with the first node
initialDistribution = zeros (1, length(P));
initialDistribution(1) = 1;


lastSamples = zeros(1, length(P));

for rtime = min:max
    %we will take length(P) samples starting each time from the beggining
    for j = 1 : length(P)
        samples = takeSamples(initialDistribution, P, rtime);
        lastSamples(j) = samples(rtime);         
    end
    
    fprintf('len %i', length(lastSamples));
    [~, pvalue ,~]=chi2gof(lastSamples, 'cdf' ,@(z)unidcdf(z, length(P)));
    if pvalue > 0.05
        return;
    end
end

end