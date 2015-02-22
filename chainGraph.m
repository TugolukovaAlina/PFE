function graph = chainGraph(size)

graph = zeros(size, size);

for i = 1:(size-1)
    graph = addEdge(graph,  i,  i+1);
end

graph = addEdge(graph,  1,  size);

% for i = 2:(size-1)
%     graph(i, i - 1) = 1;
%     graph(i, i + 1) = 1;
% end
% 
% graph(1, size) = 1;
% graph(1, 2) = 1;
% 
% graph(size, size - 1) = 1;
% graph(size, 1) = 1;

end

