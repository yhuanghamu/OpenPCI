function [ output_args ] = start_info_extract( handles )
%START_INFO_EXTRACT 
%   Phase stepping information extract method.
% Refer to I zanette's Phd Thesis.
AbsoPath = strcat(handles.dir_raw,'\*.dat');
ImgFiles = dir(AbsoPath); % a address list of each file.
numfiles = length(ImgFiles); %% number of files

oldpath = pwd;
cd  handles.dir_extract
dir_Atten = fullfile(pwd,strcat(date,'_Atten'));
dir_Diffphase = fullfile(pwd,strcat(date,'_Diffphase'));
dir_Darkfield = fullfile(pwd,strcat(date,'_Darkfield'));
mkdir(dir_Atten);
mkdir(dir_Diffphase);
mkdir(dir_Darkfield);


%% Read background darkfield image.
I_background = read_specific_file( handles.dir_dark, handles.raw_info, 1  );
%% Calculate Reference projections/
[Y0_r,argY1_r,Y1_r,num_steps] = cal_refer(handles.dir_refer,handles.raw_info,I_background);


%% Calculate Raw projections and Information Extraction.
h = waitbar(0,'1','Name','Projection signals extracting...',...
            'CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
setappdata(h,'canceling',0);
for i = 1:numsteps:numfiles
    
    if getappdata(h,'canceling')
        delete(h) ;
        break
    end
    
    [Y0_s,argY1_s,Y1_s] = cal_raw(handles.dir_raw,handles.raw_info,I_background,i);
    
    A = -lg10(Y0_s/Y0_r);
    P = p2/(2*pi*d)(argY1_s-argY1_r);
    D = abs(Y1_s)/Y0_s*Y0_r/abs(Y1_r);
    prefix ='';
    export_tif(A,dir_Atten,floor(i/5)+1,prefix);
    export_tif(P,dir_Diffphase,floor(i/5)+1,prefix);
    export_tif(D,dir_Darkfield,floor(i/5)+1,prefix);
    waitbar(i/raw_info.projnum,h,sprintf('%d %%',floor(100*i/numfiles)));

end
delete(h) ;
cd oldpath
end

