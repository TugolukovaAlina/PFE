function comp = comparison ( adj )
%UNTITLED12 Summary of this function goes here

P1 = transMatrMetropolis(adj);
P2 = transMatrLD(adj);
P3 = transMatrCTRD(adj);

pi = 1/numNodes(adj);
comp = [maxMixingTime(P1, pi, 1/10), maxMixingTime(P2, pi, 1/10), maxMixingTime(P3, pi, 1/10)];

end

