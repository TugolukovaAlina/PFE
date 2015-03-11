
randGraph = randomGraphS(100000, 1000000);
dmax =   maxDegree(randGraph);


min = 0;
step = 2;
max = 20;

line1x = (min + dmax):step:(max + dmax);
line1y = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max
    P_ctrw = transMatrCTRDSparse(randGraph, (dmax + i));
    line1y(counter) = 1 - secondLargeEign(P_ctrw);
    counter = counter + 1;
end

plot(line1x, line1y, 'r', 'LineWidth', 3);
xlabel('max degree error');
ylabel('spectral gap');
