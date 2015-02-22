%dependency number of edges and mixing time
%almostConnectedGraph
min = 0.04;
step = 0.04;
max = 1;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);


counter = 1;
for i = min:step:max
    graph = almostCompleteGraph(100, (1-i));
    
    [~, discardTime, restartTime] = methodsOnGraph(graph, 1);
    
    line1y(counter) = discardTime(1);
    line2y(counter) = restartTime(1);   
    
    counter = counter + 1;
end

plot(line1x, line1y, 'r', line1x, line2y, 'g');

    