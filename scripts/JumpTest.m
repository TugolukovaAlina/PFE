size = 100;
graph = randomGraph(size, 0.08);

alpha = averageDegree(graph)/8;



P = transMatrJUMP(graph, alpha);
init = [1, zeros(1, size - 1)];

number = 100000;
samples = takeSamples(init, P, number);

newSamples = zeros(1, number);
newSamples(1) = 0;
counter = 2;
for i = 1:number-1
    if graph(samples(i), samples(i + 1)) == 0 && newSamples(counter - 1) ~= samples(i)
        newSamples(counter) = samples(i);
        counter = counter + 1;
        
        newSamples(counter) = samples(i + 1);
        counter = counter + 1;
    end
end

[~, ~, newSamples] = find(newSamples);
fprintf('answer %i \n', chiSquareTestMC(newSamples, size));

[~, pvalue ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, size));
if pvalue <= 0.05
   fprintf('!!! not uniform 0 \n');
end

[~, pvalue ,~] = chi2gof(samples(1:length(newSamples)), 'cdf' ,@(z)unidcdf(z, size));
if pvalue <= 0.05
   fprintf('!!! not uniform 1 \n');
end

[~, pvalue ,~] = chi2gof(samples(1:2:2*length(newSamples)), 'cdf' ,@(z)unidcdf(z, size));
if pvalue <= 0.05
   fprintf('!!! not uniform 2 \n');
end

[~, pvalue ,~] = chi2gof(cat(2, samples(1:floor(length(newSamples)/2)), randi([1 size], 1, ceil(length(newSamples)/2))), 'cdf' ,@(z)unidcdf(z, size));
if pvalue <= 0.05
   fprintf('!!! not uniform 3 \n');
end

[~, pvalue ,~] = chi2gof(newSamples, 'cdf' ,@(z)unidcdf(z, size));
if pvalue <= 0.05
   fprintf('!!! not uniform 4 \n');
end

