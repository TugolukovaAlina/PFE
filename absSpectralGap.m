function gap = absSpectralGap(P)
%returns the absolute spetral gap 1- lambda, where lambda is
%max(abs(lambda))
lambda = eig(P);
lambda = sort(lambda, 'descend');
lambda(1) = 0;
gap = 1 - max(abs(lambda));
end

