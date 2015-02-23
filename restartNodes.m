%dependency number of edges and mixing time
%almostConnectedGraph
min = 100;
step = 100;
max = 700;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);


counter = 1;

numberOfExperiments = 1;
for j = 1:numberOfExperiments
    counter = 1;
    for i = min:step:max
        
        p = findMinProbER(i, 0.98);
        graph = randomGraph(i, round(i*(i-1)*p/2));
        
        if ~isConnected(graph)
                fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        end

        [~, ~, ~, discardTime, restartTime] = methodsOnGraph(graph, 2, [3, 4]);

        line1y(counter) = line1y(counter) + discardTime(1);
        line2y(counter) = line2y(counter) + restartTime(1);   

        counter = counter + 1;
    end
end

line1y = line1y/numberOfExperiments;
line2y = line2y/numberOfExperiments;

plot(line1x, line1y, 'r', 'LineWidth', 3);
hold on;
plot(line1x, line2y, 'g', 'LineWidth', 3);

legend('discard', 'restart');
xlabel ('fraction of edges',  'FontSize', 16);
ylabel ('# of steps',  'FontSize', 16);
    