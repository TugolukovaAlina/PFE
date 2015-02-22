function rtime = findTime(P, min , max) 

%min max rtime
if nargin == 1
    min = 2;
    max = 150;
end

%begin with the first node
initialDistribution = zeros (1, length(P));
initialDistribution(randi(length(P))) = 1;

numberInOne = length(P);
lastSamples = zeros(1, numberInOne);

for rtime = min:max
    %we will take length(P) samples starting each time from the beggining
    
    %fprintf('rtime %i ', rtime);
    
    for j = 1 : numberInOne
        samples = takeSamples(initialDistribution, P, rtime);
        lastSamples(j) = samples(rtime);         
    end
    

  [~, pvalue ,~]=chi2gof(lastSamples, 'cdf' ,@(z)unidcdf(z, length(P)));
   if pvalue > 0.05
       return;
   end
end

end

%     currentDistribution = hist(lastSamples, numberInOne)/numberInOne;
%     distance = 0;
%     for i = 1:numberInOne
%         distance = distance + abs(currentDistribution(i) - 1/length(P));
%     end
%     distance = distance/2;
%     if distance < 1/2
%         return;
%     end