function [ output_args ] = export_mat(data,dir_file,no,prefix)
% auxfunction.
dgts=4; % Digts number.
istr = num2str(no);
for j=1:dgts-(floor(log10(no))+1)
    istr=strcat('0',istr);
end
filename = strcat(prefix,istr);
file_path = fullfile(dir_file,strcat(filename,'.mat'));

save(file_path,'data');

end

