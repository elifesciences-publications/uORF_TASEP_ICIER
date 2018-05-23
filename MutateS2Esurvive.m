function rib=MutateS2Esurvive(P_s2e,P_delay_a,flag,freeflag)
%%% 05.09.2018  Special edition for the case when elongating do not kill
%%% scanning ribosomes. For that case we can treat all ribosommes as
%%% scanning, i.e. do nothing at UORF start and we will just kill the certain portion of
%%% ribosomes at uORF end. The probability to kill has to be equal to the product
%%% Ps2e*(1-Pe2s) Check the UORFinit file to made an ajustments. For running
%%% this test with reference values Pe2s=0.0, Ps2e=0.8 one has to kill here with probability 0.8. 
rib=flag;
end
   