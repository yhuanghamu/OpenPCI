function [ Y0_r,Y1_r,num_steps] = cal_refer( dir_refer,raw_info,preproc_info,I_background )
%CAL_REFER 
%
cd(dir_refer);
AbsoPath = strcat(dir_refer,'\*.dat');
ImgFiles = dir(AbsoPath); % a address list of each file.
num_steps = length(ImgFiles); %phase steps number.
 
for i= 1: num_steps
%     I_0 =read_specific_file( ImgFiles(i).name, raw_info, 1  );
    I_0 = read_raw(ImgFiles(i).name,raw_info);
    I_1 = I_0 - I_background; % Background correction.
    
    I_2 = imrotate(I_1,preproc_info.rotate_angle,'bilinear','crop'); % Rotate Image.
    
%     I_refer(:,:,i) = I_2(preproc_info.ROI_xmin:preproc_info.ROI_xmax,...
%         preproc_info.ROI_ymin:preproc_info.ROI_ymax) ;
    I_refer(:,:,i) = imcrop(I_2,preproc_info.ROI);
      
end

Y = fft(I_refer,[],3);
Y0_r = Y(:,:,1);
Y1_r = Y(:,:,2);

