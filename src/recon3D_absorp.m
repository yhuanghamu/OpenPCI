function [ proj_cali, R] = recon3D_absorp(  dir_absorp,handles,edge_left,edge_right )

AbsoPath = strcat(dir_absorp,'\*.mat');
ImgFiles = dir(AbsoPath); % a address list of each file.
numfiles = length(ImgFiles); %% number of files
cd (dir_absorp);

load(ImgFiles(1).name);
[imWidth, imHeight] = size(data);
I = single(zeros(imWidth,imHeight,numfiles));
for i = 1:numfiles
    load(ImgFiles(i).name);
    I(:,:,i) = single(data);
    script = sprintf('%d',i);
    disp(i);
end
% refer_section = floor(600);
% [ proj_cali ] = axis_cali( I,refer_section );

for i = 1:numfiles
    proj_cali(:,:,i) =  I(:,img_LeftIndex(i):img_RightIndex(i),i);
end
[~,imHeight_2,~] = size(proj_cali);
for i = 1:imWidth
    I_section = reshape(proj_cali(i,:,:),imHeight_2,numfiles);
    script = sprintf('%d',i);
    disp(script);
    R(:,:,i) = iradon(I_section,0:0.3581:179,'Ram-Lak');
end

end



