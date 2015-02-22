function graph = removeEdge(graph, vertex1, vertex2)
    graph(vertex1, vertex2) = 0;
    graph(vertex2, vertex1) = 0;
end

