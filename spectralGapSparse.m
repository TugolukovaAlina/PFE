function gap = spectralGapSparse(P)
%returns spectral gap value of matrix P = 1 - lambda2

lambda = eigs(P);
fprintf('%i \n\n', lambda);
gap = 1 - lambda(2);

end

