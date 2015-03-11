%dependency number of edges and eigen values
%almostConnectedGraph
min = 100;
step = 5000;
max = 50100;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);
line3y = zeros (1, floor((max-min)/step) + 1);

p = 0.06;
counter = 1;

numberOfExperiments = 10;
for i = min:step:max

   eignValues = [0, 0, 0];
   p = findMinProbER(i, 0.99);
    for j = 1:numberOfExperiments
        %graph = randomGraphS(i, i*(i-1)*p/2);       
        graph = randomGraphS(i, round(i*(i-1)*p/2));
        
        while ~isConnected(graph)
                fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                graph = randomGraphS(i, round(i*(i-1)*p/2));
        end
        
        v = eignMethods(graph);
        eignValues = eignValues + v;
    end
    fprintf('\n');
    eignValues = eignValues/numberOfExperiments;

    line1y(counter) = 1 - eignValues(1);
    line2y(counter) = 1 - eignValues(2);
    line3y(counter) = 1 - eignValues(3);
    
    counter = counter + 1;
    fprintf('finished here \n');
end

plot(line1x, line1y, 'r', 'LineWidth', 3);
hold on;
plot(line1x, line2y, 'g', 'LineWidth', 3);
hold on;
plot(line1x, line3y, 'b', 'LineWidth', 3);

legend('Metropolis', 'Local Degree', 'Max Degree');
xlabel ('number of nodes',  'FontSize', 16);
ylabel ('spectral gap',  'FontSize', 16);
