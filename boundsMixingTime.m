function bounds = boundsMixingTime( lambda, pi, eps)

if nargin == 2
    eps = 0.01;

%lambda = eigs(P);
% fprintf('%i \n\n', lambda);
%mintime = (1/(2*log(2*eps))) * (lambda(2)/(1 - lambda(2)));

maxtime = log(1/(eps*pi)) * (1/(1 - lambda));

bounds = maxtime;
end
