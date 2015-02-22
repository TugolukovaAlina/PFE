function graph = gridGraph(n, m)
%builds grid n by m
graph = zeros(n*m, n*m);
for i = 1:(n*m)
    if mod(i, m) ~= 0
        graph = addEdge(graph, i, i+1);
    end
    if i <= m*(n-1)
        graph = addEdge(graph, i, i+m);
    end
end

end

