function image2mat(location)
%������ͼ��洢Ϊmat
%���룺
%      location������ͼƬ·��
% Author : Ming, 7/33/2018
%     location='/Users/zhangyiming/Desktop/data/complex/';
    complex_abs=zeros(512,500,512*2);
    for kk=1:5*512
        img=imread(strcat(location,num2str(kk),'.tif'));
        figure(1);
        imshow(mat2gray(img));
        complex_abs(:,:,kk)=img;  %д��
    end
    save('/Users/zhangyiming/Desktop/data/complex_abs.mat','complex_abs','-v7.3');

end