function deg = maxDegreeSparse( adj)
%function return the maximum degree from all nodes
deg = 0;

num = numNodes(adj);
for i = 1:num
    numOfNeighborsOfi = numberOfNeighborsSparse(adj, i); 
    if numOfNeighborsOfi > deg
        deg = numOfNeighborsOfi;
    end
end

