function maxtime = maxMixingTime( lambda, pi, eps)

if nargin == 2
    eps = 0.5;

maxtime = log(1/(eps*pi)) * (1/(1 - lambda));
end
