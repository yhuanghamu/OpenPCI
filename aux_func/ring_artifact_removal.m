function [ f_corr ] = ring_artifact_removal( f_0,T_max,T_min,ring_center )
%RING_ARTIFACT_REMOVAL This function is used to remove the ring artifacts of reconstructed image.
% usuage:
%  [ I_rm_ring ] = ring_artifact_removal( I_ring,T_max,T_min )
% where:
%   f_0: denotes the original image with ring artifacts.
%   T_max: denotes the upper threshold of ring artifacts value.
%   T_min: denote the lower threshold of ring artifacts value.
%   f_corr : denote the final image without ring artifacts.
%   ring_center: denote the ring artifact center coordinates.
   
[Iwidth, Iheight] = size(f_0);
f_thres = zeros(Iwidth, Iheight);
delta_f = f_thres;
f_M = f_thres;
f_corr = f_thres;

for i = 1:Iwidth*Iheight
    if (I_ring(i) < T_max)&&(I_ring(i)>T_min)
    f_thres(i) = I_ring(i);
    end
end

M_rad = 15 ;
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
for x=1:Iwidth
    for y = 1:Iheight
        dx = x - x0;
        dy = y - y0;
        dR = sqrt(dx*dx+dy*dy);
        dxe = dx/dR;
        dye = dy/dR;
        for n = 1:2*M_rad+1
            xs(n) = x0+(dR - n*dRA)*dxe;
            ys(n) = y0+(dR - n*dRA)*dye;
            fs(n) = f_0(xs(n),ys(n));
        end
         sort_fs = sort(fs);
         mean_fs = sort_fs(M_rad+1); % get median value.
            f_M(x, y) = mean_fs;
    end
end
delta_f = f_thres - f_M;
f_corr = f_0 - delta_f;

end




