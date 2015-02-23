%dependency number of edges and mixing time
%random graph

min = 0.06;
bigStep = 0.02;
max1 = 0.2;
smallStep = 0.08;
max2 = 1;

line1x = zeros (1, round((max1 - min)/bigStep) + round((max2 - max1)/smallStep) + 1);
line1y = zeros (1, round((max1 - min)/bigStep) + round((max2 - max1)/smallStep) + 1);
line2y = zeros (1, round((max1 - min)/bigStep) + round((max2 - max1)/smallStep) + 1);



numberOfExperiments = 5;
for j = 1:numberOfExperiments
    counter = 1;
        for i = min:bigStep:max1
            graph = randomGraph(100, i);
            
            if ~isConnected(graph)
                fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                return;
            end
            [~, ~, ~, discardTime, restartTime] = methodsOnGraph(graph, 1, [3, 4]);

            line1x(counter) = line1x(counter) + averageDegree(graph);
            line1y(counter) = line1y(counter) + discardTime(1);
            line2y(counter) = line2y(counter) + restartTime(1);   

            counter = counter + 1;
        end
        
        if secondLoop
            for i = (max1 + smallStep):smallStep:max2
                graph = randomGraph(100, i);

                [~, ~, ~, discardTime, restartTime] = methodsOnGraph(graph, 1, [3, 4]);

                line1x(counter) = line1x(counter) + averageDegree(graph);
                line1y(counter) = line1y(counter) + discardTime(1);
                line2y(counter) = line2y(counter) + restartTime(1);   

                counter = counter + 1;
            end
        end

end

line1x = line1x/numberOfExperiments;
line1y = line1y/numberOfExperiments;
line2y = line2y/numberOfExperiments;

plot(line1x, line1y, 'r', 'LineWidth', 3);
hold on;
plot(line1x, line2y, 'g', 'LineWidth', 3);

legend('discard', 'restart');
xlabel ('average degree',  'FontSize', 16);
ylabel ('# of steps',  'FontSize', 16);
    