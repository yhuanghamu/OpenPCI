function [Y0_s,Y1_s ] = cal_raw( dir_raw,raw_info,preproc_info,I_background,ImgFiles,num_steps,No )
%CAL_RAW 
% 
j = 1;
for i= No: (No+num_steps-1)
%     I_0 =read_specific_file( ImgFiles{i}.name, raw_info, 1  );
    I_0 = read_raw(ImgFiles(i).name,raw_info);
    I_1 = I_0 - I_background; % Background correction.
    
   I_2 = imrotate(I_1,preproc_info.rotate_angle,'bilinear','crop'); % Rotate Image.
    
   I_s(:,:,j) = imcrop(I_2,preproc_info.ROI);
   j = j+1;
end
Y = fft(I_s,[],3);
Y0_s = Y(:,:,1);
Y1_s = Y(:,:,2);

end
