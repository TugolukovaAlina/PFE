function degreeValue = neighborsDistribution(graph)

degreeValue = zeros(1, 100);
for i = 1 : length(graph)
    num = numberOfNeighbors(graph, i);
    %fprintf('num %i    ', num);
    degreeValue(num) = degreeValue(num) + 1;
end

%fprintf('nnz(degreeValue) %i ', nnz(degreeValue));

x = zeros (1, nnz(degreeValue));
counter = 1;
for i = 1 : length(degreeValue)
    if degreeValue(i) > 0
        x(counter) = i;
        y(counter) = degreeValue(i);
        counter = counter + 1;
    end
end

scatter(x, y , 3);
%hist(y);

end

