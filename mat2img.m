function mat2img(floe,savename)
%��mat�ļ��洢ΪͼƬ,deepth����
%���룺
%      floe��Ѫ��ͼ����
%      savename������·��
%�����
%      img���˲����
% Author : Ming, 11/31/2018
    [height,width,deepth]=size(floe);%��ȡmat����Ĵ�С��FloEΪmat����ľ��
    if ~exist([savename,'/FloE_1/']) 
        mkdir([savename,'/FloE_1/'])%�������ڣ��ڵ�ǰĿ¼�в���һ����Ŀ¼./averageimg/
    end 
    for kk=1:deepth
        img=floe(:,:,kk);
%         w=fspecial('gaussian',[3,3],1);
%         img=imfilter(img,w,'replicate');
        img=MedianFilterWithOriginalImage(img);

        %д����Ƶ
        figure(1);
        imshow(mat2gray(img));
        imwrite(mat2gray(img),strcat(savename,'/FloE_1/',num2str(kk),'.png'),'png'); % ����ÿһ֡ 
    end
end