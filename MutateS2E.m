function rib=MutateS2E(P_s2e,P_delay_a,flag,freeflag)
rib=flag;
if ((flag==1) && (rand()<P_s2e)) 
        rib=3; 
        %pRNA doesn't move immediately. It takes Delay time for pRNA to
        %start moving
elseif((flag==3)&&(rand()<P_delay_a)&&(freeflag==0)) 
    rib=2;
end
end
   