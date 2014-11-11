function [ Y0_r,argY1_r,Y1_r,num_steps] = cal_refer( dir_refer,raw_info,preproc_info,I_background )
%CAL_REFER 
%
cd dir_refer
AbsoPath = strcat(dir_refer,'\*.dat');
ImgFiles = dir(AbsoPath); % a address list of each file.
num_steps = length(ImgFiles); %phase steps number.
 
for i= 1: num_steps
    I_refer_0 =read_specific_file( ImgFiles{1}.name, raw_info, 1  );
    I_refer = num_steps - I_background; % Background correction.
    
   I_rotate = imrotate(I_refer,preproc_info.rotate_angle,'bilinear','crop'); % Rotate Image.
    
    I_ROI = I_rotate(preproc_info.ROI_xmin:preproc_info.ROI_xmax,...
        preproc_info.ROI_ymin:preproc_info.ROI_ymax) ;
    
    
    
    
end

