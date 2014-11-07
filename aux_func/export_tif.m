function export_tif(data,dir_file,no,prefix)
%EXPORT_TIF export Tif image
% auxfunction.
dgts=4; % Digts number.
istr = num2str(no);
for j=1:dgts-(floor(log10(no))+1)
    istr=strcat('0',istr);
end
filename = strcat(prefix,istr);
file_path = fullfile(dir_file,strcat(filename,'.tif'));
imwrite(data,file_path);
end

