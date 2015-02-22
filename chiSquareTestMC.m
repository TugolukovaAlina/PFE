function answer = chiSquareTestMC(samples, size)
% chi-square test

% transition count

trCount = zeros(size, size);
for i = 1:(length(samples) - 1)
    trCount (samples(i), samples(i+1)) = trCount (samples(i), samples(i+1)) + 1;
end

%chi value
chi = 0;
n = length(samples) - 1;


Fi = zeros(size);
Fj = zeros(size);
for i =1:size
    Fi(i) =  sum(trCount(i, :));
    Fj(i) =  sum(trCount(:, i));
end

for i =1:size
    f_i = Fi(i);
    for j = 1:size
        f_j = Fj(j);
        f_ij = trCount(i, j);
        
        if f_i ~= 0 && f_j ~= 0 
         chi = chi + ((f_ij - f_i*f_j/n)^2)/(f_i*f_j/n);
        end
    end
end

alpha = 0.05;

if chi2inv(1 - alpha, (size - 1)^2) > chi
    answer = 1;
else
    answer = 0;
end
end

