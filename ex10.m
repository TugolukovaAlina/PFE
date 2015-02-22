%dependency number of edges and eigen values
%almostConnectedGraph
min = 100;
step = 100;
max = 500;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);
line3y = zeros (1, floor((max-min)/step) + 1);

fraction = 0.1;
counter = 1;
for i = min:step:max
    graph = almostCompleteGraph(i, fraction);   
    
    eignValues = eignMethods(graph);
    line1y(counter) = eignValues(1);
    line2y(counter) = eignValues(2);
    line3y(counter) = eignValues(3);
    
    counter = counter + 1;

    fprintf('finished here \n');
end

plot(line1x, line1y, 'r', line1x, line2y, 'g',  line1x, line3y, 'b');
