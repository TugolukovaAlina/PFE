function deg = maxDegree( adj)
%function return the maximum degree from all nodes
deg = 0;

num = numNodes(adj);
for i = 1:num
    if numberOfNeighbors(adj, i) > deg
        deg = numberOfNeighbors(adj, i);
    end
end

