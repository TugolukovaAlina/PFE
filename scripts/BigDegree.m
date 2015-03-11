%random graph with big node

numberOfNodes = 200;

graph = randomGraph(numberOfNodes, 0.05);
connected = isConnected(graph);
aveD = averageDegree(graph);
[maxD, nodeIndex] = maxDegree(graph);

min = numberOfNeighbors(graph, nodeIndex) ;
step = 1;
max = 80;


line1x = min:step:max;
[~, eignValues] = methodsOnGraph(graph, 2, 1);

line1y = zeros (1, round((max - min)/step) + 1);
line1y(1) = 1 - eignValues(1);

counter = 2;
edgeNum = 1;
while counter < max - min
    while (graph(nodeIndex, edgeNum) == 1 || edgeNum == nodeIndex )&& edgeNum < max 
        edgeNum = edgeNum + 1;
    end
    
     graph = addEdge(graph, nodeIndex, edgeNum);
 %    graph = addEdge(graph, 2, i);
     
     [~, eignValues] = methodsOnGraph(graph, 3, 1);
     line1y(counter) = 1 - eignValues(1);
%   line2y(counter) = 1 - eignValues(2);
%    line3y(counter) = 1 - eignValues(3);
     counter = counter + 1;
end


plot(line1x, line1y, 'r', 'LineWidth', 3);
hold on;
% plot(line1x, line2y, 'g', 'LineWidth', 3);
% hold on;
% plot(line1x, line3y, 'b', 'LineWidth', 3);
% 
% legend('Metropolis', 'Local Degree', 'Max Degree');
xlabel ('degree of the max degree node', 'FontSize', 14);
ylabel ('spectral gap', 'FontSize', 14);
