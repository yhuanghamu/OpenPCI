%%
%相衬CT信息提取

clear all;clc

%%导入和计算背景
s0=zeros(2058,1232);
s1=s0;s2=s0;s3=s0;
a0=s0;s=s0;v=s0;

N=5;
for l=0:1
    parfor k=1:N
    imgpath=strcat('F:\实验\实验数据\CT\B0\201409052018_16bitraw1-B0-',int2str(l),'-',int2str(k),'.dat');
%     imgpath=strcat('F:\实验\实验数据\20140903\201409031112_16bitraw',num2str(k),'.dat');
    fid=fopen(imgpath,'r');
    I=fread(fid,[2058,1232],'int16');
    fclose(fid);
    I(2,1)=(I(1,1)+I(3,1))/2;
    I(4,1)=(I(3,1)+I(5,1))/2;
    s0=s0+I;
    s1=s1+I*sin(2*pi*k/N);
    s2=s2+I*cos(2*pi*k/N);
    s3=s3+I*exp(2*pi*1i*k/N);
    end
a0=a0+s0/N;
s=s+s3;
v=v+(2/N*sqrt(s1.^2+s2.^2))./(s0/N);
end

a0=a0/2;
s=s/2;
v=v/2;

clear ans fid  imgpath k l N s0 s1 s2 s3;

%%
%导入和计算样品
s0=zeros(2058,1232);
s1=s0;s2=s0;s3=s0;
S=s0;V=s0;

M=501;N=5;
for m=1:M
    parfor n=1:N
        imgpath=strcat('F:\实验\实验数据\CT\201409052018_16bitraw',int2str(m),'-',int2str(n),'.dat');
%     imgpath=strcat('F:\实验\实验数据\20140903\201409031112_16bitraw',num2str(k),'.dat');
    fid=fopen(imgpath,'r');
    I=fread(fid,[2058,1232],'int16');
    fclose(fid);
    I(2,1)=(I(1,1)+I(3,1))/2;
    I(4,1)=(I(3,1)+I(5,1))/2;
    s0=s0+I;
    s1=s1+I*sin(2*pi*n/N);
    s2=s2+I*cos(2*pi*n/N);
    S=S+I*exp(2*pi*1i*n/N);
    end
A0=s0/N;
V=V+(2/N*sqrt(s1.^2+s2.^2))./a0;

clear ans fid  imgpath ;

%计算最终的三个像
A=A0./a0;
P=angle(s./S);
VV=V./v;

%保存结果
%resultpath=('F:\实验\实验数据\CT\');
path1=strcat('F:\实验\实验数据\CT\absorb\A',int2str(m),'.mat');
save(path1,'A');

path2=strcat('F:\实验\实验数据\CT\refraction\P',int2str(m),'.mat');
save(path2,'P');

path3=strcat('F:\实验\实验数据\CT\scattering\V',int2str(m),'.mat');
save(path3,'VV');
end

% clear A0 a0 s S3 V v;