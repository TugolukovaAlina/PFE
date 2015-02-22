function graph = chainGraphSparse(size)

index = 1;
graphI = zeros(1, 2*size);
graphJ = zeros(1, 2*size);
values = ones(1, 2*size);

for i = 2:(size-1)
    addInGraph(i, i - 1);
    addInGraph(i, i + 1);
end

%for 1st row
addInGraph(1, 2);
addInGraph(1, size);

%for last row
addInGraph(size, 1);
addInGraph(size, size - 1);

    function addInGraph(ind_i, ind_j)
        graphI(index) = ind_i;
        graphJ(index) = ind_j;
        index = index + 1;
    end

graph = sparse(graphI, graphJ, values, size, size, 2*size);

end



