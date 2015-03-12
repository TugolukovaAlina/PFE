graph = randomGraph(100, 0.08);

min = 0;
step = 2;
max = 100;

line1x = min:step:max;
line1y = zeros (1, round((max - min)/step) + 1);

counter = 1;
for alpha = min:step:max
    P = transMatrJUMP(graph, alpha);
    line1y(counter) = secondLargeEign(P);
    counter = counter + 1;
end


plot(line1x, line1y, 'r', 'LineWidth', 3);