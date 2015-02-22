function value = secondLargeEign(P)

% eignValues = eigs(P);
% %fprintf('eignnnnn: % i ', eignValues);
% % I know that it is strange but if I put != 1 it does not work
%     for i = 1:length(eignValues)
%         if abs(eignValues(i))  + 0.000001 <= 1
%             value = abs(eignValues(i));
%             return;
%         end
%     end
%     value = (eignValues(2));

    k = 6;
    while 1
        eignValues = eigs(P, k);
        for i = 1:length(eignValues)
            if abs(eignValues(i))  + 0.000001 <= 1
                value = abs(eignValues(i));
                return;
            end
        end
        k = k + 1;
    end
end