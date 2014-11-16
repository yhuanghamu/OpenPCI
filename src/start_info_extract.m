function [ output_args ] = start_info_extract( handles )
%START_INFO_EXTRACT 
%   Phase stepping information extract method.
% Refer to I zanette's Phd Thesis.
AbsoPath = strcat(handles.dir_info.dir_raw,'\*.dat');
ImgFiles = dir(AbsoPath); % a address list of each file.
numfiles = length(ImgFiles); %% number of files

oldpath = pwd;
cd (handles.dir_info.dir_extract);
dir_Atten = fullfile(pwd,strcat(date,'_Atten'));
dir_Diffphase = fullfile(pwd,strcat(date,'_Diffphase'));
dir_Darkfield = fullfile(pwd,strcat(date,'_Darkfield'));
if ~isdir(dir_Atten)
    mkdir(dir_Atten);
end
if ~isdir(dir_Diffphase)
    mkdir(dir_Diffphase);
end
if ~isdir(dir_Darkfield)
     mkdir(dir_Darkfield);
end



%% Read background darkfield image.
I_background = read_specific_file( handles.dir_info.dir_dark, handles.raw_info, 1  );
%% Calculate Reference projections/
[Y0_r,Y1_r,num_steps] = cal_refer(handles.dir_info.dir_refer,handles.raw_info,...
    handles.preproc_info,I_background);
%% Calculate Raw projections and Information Extraction.
h = waitbar(0,'1','Name','Projection signals extracting...',...
            'CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
setappdata(h,'canceling',0);

cd (handles.dir_info.dir_raw);
cur_proj_num = 1;
for i = 1:num_steps:numfiles
    
    if getappdata(h,'canceling')
        delete(h) ;
        break
    end % Cancel Waitbar
    
    [Y0_s,Y1_s] = cal_raw(handles.dir_info.dir_raw,handles.raw_info,handles.preproc_info,...
        I_background,ImgFiles,num_steps,i);
    
    A = log(Y0_r./Y0_s);
    A(A(:)<0) = 0; %
    
    p2=1; %grating parameter
    d =1; %grating parameter
    P = p2/(2*pi*d)*angle(Y1_s./Y1_r);
    
    D = abs(Y1_s)./Y0_s.*Y0_r./abs(Y1_r);
    D(D(:)>1) = 1;%
    
    prefix ='';
    export_mat(A,dir_Atten,floor(i/5)+1,prefix);
    export_mat(P,dir_Diffphase,floor(i/5)+1,prefix);
    export_mat(D,dir_Darkfield,floor(i/5)+1,prefix);
%     export_tif(A,dir_Atten,floor(i/5)+1,prefix);
%     export_tif(P,dir_Diffphase,floor(i/5)+1,prefix);
%     export_tif(D,dir_Darkfield,floor(i/5)+1,prefix);
    waitbar(i/numfiles,h,sprintf('%d %%',floor(100*i/numfiles)));
   
end
delete(h) ;
cd(oldpath);
end

