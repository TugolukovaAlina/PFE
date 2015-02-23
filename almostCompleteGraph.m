function graph = almostCompleteGraph(size, fraction)

%returns graph that obtained by removing fraction of edges from complete 

graph = completeGraph(size);

% we are taking fraction from all edges size*(size-1)/2
i = 1;
while i <= floor(size*(size-1)*fraction/2)
   
    %choose vertex 1 with positive degree
    %to keep graph connected don't pick vertices with only 1 neighbor
    vertex1 = randi(size);
    while numberOfNeighbors(graph, vertex1) < 2
       vertex1 = randi(size);  
    end
    
    %choose vertex 2 different from vertex1 and that the vertices are
    %connected by an edge    
    %to keep graph connected don't remove edge if it is the only edge of v2 that connects it to the graph
    vertex2 = vertex1;    
    while vertex2 == vertex1 || graph(vertex1, vertex2) == 0 || numberOfNeighbors(graph, vertex2) < 2
        vertex2 = randi(size);   
    end
    
    
    %if graph is not connected after removing chosen edge, put it back
     graph = removeEdge(graph, vertex1, vertex2);
     i = i + 1;
     
     %comment nest 4 lines to increase performance
   if ~isConnected(graph)
       graph = addEdge(graph, vertex1, vertex2);
       i = i - 1;
   end
   
   
   %if graph is tree no edges can be removed
   
   if(sum(sum(graph))/2 == length(graph) - 1)
       return;
   end
   
end

end

