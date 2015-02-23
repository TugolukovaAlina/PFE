function P = transMatrCTRD (adj, dmax)

if nargin == 1
    dmax = maxDegree(adj);
end

num = numNodes(adj);
P = zeros(num);
for i = 1:num
    sum = 0;
    for j = 1:num
        if adj (i, j)  == 1 && i ~= j
            P (i, j) = 1/dmax;
            sum = sum + P (i, j);
        else
            P (i, j) = 0;
        end
    end
    P(i, i) = 1 - sum;
end