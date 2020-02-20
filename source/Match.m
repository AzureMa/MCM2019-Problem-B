function pairs = Match(W,chains,hospital)
    pairs=cell(length(chains),2);
    for j=1:length(chains)
        chain=chains{j};
        pair=[];
        map=W(hospital,chain);
        for i=1:length(hospital)
            [temp ,temp_id] = min(map(i,:));
            pair=[pair,chain(temp_id)];
        end
        pairs(j,:)={chain,pair};
    end
end