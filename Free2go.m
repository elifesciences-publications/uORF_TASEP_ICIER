function flag=Free2go(Path,jstart, Len_rib)
% check if the path is free for Len_rib codons ahead of j-th position.
flag=0;
        for j=1:Len_rib
            flag=flag+Path(jstart+j);
        end
end