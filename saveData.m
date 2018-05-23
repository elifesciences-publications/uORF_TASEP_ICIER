denname=strcat(denname,num2str(Len_a),'_',num2str(Len),'_',num2str(Len_b),'_');
denname=strcat(denname,num2str(P_s2p),'_',num2str(P_p2s),'_',num2str(P_smove),'_',num2str(P_pmove),'_');
denname=strcat(denname,num2str(Le),'_',num2str(Ls));
denname=strcat(denname,'_',num2str(P_sdeath),'_',num2str(P_edeath),'=');
fileID = fopen('data_v3.m','a');
fprintf(fileID,'%s[',denname);
fprintf(fileID,'%d ',den);
fprintf(fileID,'];\n');
fclose(fileID);