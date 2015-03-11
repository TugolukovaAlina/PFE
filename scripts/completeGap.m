%complete graph spectral gap 

min = 10;
step = 10;
max = 200;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max
    graph = completeGraph(i);
    [~, value] = methodsOnGraph(graph, 2, 2);
    line1y(counter) = value;
    counter = counter + 1;
end


plot(line1x, line1y, 'r', 'LineWidth', 3);
xlabel('max degree error');
ylabel('spectral gap');
