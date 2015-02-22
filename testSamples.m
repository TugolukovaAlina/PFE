function H = testSamples(samples, step)

close all;

if nargin == 1
    step = 1;
end

%take each step value
samples = samples(step*(1:floor(length(samples)/step)));
hist(samples, max(samples));

%chi-square test
[H, pvalue ,~]=chi2gof(samples, 'cdf' ,@(z)unidcdf(z, max(samples)));
fprintf('p value  %i \n', pvalue);

end