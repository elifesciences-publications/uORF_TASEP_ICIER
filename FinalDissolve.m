function FinalDissolve(Path,SRNA_finished,Len_tot,Ls,P_smove)


end
   if((Path(Len_tot-L)>0) && (rand()<P_smove))
        Path(Len_tot-L)=0;
        SRNA_finished=SRNA_finished+1; %Count how many SRNA arrived
   end
end