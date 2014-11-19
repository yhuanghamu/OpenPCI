function [ f_corr ,delta_f] = ring_artifact_removal( f_0,T_max,T_min,ring_center )
%RING_ARTIFACT_REMOVAL This function is used to remove the ring artifacts of reconstructed image.
% usuage:
%  [f_corr ,delta_f] = ring_artifact_removal( f_0,T_max,T_min,ring_center )
% where:
%   f_0: denotes the original image with ring artifacts.
%   T_max: denotes the upper threshold of ring artifacts value.
%   T_min: denote the lower threshold of ring artifacts value.
%   ring_center.x0/.y0: denote the ring artifact center coordinates.
%   f_corr : denote the final image without ring artifacts.
%   delta_f: denote ring artifact image.

   
[Iwidth, Iheight] = size(f_0);
f_thres = uint16(zeros(Iwidth, Iheight));
delta_f = f_thres;
f_M = f_thres;
f_corr = f_thres;

count = 0;
for i = 1:Iwidth*Iheight
    if (f_0(i) < T_max)&&(f_0(i)>T_min)
        f_thres(i) = f_0(i);
        count = count +1;
    end
end

M_rad = 30 ;
x0 = ring_center.x0;
y0 = ring_center.y0;
RF= 0.5;%radius of the focus trajectory
RD = 0.5;%radius of the detector trajectory
du = 0.1;
dv = 0.1;
dx = 0.1;
dy = 0.1;
duv = (du+dv)/2;% mean detector pixel size.
dxy = (dx+dy)/2;%mean image pixel size.
b = 1; %pixel-binning factor.
dRA =(RF/(RD+RF))*duv*b/dxy;%circular artifact size.

xs = uint16(zeros(2*M_rad+1,1));
ys = xs;
fs = xs;
% processNo = 1;
% f_0(257,294)=0;
for x=1:Iwidth
    for y = 1:Iheight
        if((f_0(x,y)~=0)&&~((x==257)&&(y == 294)))
%             sct =sprintf('x=%d,y=%d',x,y);
%             disp(sct);
            dx = x - x0;
            dy = y - y0;
            dR = sqrt(dx*dx+dy*dy);
            dxe = dx/dR;
            dye = dy/dR;
            for n = 1:2*M_rad+1
                xs(n) = round(x0+(dR - n*dRA)*dxe);
                ys(n) = round(y0+(dR - n*dRA)*dye);
                fs(n) = f_0(xs(n),ys(n));
            end
            sort_fs = sort(fs);
            mean_fs = sort_fs(M_rad+1); % get median value.
            f_M(x, y) = mean_fs;
%             sct =sprintf('succeed x=%d,y=%d,count=%d.',x,y,processNo);
%             processNo = processNo +1;
%             disp(sct);
        end
        
    end
end
delta_f = f_thres - f_M;
f_corr = f_0 - delta_f;

end




