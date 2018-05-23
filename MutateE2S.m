function rib=MutateE2S(P_e2s,P_delay_b,flag, freeflag)
%P_e2s - probability to mutate elongating->scanning
%P_delay_b - delay at the uORF end
%flag - which type of ribosome is at uORF end?
%freeflag - is there enough place to mutate
rib=flag;
if(flag==2) 
       rib=4;
elseif((flag==4)&&(rand()<P_delay_b)&&(freeflag==0))
       if((rand()<P_e2s))
           rib=1;
       else
           rib=0;
       end
end
end