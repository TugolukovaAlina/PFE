% returns the number of neighbors of node j

function n = numberOfNeighborsSparse (adj, j)
n = nnz(adj(:, j));

