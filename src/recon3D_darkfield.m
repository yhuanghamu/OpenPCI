function [  R ] = recon3D_darkfield( dir_darkfield,handles )
%RECON3D_DARKFIELD 
%   
AbsoPath = strcat(dir_darkfield,'\*.tif');
ImgFiles = dir(AbsoPath); % a address list of each file.
numfiles = length(ImgFiles); %% number of files
cd (dir_darkfield);

I_Temp = imread(ImgFiles(1).name);
[imWidth, imHeight] = size(I_Temp);

for i = 1:numfiles
    I(:,:,i) = imread(ImgFiles(i).name);
end
[ proj_cali ] = axis_cali( I,imWidth );
[~,imHeight_2,~] = size(proj_cali);
for i = 1:imWidth
    I_section = reshape(proj_cali(i,:,:),imHeight_2,numfiles);
    script = sprintf('%d',i);
    disp(script);
    R(:,:,i) = iradon(I_section,0:0.3581:179,'Ram-Lak');
end



