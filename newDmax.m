
randGraph = randomGraph(100, 1, 800);
dmax =   maxDegree(randGraph);


min = 0;
step = 5;
max = 20*dmax;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max
    P_ctrw = transMatrCTRD(randGraph, (dmax + i));
    line1y(counter) = secondLargeEign(P_ctrw);
    counter = counter + 1;
end

plot(line1x, line1y, 'r');