function samples = simulLD(graph)

lengthG = length(graph);

%choose random node from all length(graph) nodes
node = randi([0 lengthG] , 1, 1);

%probability to go to neighbors
P = zeros(lengthG);
sum = 0;
for j = 1:lengthG
    if graph (node, j)  == 1 && node ~= j
        di = numberOfNeighbors(graph, node);
        dj = numberOfNeighbors(graph, node);
        P (j) = 1/(di + dj);
        sum = sum + P (j);
    else
        P (j) = 0;
    end
end
P(node) = 1 - sum;

%distr fun


samples = r;
end