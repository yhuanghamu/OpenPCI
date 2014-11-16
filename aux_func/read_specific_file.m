function [ I ] = read_specific_file( dir_info, raw_info, i  )
%SHOW_SPECIFIC_IMAGE Show selected image
% 
AbsoPath = fullfile(dir_info,strcat('*.dat'));
files_info = dir(AbsoPath); % a address list of each orignal data file.
numfiles = length(files_info); %% number of files
file_name = fullfile(dir_info,files_info(i).name);
I  = read_raw( file_name, raw_info );
% imshow(I,[ min(I(:)) max(I(:))]);
% axis off;
end

