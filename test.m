%% Batch rename all files in folder.
% file_dir='J:\Spider\spider_raw';
% prefix_length = 21;
% postfix_length = 6;
% max_digts_length = 4;
% file_type = 'dat';
% rename_file( file_dir,prefix_length,postfix_length,max_digts_length,file_type )
%% create blace TIF image.
prefix='';
data = zeros(3800,3800);
dir_file = 'C:\Users\HYC\Documents\GitHub\OpenPCI\img';
no = 1;
export_tif(data,dir_file,no,prefix)