function [ proj_cali, R] = recon3D_diffphase(  dir_diffphase,handles,edge_left,edge_right )

AbsoPath = strcat(dir_diffphase,'\*.mat');
ImgFiles = dir(AbsoPath); % a address list of each file.
numfiles = length(ImgFiles); %% number of files
cd (dir_diffphase);

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
allownance = 200;
PMMAWidth_mean = 507;
for i = 1:numfiles
    img_LeftIndex(i) = edge_left(i) - floor(allownance/2);%Lefe_edge
    img_RightIndex(i) = img_LeftIndex(i) + PMMAWidth_mean+allownance;%right_edge
    proj_cali(:,:,i) =  I(:,img_LeftIndex(i):img_RightIndex(i),i);
end
[~,imHeight_2,~] = size(proj_cali);
%% Filter
if mod(imHeight_2,2) ~= 0
    w = -((imHeight_2-1)/2):((imHeight_2-1)/2);
else
     w = -(imHeight_2/2-1):(imHeight_2)/2;
end
filter =(1./(1i*2*pi).*sign(w))';
%% 
for i = 1:imWidth
    I_section = reshape(proj_cali(i,:,:),imHeight_2,numfiles);
    script = sprintf('%d',i);
    disp(script);
    for j = 1:numfiles
        temp(:,j)=fft(I_section(:,j)) ;
        p2_f(:,j) = temp(:,j) .* filter;
    end

    p2_f = real(ifft(p2_f));
    R(:,:,i) = iradon(p2_f,0:0.3581:179,'None');
end

end



