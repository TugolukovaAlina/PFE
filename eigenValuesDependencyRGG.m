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
line3y = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max
    graph = randomGeometricGraph(100, i);
    
     while ~isConnected(graph)
          graph = randomGeometricGraph(100, i);
    end

  eignValues = eignMethods(graph);
        line1y(counter) = eignValues(1);
        line2y(counter) = eignValues(2);
        line3y(counter) = eignValues(3);

        counter = counter + 1;
end

plot(line1x, line1y, 'r', line1x, line2y, 'g', line1x, line3y, 'b');

    