% dir_file ='J:\Spider\spider_recon\16-Nov-2014_Darkfield';
% prefix='';
% for i = 1:715
%     export_tif(r_normal(:,:,i),dir_file,i,prefix);
%     disp(i);
% end

% dir_dark = 'J:\Spider\spider_extract\23-Nov-2014_Atten';
% handles = 0;
% [ edge_left,edge_right, R] = recon3D_darkfield( dir_dark,handles  );
% cd(dir_dark);
% AbsoPath = strcat(dir_dark,'\*.mat');
% ImgFiles = dir(AbsoPath); % a address list of each file.
% numfiles = length(ImgFiles); %% number of files
% dark_field_projection = zeros(715,992,500);
% for i = 1:500
%     load(ImgFiles(i).name);
%     dark_field_projection(:,:,i) = data;
%     disp(i);
% end
   
% [edge_left,edge_right,proj_cali ] = axis_cali_dark( dark_field_projection,525 );
% prefix='';
% dir_file='J:\Spider\spider_recon\18-Nov-2014_darkfield';
% dcm_filename = 'DCM';
% dcmDirectory =[dir_file '\'];
%     minR = min(R(:));
%     maxR = max(R(:));
%     R_normal = (R - minR) /(maxR -minR);
%     export_DICOM(Save_data,dcm_filename, dcmDirectory,recon_sequence );
%     minR = min(R(:));
%     maxR = max(R(:));
%     R_normal = (R - minR) /(maxR -minR);
% for i =1:715
%     data = im2uint16(R_normal(:,:,i));
%     export_tif(data,dir_file,i,prefix);
% end
T_min =-0.4;
T_max =1.0;
ring_center.x0 =275;
ring_center.y0 = 303;
[ f_corr_2 ,delta_f] = ring_artifact_removal( f_0,T_max,T_min,ring_center );

figure,
plot(f_0(150,:),'go')
hold on
plot(f_corr_2(150,:),'r*')
hold 
% t=reshape(I(508,:,:),1299,500);
% for i =1:500
%     plot(t(:,i));title([num2str(i)])
%     
%     pause(0.2);
% end