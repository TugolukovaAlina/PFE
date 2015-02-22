function mintime = minMixingTime( lambda, omega, delta, eps)
%omega is the state space
%delta is max number of states accessible from state

if nargin == 3
    eps = 0.5;

mintime = log((1-eps)*omega)/log(delta);

end
