%dependency number of edges and eigen values
%almostConnectedGraph
min = 50000;
step = 50000;
max = 100000;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);
line3y = zeros (1, floor((max-min)/step) + 1);

p = 0.1;
counter = 1;

for i = min:step:max

   % eignValues = [0, 0, 0];
 eignValues = 0;
    for j = 1:10
        graph = randomGraphS(i, 3*i);  
         v = eignMethods(graph);
        eignValues = eignValues + v;
         fprintf('%i     ', v);
    end
    fprintf('\n');
    eignValues = eignValues/10;

    line1y(counter) = eignValues(1);
 %   line2y(counter) = eignValues(2);
  %  line3y(counter) = eignValues(3);
    
    counter = counter + 1;
    fprintf('finished here \n');
end

%plot(line1x, line1y, 'r', line1x, line2y, 'g',  line1x, line3y, 'b');
plot(line1x, line1y, 'r');

