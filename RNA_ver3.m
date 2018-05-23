close all
clear all
%% This program deals with RNA model proposed by D. Rachinskii

% We will first try to model the following situation: If producing RNA hit Scanned RNA
% It kills it. Otherwise nothing happens PP->PP; SS->SS; SP->SP; PS->0P
% Doesn't look like it works. Now we are trying to kill sRNA even if it
% hits pRNA on its own.



UORF_init;
global Path
Path = zeros([1,Len_tot]); %Total path

global denname
denname=strcat('v3_');
SRNA_finished=0;% How many SRNA arrived to the finish
SRNA_started=0;% How many SRNA summoned at the beginning

flambda=0;
den=[];
Lam=[];
dena=[];
jjj=0;

for Lambda=Lam_start:Lam_step:Lam_fin
    %
    SRNA_passed_a=0;
    SRNA_finished=0;
     % SRNA_init=rand([1,TTime])<Lambda;% Initialize the sequence of adding SRNA at the beginning
    %% Main body
    % SRNA will be denoted by 1, PRNA by 2
    Path_new=[];
    Path_prna=[];
    Path_srna=[];
    for i=1:TTime % Begin Time loop
   
   % First Modify Path at the special points 
   
   % Summon SRNA at the beginning
   %Effect of Shpilka: add (rand()<shp)  to the if condition and take shp whatever you want%
        if((Free2go(Path,0,Ls)==0)&&(rand()<Lambda)) 
            Path(1)=1;
            SRNA_started=SRNA_started+1;
        end
        
        
   % Mutate to elongating at UORFstart if possible  
   fl_a=Free2go(Path,Len_a,Le);
   
   Path(Len_a)=MutateS2E(P_s2p,P_delay_a,Path(Len_a),fl_a);
   %Path(Len_a)=MutateS2Esurvive(P_s2p,P_delay_a,Path(Len_a),fl_a);
   %%% 05.09.2018  Special edition for the case when elongating do not kill
   %%% scanning ribosomes. 
   %%% for the original case change MutateS2Esurvive  to MutateS2E 
   
   
   %Free2Go(Path,Len_a,Le)
   %Free2go(Path,Len_a+Len,Ls)
   % Mutate to scanning at UORFfinish if possible 
   fl_b=Free2go(Path,Len_a+Len,Ls);
   Path(Len_a+Len)=MutateE2S(P_p2s,P_delay_b,Path(Len_a+Len),fl_b);
   %Path(Len_a+Len)=MutateE2Ssurvive(P_p2s,P_delay_b,Path(Len_a+Len),fl_b,P_s2p);
   %%% 05.09.2018  Special edition for the case when elongating do not kill
   %%% scanning ribosomes. 
   %%% for the original case change MutateE2Ssurvive  to MutateE2S 
   
   
   
    
   %Dissolve from the end 
    
   if(Path(Len_tot-Ls)>0)
       Path(Len_tot)=2;
   end
   if((Path(Len_tot-Ls)>0) && (rand()<P_smove))
        Path(Len_tot-Ls)=0;
        SRNA_finished=SRNA_finished+1; %Count how many SRNA arrived
   end
    
    
   % Next move everything
   % First generate the sequence of RNA wanted to jump
   Path_new_move=Want2Jump(Path,Len_tot,Ls,Le,P_smove,P_pmove);
   %then copy configuration to the new one.
   Path_new=Path;
   %Now kill all scanning ribosomes which will encounter obstacle
   for j=1:Len_tot-1
     % 07.02.2018 below is the code which kills scanning which bumps into
     % elongating
     %if((Path(j)==1)&&(Path_new_move(j)>0)&&(Path(j+Ls)>1))
     %       Path_new(j)=0;
     %end
     % end 07.02.2018
        if((Path(j)==2)&&(Path_new_move(j)>0)&&(Path(j+Le)<2))
            Path_new(j+Le)=0;
        end
   end
   Path=Path_new;
   %%From here actual movement starts.
   
   for j=1:Len_tot-1
    if((Path(j)==1)&&(Path_new_move(j)>0)&&(Path(j+Ls)==0))
        Path_new(j)=0;
        Path_new(j+1)=1;
        %02.05.2018 Introduce scanning death probability at each jumping.
       if(rand()<P_sdeath)
            Path_new(j+1)=0;
        end%02.05.2018
    end
    if((Path(j)==2)&&(Path_new_move(j)>0)&&(Path(j+Le)<2))
        Path_new(j)=0;
        Path_new(j+1)=2;
        %02.05.2018 Introduce elongating death probability at each jumping.
        if(rand()<P_edeath)
            Path_new(j+1)=0;
        end %02.05.2018
    end
   end
   if((Path(Len_a-Ls+1)>0) && (Path_new(Len_a-Ls+1)==0))
        SRNA_passed_a=SRNA_passed_a+1; %Count how many SRNA passed a
   end
  
   Path=Path_new;
    end %end Time loop
srnamax=max(srnamax,SRNA_finished);
[Lambda SRNA_passed_a SRNA_finished srnamax]% SRNA_started]

den=[den SRNA_finished];
dena=[dena SRNA_passed_a];
Lam=[Lam Lambda];
end
 % denname=strcat(denname,'s');
       
saveData
