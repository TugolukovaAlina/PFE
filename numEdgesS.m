%we assume that graph is undirected

function m = numEdgesS(adj)
    %m=sum(sum(adj))/2;
    % Number of nonzero matrix elements
    m = nnz(adj)/2;
end