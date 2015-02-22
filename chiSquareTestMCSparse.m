function answer = chiSquareTestMCSparse(samples, size)
% chi-square test for sparse matrices
%not finished

trCount = zeros(size, size);
for i = 1:(length(samples) - 1)
    trCount (samples(i), samples(i+1)) = trCount (samples(i), samples(i+1)) + 1;
end


%chi value
chi = 0;
n = length(samples) - 1;
for i =1:size
    for j = 1:size
        f_i = sum(trCount(i, :));
        f_j = sum(trCount(:, j));
        f_ij = trCount(i, j);
        
        if f_i ~= 0 && f_j ~= 0 
         chi = chi + ((f_ij - f_i*f_j/n)^2)/(f_i*f_j/n);
         %chi = chi + ((f_ij - f_i*f_j/(n - f_j))^2)/(f_i*f_j/(n - f_j));
        end
    end
end

alpha = 0.05;
%fprintf ('chi - %i \n', chi);
%fprintf ('chi2inv(1 - alpha, (size - 1)^2) - %i \n', chi2inv(1 - alpha, size*(size - 1)));
%fprintf ('chi2inv(1 - alpha, (size - 1)^2) - %i \n', chi2inv(1-alpha, (size - 1)^2));


if chi2inv(1 - alpha, (size - 1)^2) > chi
    answer = 1;
else
    answer = 0;
end
end

