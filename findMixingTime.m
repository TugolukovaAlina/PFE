function step = findMixingTime(P, max, ditstributionToCompare,  eps)

if nargin == 1
    max = 1000;
    ditstributionToCompare = ones(1, length(P))/length(P);
    eps = 0.05;
end

for step = 1:max
  P = P*P;
  if (variationDistance(P, ditstributionToCompare) < eps)
      return;
  end
end


% not right
% if nargin == 1
%     max = 1000;
% end
% 
% initialDistribution = zeros (1, length(P));
% initialDistribution(randi(length(P))) = 1;
% 
% samples = takeSamples(initialDistribution, P, length(P));
% % put last sample on the first place
% 
% % I will continue to substitute first values with new generated values
% for step = 1:max
%    [~, pvalue ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, length(P)));
%    if pvalue > 0.05
%        return;
%    end
%    samples(mymod(step, length(P))) = generateRV(P (:, samples(mymod(step - 1, length(P)))));
% 
% end

end

