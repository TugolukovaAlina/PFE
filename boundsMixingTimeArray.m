function  boundsMixingTimeArray( P, pi, eps)

lambda = eigs(P);
fprintf(' lambda2 %i \n\n', lambda(2));
fprintf(' spectral gap%i \n\n', 1 - lambda(2));

for i=1:length(eps)
maxtime = log(1/(eps(i)*pi)) * (1/(1 - lambda(2)));
fprintf(' maxtime %i \n\n', maxtime);
end

end

