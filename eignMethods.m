function eignValues = eignMethods(graph)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

%eignValues = [1, 1, 1];
eignValues = 0;
 if(issparse(graph))
    %    P1 = transMatrMetropolisSparse(graph);
        P2 = transMatrLDSparse(graph);
    %    P3 = transMatrCTRDSparse(graph);
        
    %    eignValues(1) = secondLargeEign(P1);
        eignValues = secondLargeEign(P2);
     %   eignValues(3) = secondLargeEign(P3);

 else
        P1 = transMatrMetropolis(graph);
        P2 = transMatrLD(graph);
        P3 = transMatrCTRD(graph);
        
        eignValues(1) = secondLargeEign(P1);
        eignValues(2) = secondLargeEign(P2);
        eignValues(3) = secondLargeEign(P3);
 end
    


end

