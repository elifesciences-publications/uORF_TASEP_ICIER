function newdata=dataAver(data)
% check if the path is free for Len_rib codons ahead of j-th position.
plat=0;
%for numl=length(data):length(data);
numl=length(data);    
plat=plat+data(numl);
%end
newdata=100*data./plat;

end