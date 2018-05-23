function Path_jump=Want2Jump(Path,Len_tot,Ls,Le,P_smove,P_pmove)
Path_jump=zeros([1 Len_tot]);
 
   for j=1:Len_tot-Ls
       %if((Path(j)==1)&&(rand()<P_smove)&&(Path(j+L)~=1))
       if((Path(j)==1)&&(rand()<P_smove)&&(Path(j+Ls)==0))
           Path_jump(j)=1;
       end
       if((Path(j)==2)&&(rand()<P_pmove)&&Path(j+Le)<2)
           Path_jump(j)=1;
       end
   end
end