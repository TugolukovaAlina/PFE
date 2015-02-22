function  drawGrid(grid, n, m)

if length(grid) ~= n*m
    fprintf('cannot be drawn as a grid n by m');
end

X = zeros(1, n*m);
Y = zeros(1, n*m);

counter = 1;
for i = 1:n
    for j = 1:m
        Y (counter) = i/n;
        X(counter) = j/m;
        counter = counter + 1;
    end
end

scatter(X, Y, 3);

for i = 1:length(grid)
    for j = i:length(grid)
        if grid (i, j) == 1
            connectVertices(i, j);
        end
    end
end

    function connectVertices(v1, v2)
        if mod(v2, m) == 0
            x2 = m/m;
        else
            x2 = mod(v2, m)/m;
        end
        
        if mod(v1, m) == 0
            x1 = m/m;
        else
            x1 = mod(v1, m)/m;
        end
        
          line ([x1, x2], [ceil(v1/m)/n, ceil(v2/m)/n]);
    end

end

