function rib=MutateE2Ssurvive(Pe2s,P_delay_b,flag, freeflag,Ps2e)
%%% 05.09.2018  Special edition for the case when elongating do not kill
%%% scanning ribosomes. For that case we can treat all ribosommes as
%%% scanning, i.e. do nothing at UORF start and we will just kill the certain portion of
%%% ribosomes at uORF end. The probability to kill has to be equal to the product
%%% Ps2e*(1-Pe2s) Check the UORFinit file to made an ajustments. For running
%%% this test with reference values Pe2s=0.0, Ps2e=0.8 one has to kill here with probability 0.8. 


%P_e2s - probability to mutate elongating->scanning
%P_delay_b - delay at the uORF end
%flag - which type of ribosome is at uORF end?
%freeflag - is there enough place to mutate
rib=flag;
if((flag==1)&&rand()<(Ps2e*(1-Pe2s))) 
       rib=0;
end
end