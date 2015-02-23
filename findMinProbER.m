function prob = findMinProbER(n, p)
%not right
%returns the minimum radius for RGG(n, r) to be connected with probability p

alpha = -log(-log(p));
prob = (alpha + log(n))/n;

end

