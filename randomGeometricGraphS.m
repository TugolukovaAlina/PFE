function adj = randomGeometricGraphS ( n, r )
% n vertices, r is radius
% each vertex has position [0, 1] * [0, 1]
% if the distance between vertices is less then r than they are connected
% by edge

% 1st - x position, 2nd y position for n vertices
geom = zeros (n, 2);

for i = 1:n
    geom (i, 1) = rand;
    geom (i, 2) = rand;
end

%sort by the first argument
geom = sortrows(geom);

%???????????????memory for edges
nodei = zeros (1, n);
nodej = zeros (1, n);

counter = 1;
 for i = 1:n
     j = i + 1;
     %right neighbors
     while  j <=n && (geom(i, 1) - geom(j, 1))^2 < r^2
         if (geom(i, 1) - geom(j, 1))^2 + (geom(i, 2) - geom(j, 2))^2 <= r^2
             nodei (counter) = i;
             nodej (counter) = j;
             counter = counter + 1;
         end
         j = j + 1;
     end
 end
 
  fprintf('num of edges %i', counter);
 
 numNonZero = nnz(nodei);
 values = ones(1, 2*numNonZero); % i j = 1 and j i = 1
 nodei = nonzeros(nodei);
 nodej = nonzeros(nodej);
 
 %concatanate according to 2 dimention, because graph is undirected
 nodeij = cat(2, nodei, nodej);
 nodeji = cat(2, nodej, nodei);

  adj = sparse(nodeij, nodeji, values, n, n, 2*counter);

 % adj = cat (1, adj1,full(adj)); 
 %adj = adj1 - full(adj); 
end

