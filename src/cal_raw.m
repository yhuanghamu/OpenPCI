function [Y0_s,Y1_s ] = cal_raw( dir_raw,raw_info,preproc_info,I_background,ImgFiles,numsteps,No )
%CAL_RAW 
% 

for i= No: (No+num_steps-1)
    I_0 =read_specific_file( ImgFiles{i}.name, raw_info, 1  );
    I_1 = I_0 - I_background; % Background correction.
    
   I_2 = imrotate(I_1,preproc_info.rotate_angle,'bilinear','crop'); % Rotate Image.
    
   I_s(:,:,i) = I_2(preproc_info.ROI_xmin:preproc_info.ROI_xmax,...
        preproc_info.ROI_ymin:preproc_info.ROI_ymax) ;
end
Y = fft(I_s,[],3);
Y0_s = Y(:,:,1);
Y1_s = Y(:,:,2);

end
