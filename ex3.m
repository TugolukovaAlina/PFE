%dependency number of edges and mixing time
% RGG

numberOfNodes = 100;
numberOfSamples = 10;
min = findMinRadiusRGG(numberOfNodes, 0.999);
step = (max - min)/(numberOfSamples-1);
max = 1;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);


counter = 1;
for i = min:step:max
    graph = randomGeometricGraph(100, i);
    
     while ~isConnected(graph)
          graph = randomGeometricGraph(100, i);
    end

    [~, ~, ~, discardTime, restartTime] = methodsOnGraph(graph, 1, [3, 4]);
    line1y(counter) = discardTime(1);
    line2y(counter) = restartTime(1);   
    
    counter = counter + 1;
end

plot(line1x, line1y, 'r', line1x, line2y, 'g');

    