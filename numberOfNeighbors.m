% returns the number of neighbors of node j

function n = numberOfNeighbors (adj, j)
n = nnz(adj(:, j));
