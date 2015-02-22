function comp = comparisonSparse ( values, pi, eps)

if nargin == 2
    eps = 0.01;
comp = [boundsMixingTime(values(1), pi, eps), boundsMixingTime(values(2), pi, eps), boundsMixingTime(values(3), pi, eps)];


% from = 0.01;
% step = 0.05;
% to = 0.51;
% comp = zeros((from - to)/step, 4);
% j = 1;
% for i = from : step : to
%     comp(j, :) = [i, boundsMixingTime(values(1), pi, i), boundsMixingTime(values(2), pi, i), boundsMixingTime(values(3), pi, i)];
%     j = j + 1;
% end
% 
% plot(comp(:, 2), comp(:, 1), comp(:, 3), comp(:, 1), comp(:, 4), comp(:, 1))



end

