function mat2img(floe,savename)
%将mat文件存储为图片,deepth方向
%输入：
%      floe：血流图矩阵
%      savename：保存路径
%输出：
%      img：滤波结果
% Author : Ming, 11/31/2018
    [height,width,deepth]=size(floe);%获取mat矩阵的大小，FloE为mat矩阵的句柄
    if ~exist([savename,'/FloE_1/']) 
        mkdir([savename,'/FloE_1/'])%若不存在，在当前目录中产生一个子目录./averageimg/
    end 
    for kk=1:deepth
        img=floe(:,:,kk);
%         w=fspecial('gaussian',[3,3],1);
%         img=imfilter(img,w,'replicate');
        img=MedianFilterWithOriginalImage(img);

        %写入视频
        figure(1);
        imshow(mat2gray(img));
        imwrite(mat2gray(img),strcat(savename,'/FloE_1/',num2str(kk),'.png'),'png'); % 保存每一帧 
    end
end