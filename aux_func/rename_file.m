function [ output_args ] = rename_file( file_dir,prefix_length,postfix_length,max_digts_length,file_type )
%RENAME_FILE Batch rename each file in file directory.
%   Usuage:
%        rename_file( file_dir,prefix,digts )
%   where
%       file_dir: Selected directory.
%       prefix_length: length of prefix.
%       postfix_length: length of postfix.
%       max_digts_length:  max digits of filename No.
%       filetype: file name extension. 
%   Problem dscription:
%       oldname -> 201409052018_16bitraw1-1.dat;    ...500-2.dat.
%       newname -> 201409052018_16bitraw0001-1.dat; ...0500-2.da.
%   Demo script: 
%       file_dir='J:\Refract\Refrac0919\CT\test';
%       prefix_length = 21;
%       postfix_length = 6;
%       max_digts_length = 4;
%       file_type = 'dat';
%       rename_file( file_dir,prefix_length,postfix_length,max_digts_length,file_type )
old_dir = pwd ;
path(path,file_dir);
cd(file_dir);
AbsoPath = fullfile(file_dir,strcat('*.',file_type));
files_info = dir(AbsoPath); % a address list of each orignal data file.
numfiles = length(files_info); %% number of files

for i =1:numfiles
    old_name = files_info(i).name;
    prefix = old_name(1:prefix_length);%get prefix
    postfix = old_name(end-postfix_length+1:end); % get posfix
    
    file_no = old_name(prefix_length+1:end-postfix_length); % file No. 
    no = str2num(file_no);
    for j=1:max_digts_length-(floor(log10(no))+1)
     file_no=strcat('0',file_no); % add '0' until it reaches max_digts_length
    end
    new_name =strcat(strcat(prefix,file_no),postfix); % add prefix and postfix.
    movefile(old_name,new_name); % Rename files.
end

cd(old_dir); % back to main folder.

end

