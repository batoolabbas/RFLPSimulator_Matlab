function [Fragments,Sequences] = restrictionMapping(Sequence,Digest,enzymes)

    Fragments = [];
    for jj=1:size(Digest,1)
        [~,cutSites,~] = restrict(Sequence,char(enzymes{Digest(jj)}));
        Fragments = union(Fragments,cutSites');
    end
end