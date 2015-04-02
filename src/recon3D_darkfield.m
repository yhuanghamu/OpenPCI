function [ edge_left,edge_right, R] = recon3D_darkfield( dir_darkfield,handles  )

AbsoPath = strcat(dir_darkfield,'\*.mat');
ImgFiles = dir(AbsoPath); % a address list of each file.
numfiles = length(ImgFiles); %% number of files
cd (dir_darkfield);

load(ImgFiles(1).name);
[imWidth, imHeight] = size(data);
I = single(zeros(imWidth,imHeight,numfiles));
for i = 1:numfiles
    load(ImgFiles(i).name);
    I(:,:,i) = single(data);
end
refer_section = imWidth; % last section.
% [ proj_cali ] = axis_cali( I,refer_section );
[edge_left,edge_right,proj_cali ] = axis_cali_dark( I,refer_section );
[~,imHeight_2,~] = size(proj_cali);
for i = 1:imWidth
    I_section = reshape(proj_cali(i,:,:),imHeight_2,numfiles);
    script = sprintf('%d',i);
    disp(script);
    R(:,:,i) = iradon(I_section,0:0.3581:179,'Ram-Lak');
end
end

