function [ output_args ] = export_DICOM(Save_data,dcm_filename, DefaultPathname,recon_sequence )
%EXPORT_DICOM 此处显示有关此函数的摘要
%   此处显示详细说明

            
            % Other Image Attributes to Include
            SeriesInstanceUID = dicomuid;
            StudyInstanceUID = dicomuid;
            PatientID = 'Test';
            %DBID = DefaultPathname(end-8:end-1);
            SeriesNumber = 1;
            ImageOrientationPatient = [0;1;0;1;0;0];
            NumberOfFrames = 1;
            PixelAspectRatio = [1;1];
            RescaleIntercept = 0;
            RescaleSlope = 1;
            mu_water = 0.2;     % [1/cm]
            CT_gain = 1000;
            CT_offset = 1000;   % Convert from HU to CT#
            

%             [dcm_filename, DefaultPathname] = uiputfile( '', 'Save as','Untitled');
            dgts=floor(log10(size(Save_data,3)))+1;
            if  isequal(dcm_filename,0)
                errordlg('Data not saved.','DICOM Files Not Saved');
            else
                try
                    hw = waitbar(0,'Converting IMG to DICOM format');
                    for i=1:size(Save_data,3)
                        istr = num2str(recon_sequence(i));
%                         istr=num2str(i);
                        for j=1:dgts-(floor(log10(i))+1)
                            istr=strcat('0',istr);
                        end
                        
                        
                        
                        FileName = strcat(DefaultPathname,dcm_filename,istr,'.dcm');
%                        dicomwrite(Save_data.P(:,:,i),FileName);
                        P_CT = uint16(CT_gain*(Save_data(:,:,i)-mu_water)/mu_water + CT_offset);
                        status = dicomwrite(P_CT,FileName, ...
                            'ObjectType', 'CT Image Storage', ...
                            'InstitutionName', 'PrincessMargaretHospital', ...
                            'Modality', 'ConeBeamCT', ...
                            'Manufacturer', 'AAPM_OSCaR', ...
                            'SeriesInstanceUID', SeriesInstanceUID, ...
                            'StudyInstanceUID', StudyInstanceUID, ...
                            'PixelSpacing',[1;1], ...
                            'SliceThickness', 0.1, ...
                            'InstanceNumber',i, ...
                            'ImageOrientationPatient', ImageOrientationPatient, ...
                            'ImagePositionPatient', 10*[0;0;i*0.1], ...
                            'RescaleIntercept', RescaleIntercept, ...
                            'RescaleSlope', RescaleSlope ...
                        );
                        waitbar(i/size(Save_data,3),hw);
   
                    end
                    close(hw);
                    msgbox ('Data saved in DICOM files','DICOM Files');
                catch
                    errordlg('Data not saved. Try again!','DICOM Files Not Saved');
                end
            end
            
end

