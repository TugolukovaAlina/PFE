%dependency number of edges and mixing time
%random graph

min = 0.05;
step = 0.05;
max = 1;

line1x = cat(2, min:step:max);
line1y = zeros (1, round((max - min)/step) + 1);
line2y = zeros (1, round((max - min)/step) + 1);

counter = 1;
%p is probability to connect two edges
for p = min:step:max
    graph = randomGraph(100, p);
    
    if ~isConnected(graph)
        fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        break;
    else
        [~, discardTime, restartTime] = methodsOnGraph(graph, 1);

        line1y(counter) = discardTime(1);
        line2y(counter) = restartTime(1);   

        counter = counter + 1;
    end
end

plot(line1x, line1y, 'r', line1x, line2y, 'g');
    