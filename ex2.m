%dependency number of edges and mixing time
%random graph

min = 0.04;
bigStep = 0.04;
max1 = 0.8;
smallStep = 0.04;
max2 = 0.96;

line1x = cat(2, min:bigStep:max1, (max1 + smallStep):smallStep:max2);
line1y = zeros (1, round((max1 - min)/bigStep) + round((max2 - max1)/smallStep) + 1);
line2y = zeros (1, round((max1 - min)/bigStep) + round((max2 - max1)/smallStep) + 1);

counter = 1;
for i = min:bigStep:max1
    graph = randomGraph(100, 1, round(50*99*(1- i)));
    
    if ~isConnected(graph)
        fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    end
    [~, discardTime, restartTime] = methodsOnGraph(graph, 1);
    
    line1y(counter) = discardTime(1);
    line2y(counter) = restartTime(1);   
    
    counter = counter + 1;
end

for i = (max1 + smallStep):smallStep:max2
    graph = randomGraph(100, 1, round(50*99*(1- i)));
    
    [~, discardTime, restartTime] = methodsOnGraph(graph, 1);
    
    line1y(counter) = discardTime(1);
    line2y(counter) = restartTime(1);   
    
    counter = counter + 1;
end

plot(line1x, line1y, 'r', line1x, line2y, 'g');
    