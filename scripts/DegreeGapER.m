%dependency number of edges and mixing time
%random graph

min = 0.05;
step = 0.05;
max = 1;

numberOfNodes = 1000;
numberOfExperiments = 20;

line1x = (min:step:max)*numberOfNodes;
line1y = zeros (1, round((max - min)/step) + 1);
line2y = zeros (1, round((max - min)/step) + 1);
line3y = zeros (1, round((max - min)/step) + 1);

%p is probability to connect two edges

for i=1:numberOfExperiments
    counter = 1;
    for p = min:step:max

        graph = randomGraphS(numberOfNodes, floor(numberOfNodes*(numberOfNodes - 1)*p/2));
        %graph = randomGraph(numberOfNodes, p);

        if ~isConnected(graph)
            fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
            numberOfExperiments = numberOfExperiments - 1;
            break;
        else
            [~, eignValues] = methodsOnGraph(graph, [1, 2, 3], 1);

            line1y(counter) = line1y(counter)  + (1 - eignValues(1));
            line2y(counter) = line2y(counter)  + (1 - eignValues(2));
            line3y(counter) = line3y(counter)  + (1 - eignValues(3));

            counter = counter + 1;
        end
    end

end

plot(line1x, line1y/numberOfExperiments, 'r', 'LineWidth', 3);
hold on;
plot(line1x, line2y/numberOfExperiments, 'g', 'LineWidth', 3);
hold on;
plot(line1x, line3y/numberOfExperiments, 'b', 'LineWidth', 3);

legend('Metropolis', 'Local Degree', 'Max Degree');
xlabel ('average degree', 'FontSize', 14);
ylabel ('spectral gap', 'FontSize', 14);

    