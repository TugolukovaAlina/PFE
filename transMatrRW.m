function P = transMatrRW(adj)

num = numNodes(adj);
P = zeros(num);
for i = 1:num
    sum = 0;
    di = numberOfNeighbors(adj, i);
    for j = 1:num
        if adj (i, j)  == 1 && i ~= j
            P (i, j) = 1/di;
            sum = sum + P (i, j);
        else
            P (i, j) = 0;
        end
    end
    P(i, i) = 1 - sum;
end
