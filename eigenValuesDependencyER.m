%dependency number of edges and mixing time
%random graph

min = 0.05;
step = 0.05;
max = 1;

line1x = min:step:max;
line1y = zeros (1, round((max - min)/step) + 1);
line2y = zeros (1, round((max - min)/step) + 1);
line3y = zeros (1, round((max - min)/step) + 1);

counter = 1;
%p is probability to connect two edges
for p = min:step:max
    graph = randomGraph(100, p);
    
    if ~isConnected(graph)
        fprintf('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        break;
    else       
        [~, eignValues] = methodsOnGraph(graph, [1, 2, 3], 1);
        line1y(counter) = 1 - eignValues(1);
        line2y(counter) = 1 - eignValues(2);
        line3y(counter) = 1 - eignValues(3);

        counter = counter + 1;
    end
end

plot(line1x, line1y, 'r', line1x, line2y, 'g',  line1x, line3y, 'b');
legend('Metropolis', 'Local Degree', 'Max Degree');
xlabel ('probability p');
ylabel ('spectral gap');
