function values = eigValues ( adj )

values = zeros(1, 3);

P1 = transMatrMetropolisSparse(adj);
eigsV = eigs(P1);
values(1) = eigsV(2);
fprintf('finished metropolis');

P2 = transMatrLDSparse(adj);
eigsV = eigs(P2);
values(2) = eigsV(2);
fprintf('finished LD');

P3 = transMatrCTRDSparse(adj);
eigsV = eigs(P3);
values(3) = eigsV(2);
fprintf('finished CTRD');



end

