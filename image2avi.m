function image2avi(location)
%将序列图像存储为avi视频
%输入：
%      location：输入图片路径
% Author : Ming, 7/33/2018
%     location='/Users/zhangyiming/Desktop/data/complex/';
    outputVideo = VideoWriter( fullfile(  '/Users/ming/Desktop/data/', '0.5_Flo_13.avi' ) );
    outputVideo.FrameRate = 15;
    outputVideo.Quality = 100;
    open( outputVideo )
%     [height,width,deepth]=size(floe);%获取mat矩阵的大小，FloE为mat矩阵的句柄
    
    for kk=1:200
        img=imread(strcat(location,num2str(kk),'.png'));
        figure(1);
        imshow(mat2gray(img));
        writeVideo( outputVideo, img )%写入
    end
    close(outputVideo)
end