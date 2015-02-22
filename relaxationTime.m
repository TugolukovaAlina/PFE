function relT= relaxationTime( P )

if  issparse(P)
    relT = 1/spectralGapSparse(P);
else
    relT = 1/absSpectralGap(P);
end

end


