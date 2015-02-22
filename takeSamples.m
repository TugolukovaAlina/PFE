function samples = takeSamples(inititialDistribution, P, number, step)

close all;

if nargin == 3
    step = 1;
end

if inititialDistribution == 0
    inititialDistribution = zeros(1, length(P));
    inititialDistribution(randi(length(P))) = 1;
end

samples = zeros(1, number);
histValues = zeros(1, length(P));
%generate first sample
samples(1) = generateRV(inititialDistribution);

for i = 2:number*step
    %acually isSymmetric should be used, but to perform is Symmetric is
    %expensive, so I suppose that matrix is symmetric 
  if (issparse(P))
    samples(i) = generateRV(P (:, samples(i-1))); % take the i-1 column, the same because symetric, but computations are much quicker
  else
   samples(i) = generateRV(P (samples(i-1), :)); % take the i-1 row
  end
end

end