function [ raw_data ] = read_raw( file_dir, raw_info )
%READ_RAW read data from Raw format file.
%   Usuage: 
%   [ raw_data ] = read_raw( file_dir, raw_info )
% where:
%   file_dir = 'C:\1.dat'
%   raw_info.img_width = 3800;
%   raw_info.img_height = 3800;
%   raw_info.img_type ='int16';
fileID = fopen(file_dir);
raw_data = fread(fileID,[raw_info.img_width,raw_info.img_height],raw_info.data_type);% full image
fclose(fileID);

end

