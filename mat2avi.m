function mat2avi(floe,savename)
%将mat文件存储为avi视频
%输入：
%      floe：血流图矩阵
%      savename：保存路径
% Author : Ming, 11/31/2018
    if ~exist(savename(1:length(savename)-4))
        mkdir(savename(1:length(savename)-4))%若不存在，在当前目录中产生一个子目录./averageimg/
    end

    outputVideo = VideoWriter(savename,'Uncompressed AVI');
    outputVideo.FrameRate = 15;
%     outputVideo.Quality = 100;
    open( outputVideo )
    if length(size(floe))==3%灰度图像
%         floe=floe./max(max(max(floe)));
        [height,width,deepth]=size(floe);%获取mat矩阵的大小，FloE为mat矩阵的句柄
    else%彩色图像
        [height,width,deepth,colordeepth]=size(floe);%获取mat矩阵的大小，FloE为mat矩阵的句柄
    end
    for kk=1:deepth
        if length(size(floe))==3%灰度图像
            img=floe(:,:,kk);
            img=reshape(img,[height,width]);        
        else%彩色图像
            img=floe(:,:,kk,:);
            img=reshape(img,[height,width,colordeepth]);
        end

        %写入视频
        figure(1);imshow((img));
%         Min=0.00;Max=0.70;
%         imshow(img, [Min Max]), colormap(gray);
%         frame1 = getframe;
        writeVideo( outputVideo, (img) )%写入
        imwrite(img,[savename(1:length(savename)-4),'\',num2str(kk),'.tif'],'Tiff'); % 保存灰度投影

        %写入gif
        frame3=getframe;
        I = frame3.cdata(:,:,1);
        if kk == 1
            imwrite((I),[savename(1:length(savename)-4),'.gif'],'gif', 'Loopcount',inf,'DelayTime',0.2);
        elseif rem(kk,5)==0
            imwrite((I),[savename(1:length(savename)-4),'.gif'],'gif','WriteMode','append','DelayTime',0.2);
        end
    end
    close(outputVideo)
end