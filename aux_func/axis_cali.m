function [ proj_cali ] = axis_cali( projection,refer_section_No )
%AXIS_CALI 
%
[imwidth, imHeight,numproj ] = size(projection);
refer_section = reshape(projection(refer_section_No,:,:),imHeight,numproj); % last section

refer = refer_section(:,1);
refer_1 = refer(1:floor(end/2));
refer_2 = refer(floor(end/2)+1:end);

edge_1 = find(refer_1 == min(refer_1));
edge_2 = find(refer_2 == min(refer_2))+floor(imHeight/2);
PMMAWidth = edge_2(1) - edge_1(1);
allownance= (imHeight-PMMAWidth)/2;


proj_cali = uint8(zeros(imwidth,PMMAWidth+allownance+1,numproj));
for i = 1:numproj
    img = refer_section(:,i);
    img_1 = img(1:floor(end/2));
    img_LeftIndex = find(img_1 == min(img_1));
    img_LeftIndex = img_LeftIndex(1) - allownance/2;%Lefe_edge
    img_RightIndex = img_LeftIndex + PMMAWidth+allownance;%right_edge
    %proj2d_3(:,i) = proj2d_0(img_LeftIndex(i):img_RightIndex(i),i);
    proj_cali(:,:,i) = projection(:,img_LeftIndex:img_RightIndex,i);
end

end

