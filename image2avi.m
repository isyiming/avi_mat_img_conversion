function image2avi(location)
%������ͼ��洢Ϊavi��Ƶ
%���룺
%      location������ͼƬ·��
% Author : Ming, 7/33/2018
%     location='/Users/zhangyiming/Desktop/data/complex/';
    outputVideo = VideoWriter( fullfile(  '/Users/ming/Desktop/data/', '0.5_Flo_13.avi' ) );
    outputVideo.FrameRate = 15;
    outputVideo.Quality = 100;
    open( outputVideo )
%     [height,width,deepth]=size(floe);%��ȡmat����Ĵ�С��FloEΪmat����ľ��
    
    for kk=1:200
        img=imread(strcat(location,num2str(kk),'.png'));
        figure(1);
        imshow(mat2gray(img));
        writeVideo( outputVideo, img )%д��
    end
    close(outputVideo)
end