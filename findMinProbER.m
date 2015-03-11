function prob = findMinProbER(n, p)

%returns the minimum radius for RGG(n, r) to be connected with probability p

alpha = -log(-log(p));
prob = (log(n))/n;

end

