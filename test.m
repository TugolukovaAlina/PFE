function test()

size = 1000000;
x = zeros(1, size);
for i = 1:size
    x(i) = generateRV(ones(1, 100)/100);
end

hist(x);
[H,P,STATS]=chi2gof(x, 'cdf' ,@(z)unidcdf(z, size));
fprintf('%i', H);

end