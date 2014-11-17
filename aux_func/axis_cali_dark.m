function [ edge_left,edge_right,proj_cali ] = axis_cali_dark( projection,refer_section_No )
%AXIS_CALI 
%
[imwidth, imHeight,numproj ] = size(projection);
refer_section = reshape(projection(refer_section_No,:,:),imHeight,numproj); % last section

% proj_cali = zeros(imwidth,PMMAWidth+allownance+1,numproj);
for i = 1:numproj
    refer = refer_section(:,i);
    refer_part_1 = refer(1:floor(end/2));
    refer_part_2 = refer(floor(end/2)+1:end);
    edge_left(i) = find(refer_part_1 == min(refer_part_1));
    edge_right(i) = find(refer_part_2 == min(refer_part_2))+floor(imHeight/2);
    axis_position(i) = ((edge_left(i)+edge_right(i))/2);
    PMMAWidth(i) = edge_right(i)-edge_left(i);
%     img = refer_section(:,i);
%     img_1 = img(1:floor(end/2));
%     img_LeftIndex = find(img_1 == min(img_1));
%     img_LeftIndex = img_LeftIndex(1) - floor(allownance/2);%Lefe_edge
%     img_RightIndex = img_LeftIndex + PMMAWidth+allownance;%right_edge
    %proj2d_3(:,i) = proj2d_0(img_LeftIndex(i):img_RightIndex(i),i);
%     proj_cali(:,:,i) = projection(:,img_LeftIndex:img_RightIndex,i);
end
PMMAWidth_mean = floor(mean(PMMAWidth));
allownance = floor(0.2*PMMAWidth_mean);
axis_position_mean = floor(mean(axis_position));

for i = 1:numproj
img_LeftIndex(i) = edge_left(i) - floor(allownance/2);%Lefe_edge
img_RightIndex(i) = img_LeftIndex(i) + PMMAWidth_mean+allownance;%right_edge
proj_cali(:,:,i) = projection(:,img_LeftIndex(i):img_RightIndex(i),i);
end


end

