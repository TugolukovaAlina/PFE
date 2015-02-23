%dependency mixing time and eigen values
%ER graph


min = 0.056;
step = 0.001;
max = 1;

line1x = zeros (1, round((max - min)/step) + 1);
line1y = zeros (1, round((max - min)/step) + 1);


counter = 1;
%p is probability to connect two edges
p = min;
while p < max
    graph = randomGraph(100, p);
    
    if ~isConnected(graph)
        fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        break;
    else       
        [~, eignValue, mixingTime] = methodsOnGraph(graph, 1, [1, 2]);
        line1y(counter) = eignValue;
        line1x(counter) = mixingTime;

        counter = counter + 1;
        
    end
     
    p = p + counter*step;
end

scatter(line1x, line1y);
