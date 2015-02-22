function graph = completeGraph(size)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 graph = ones(size, size);
 for i = 1 : size
     graph(i, i) = 0;
 end
 
end

