finalDataPath = 'D:\Data\第1批斑马鱼数据\2018-9-5_mecp2 6d_fish6_320-210-10_Results\1_Denoised\N2V_result.tif';
finalOutputPath = 'D:\Data\第1批斑马鱼数据\2018-9-5_mecp2 6d_fish6_320-210-10_Results\1_Denoised\';
part = 1;%part = 0.01;代表仅处理1%的图像

Info=imfinfo(finalDataPath);                                     %%获取图片信息并判断是否为tif
tif='tif';
format=Info.Format;

if (strcmp(format ,tif)==0)
    disp('载入的不是tif图像，请确认载入的数据');                  %%确保载入的图像是tiff图像
end

Slice=size(Info,1)*part;                                           %%获取图片z向帧数
Width=Info.Width;
Height=Info.Height;
Image=zeros(Height,Width,Slice);
for i=1:Slice
    Image(:,:,i) = imread(finalDataPath,i);                                  %%一层一层的读入图像
    %     disp(['writing...' num2str(i)])
end


minValue = min(Image(:));
maxValue = max(Image(:));