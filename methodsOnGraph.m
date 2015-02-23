function [PofMethods, eignValue, mixingTime, discardTime, restartTime] = methodsOnGraph(graph, methods, parameters)

if nargin == 1
    methods = [1, 2, 3, 4];
    parameters = [1, 2, 3, 4];
end
pi = 1/length(graph);
omega = length(graph);

%names of methods
methodNames = cellstr(['Metropolis';'LD        ';'CTRW      '; 'RW        ']);
discardTime = zeros(1, length(methods));
restartTime = zeros(1, length(methods));
mixingTime = zeros(1, length(methods));
eignValue = zeros(1, length(methods));
       
    if(issparse(graph))
        P1 = transMatrMetropolisSparse(graph);
        P2 = transMatrLDSparse(graph);
        P3 = transMatrCTRDSparse(graph);
        P4 = transMatrRWSparse(graph);
        PofMethods = cat(3, full(P1), full(P2), full(P3), full(P4));
    else
        P1 = transMatrMetropolis(graph);
        P2 = transMatrLD(graph);
        P3 = transMatrCTRD(graph);
        P4 = transMatrRW(graph);
        PofMethods = cat(3, P1, P2, P3, P4);
    end

    for i = 1:length(methods)
        
        methodNumber = methods(i);
        if(issparse(graph))
            P = sparse(PofMethods(:, :, methodNumber));
        else
            P = PofMethods(:, :, methodNumber);
        end
        
        if ismember(1, parameters)
            eignValue(i) = secondLargeEign(P);
            delta = maxDegree(P);
            fprintf('Method:  %s \n', char(methodNames(methods(i))));
            fprintf('eigen value:  %i \n', eignValue(i));
            fprintf('min mix time: %i \n' , minMixingTime(eignValue(i), omega, delta));
            fprintf('max mix time:%i \n', maxMixingTime(eignValue(i), pi));
        end
        
        if ismember(2, parameters)
            mixingTime(i) = findMixingTime(P);
            fprintf('mixing time:%i \n', mixingTime(i));
        end
        
        if ismember(3, parameters)
            discardTime(i) = toDiscardAvg(P);
            fprintf('average number to discard: %i \n' , discardTime(i));
        end
        
        if ismember(4, parameters)
            restartTime(i) = toRestartAvg(P);
            fprintf('average number to restart:%i \n', restartTime(i));
        end
           
        fprintf('--------------------------------------------------------------------------------\n');
    end
    
% else
%     P1 = transMatrMetropolis(graph);
%     P2 = transMatrLD(graph);
%     P3 = transMatrCTRD(graph);
%     P4 = transMatrRW(graph);
%     
%     methods = cat(3, P1, P2, P3, P4);
% 
%     for i = 1:length(methodNames)
%         P = methods(:, :, i);
%         eignValue = secondLargeEign(P);
%         delta = maxDegree(P);
%         fprintf('Method:  %s \n', char(methodNames(i)));
%         fprintf('eigen value:  %i \n', eignValue);
%         fprintf('min mix time: %i \n' , minMixingTime(eignValue, omega, delta));
%         fprintf('max mix time:%i \n', maxMixingTime(eignValue, pi));
%         fprintf('average number to discard: %i \n' , toDiscardAvg(P));
%         fprintf('average number to restart:%i \n', toRestartAvg(P));
%         fprintf('--------------------------------------------------------------------------------\n');
%     end
% end




% 
% pi = 1/length(graph);
% omega = length(graph);
% 
% if(issparse(graph))
% 
%     P1 = transMatrMetropolisSparse(graph);
%     eigsV = eigs(P1);
%     delta = maxDegreeSparse(P1);
%     for i = 1:length(eigsV)
%         if eigsV(i)  + 0.000001 <= 1
%             eignValue = eigsV(i);
%              fprintf('Metropolis eigen value!!!!!!!!!!!:  %i %i\n' , i, eignValue);
%             break;
%         end
%     end
%     fprintf('Metropolis eigen value:  %i \n' , eigsV);
%     fprintf('Metropolis eigen value ------:  %i \n' , eigsV(3));    
%     fprintf('Metropolis min mix time: %i \n' , minMixingTime(eigsV(3), omega, delta));
%     fprintf('Metropolis max mix time: %i \n' , maxMixingTime(eigsV(3), pi));
%     fprintf('average number to discard: %i \n' , toDiscardAvg(P1));
%     fprintf('average number to restart:%i \n', toRestartAvg(P1));
%     fprintf('--------------------------------------------------------------------------------\n');
% 
%     P2 = transMatrLDSparse(graph);
%     eigsV = eigs(P2);
%     delta = maxDegreeSparse(P2);
%     fprintf('LD eigen value:  %i \n' , eigsV(2));
%     fprintf('LD min mix time: %i \n' , maxMixingTime(eigsV(2), omega, delta));
%     fprintf('LD max mix time: %i \n', maxMixingTime(eigsV(2), pi));
%     fprintf('average number to discard: %i \n' , toDiscardAvg(P2));
%     fprintf('average number to restart:%i \n', toRestartAvg(P2));
%     fprintf('--------------------------------------------------------------------------------\n');
% 
%     P3 = transMatrCTRDSparse(graph);
%     eigsV = eigs(P3);
%     delta = maxDegreeSparse(P3);
%     fprintf('CTRW  eigen value:  %i \n ', eigsV(2));
%     fprintf('CTRW min mix time: %i \n' , maxMixingTime(eigsV(2), omega, delta));
%     fprintf('CTRW max mix time:%i \n', maxMixingTime(eigsV(2), pi));
%     fprintf('average number to discard: %i \n' , toDiscardAvg(P3));
%     fprintf('average number to restart:%i \n', toRestartAvg(P3));
%     fprintf('--------------------------------------------------------------------------------\n');
% 
% else
%     
%     P1 = transMatrMetropolis(graph);
%     eigsV = eigs(P1);
%     delta = maxDegree(P1);
%     fprintf('Metropolis eigen value:  %i \n' , eigsV(2));
%     fprintf('Metropolis min mix time: %i \n' , minMixingTime(eigsV(2), omega, delta));
%     fprintf('Metropolis max mix time: %i \n' , maxMixingTime(eigsV(2), pi));
%     fprintf('average number to discard: %i \n' , toDiscardAvg(P1));
%     fprintf('average number to restart:%i \n', toRestartAvg(P1));
%     fprintf('--------------------------------------------------------------------------------\n');
% 
%     P2 = transMatrLD(graph);
%     eigsV = eigs(P2);
%     delta = maxDegree(P2);
%     fprintf('LD eigen value:  %i \n' , eigsV(2));
%     fprintf('LD min mix time: %i \n' , minMixingTime(eigsV(2), omega, delta));
%     fprintf('LD max mix time: %i \n', maxMixingTime(eigsV(2), pi));
%     fprintf('average number to discard: %i \n' , toDiscardAvg(P2));
%     fprintf('average number to restart:%i \n', toRestartAvg(P2));
%     fprintf('--------------------------------------------------------------------------------\n');
% 
%     P3 = transMatrCTRD(graph);
%     eigsV = eigs(P3);
%     delta = maxDegree(P3);
%     fprintf('CTRW  eigen value:  %i \n ', eigsV(2));
%     fprintf('CTRW min mix time: %i \n' , minMixingTime(eigsV(2), omega, delta));
%     fprintf('CTRW max mix time:%i \n', maxMixingTime(eigsV(2), pi));
%     fprintf('average number to discard: %i \n' , toDiscardAvg(P3));
%     fprintf('average number to restart:%i \n', toRestartAvg(P3));
%     fprintf('--------------------------------------------------------------------------------\n');
% 
% end

end