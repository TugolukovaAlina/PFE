%dependency mixing time and eigen values
%ER graph
min = 0.04;
step = 0.005;
max = 1;

line1x = zeros (1, round((max - min)/step) + 1);
line1y = zeros (1, round((max - min)/step) + 1);
counter = 1;
%f is fraction
f = min;
while f <= 1
    graph = almostCompleteGraph(100, (1-f));
    
    if ~isConnected(graph)
        fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        break;
    else       
        [~, eignValue, mixingTime] = methodsOnGraph(graph, 1, [1, 2]);
        line1y(counter) = eignValue;
        line1x(counter) = mixingTime;

        counter = counter + 1;
        
        if eignValue < 0.9
            step = 0.05;
        end
    end
     
    f = f + step;
end

scatter(line1x, line1y);
