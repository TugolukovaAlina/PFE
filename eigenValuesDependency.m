%dependency number of edges and eigen values
%almostConnectedGraph
min = 0.04;
step = 0.04;
max = 1;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);
line3y = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max
    graph = almostCompleteGraph(100, (1-i));   
    
    eignValues = eignMethods(graph);
    line1y(counter) = eignValues(1);
    line2y(counter) = eignValues(2);
    line3y(counter) = eignValues(3);
    
    counter = counter + 1;
end

plot(line1x, line1y, 'r', line1x, line2y, 'g',  line1x, line3y, 'b');

    