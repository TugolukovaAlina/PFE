%dependency number of edges and mixing time
%random graph
numberOfNodes = 100;
numberOfExperiments = 20;

min = findMinRadiusRGG(numberOfNodes, 0.999);
step = 0.05;
max = sqrt(2);


line1x = zeros (1, round((max - min)/step) + 1);
line1y = zeros (1, round((max - min)/step) + 1);
line2y = zeros (1, round((max - min)/step) + 1);
line3y = zeros (1, round((max - min)/step) + 1);

for i=1:numberOfExperiments
    counter = 1;
    for r = min:step:max
        
        graph = randomGeometricGraph(numberOfNodes, r);

        if ~isConnected(graph)
            fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
            numberOfExperiments = numberOfExperiments - 1;
            break;
        else
            [~, eignValues] = methodsOnGraph(graph, [1, 2, 3], 1);
            

            %degree 
            line1x(counter) = line1x(counter) + averageDegree(graph);
            line1y(counter) = line1y(counter)  + (1 - eignValues(1));
            line2y(counter) = line2y(counter)  + (1 - eignValues(2));
            line3y(counter) = line3y(counter)  + (1 - eignValues(3));

            counter = counter + 1;
        end
    end

end

line1x = line1x /numberOfExperiments;
line1y = line1y /numberOfExperiments;
line2y = line2y /numberOfExperiments;
line3y = line3y /numberOfExperiments;

plot(line1x, line1y, 'r', 'LineWidth', 3);
hold on;
plot(line1x, line2y, 'g', 'LineWidth', 3);
hold on;
plot(line1x, line3y, 'b', 'LineWidth', 3);

legend('Metropolis', 'Local Degree', 'Max Degree');
xlabel ('average degree', 'FontSize', 16);
ylabel ('spectral gap', 'FontSize', 16);

    