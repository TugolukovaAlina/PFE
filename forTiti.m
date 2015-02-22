numberOfNodes = 100;
numberOfExperiments = 100;
prob = 0.9999;
radius = findMinRadiusRGG(numberOfNodes, prob);
notConnectedCount = 0;
for i = 1:numberOfExperiments
    rgg  = randomGeometricGraph(numberOfNodes, radius);
    if ~isConnected(rgg)
        notConnectedCount = notConnectedCount + 1;
    end
end

fprintf('result %i from %i', notConnectedCount, numberOfExperiments);