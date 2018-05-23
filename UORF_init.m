L=10; %Length of the ribosome        ref: 10
Ls=10; %Length of the scanning ribosome
Le=10; % Length of the elongating ribosome

Len_a=5*L; %Length of path before start ref: 5*L
Len=10*L; %Length of the working path   ref: 10*L
Len_b=5*L; %Length of path after finish ref: 5*L


Len_tot=Len_a+Len+Len_b+L;

srnamax=0;

Lambda=0.9;% Initial intensity of the scanning RNA at the beginning of path
Lam_start=0.0;                  %ref: 0.0
Lam_step=0.005;                 %ref: 0.005
Lam_fin=0.1;                    %ref: 0.2

P_delay_a=1.1; % Delay before P-RNA will start moving at the beginning of the frame 
                                %ref: 1.1
P_delay_b=1.1;                  %ref: 1.1 

%P_delay=1.0;
P_s2p=0.8; %Probability to obtain Producing RNA out of Scanning RNA and the beginning of working path
                                %ref: 0.8
P_p2s=0.0;
                                %ref: 0.0
P_smove=0.3; % Probability for scanning RNA to move if possible.
                                %ref: 0.3
P_pmove=0.3; % Probability for producing RNA to move if possible.
                                %ref: 0.3
P_death=0.007;% Probability to die at every step.
                                %ref: 0.0
P_sdeath=0.007;% Probability to die at every step(scanning).
                                %ref: 0.0
P_edeath=0.0;% Probability to die at every step(elongating).
                                %ref: 0.0


TTime=10^6;% Total number of iterations. At each iteration every RNA tries to move.
                                %ref: 10^6
