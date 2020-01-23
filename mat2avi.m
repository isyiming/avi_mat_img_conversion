function mat2avi(floe,savename)
%��mat�ļ��洢Ϊavi��Ƶ
%���룺
%      floe��Ѫ��ͼ����
%      savename������·��
% Author : Ming, 11/31/2018
    if ~exist(savename(1:length(savename)-4))
        mkdir(savename(1:length(savename)-4))%�������ڣ��ڵ�ǰĿ¼�в���һ����Ŀ¼./averageimg/
    end

    outputVideo = VideoWriter(savename,'Uncompressed AVI');
    outputVideo.FrameRate = 15;
%     outputVideo.Quality = 100;
    open( outputVideo )
    if length(size(floe))==3%�Ҷ�ͼ��
%         floe=floe./max(max(max(floe)));
        [height,width,deepth]=size(floe);%��ȡmat����Ĵ�С��FloEΪmat����ľ��
    else%��ɫͼ��
        [height,width,deepth,colordeepth]=size(floe);%��ȡmat����Ĵ�С��FloEΪmat����ľ��
    end
    for kk=1:deepth
        if length(size(floe))==3%�Ҷ�ͼ��
            img=floe(:,:,kk);
            img=reshape(img,[height,width]);        
        else%��ɫͼ��
            img=floe(:,:,kk,:);
            img=reshape(img,[height,width,colordeepth]);
        end

        %д����Ƶ
        figure(1);imshow((img));
%         Min=0.00;Max=0.70;
%         imshow(img, [Min Max]), colormap(gray);
%         frame1 = getframe;
        writeVideo( outputVideo, (img) )%д��
        imwrite(img,[savename(1:length(savename)-4),'\',num2str(kk),'.tif'],'Tiff'); % ����Ҷ�ͶӰ

        %д��gif
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