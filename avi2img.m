function avi2img(name)
%��avi��Ƶ��Ѫ��ͼ��ÿ֡�洢Ϊͼ�񱣴�
%     name='FloE_2.avi';
%���룺
%      name���ļ�·��
% Author : Ming, 11/4/2018
    mov_obj=VideoReader(name);
    numFrames = mov_obj.NumberOfFrames;  
    if ~exist('./FloE_2/') 
        mkdir('./FloE_2/')%�������ڣ��ڵ�ǰĿ¼�в���һ����Ŀ¼./averageimg/
    end 

    % ��ȡ��Ƶ��֡��  
    for ii = 1 : numFrames      
        frame = read(mov_obj,ii);                            % ��ȡÿһ֡      
        imshow(frame);                                  %��ʾÿһ֡      
        imwrite(frame,strcat('./FloE_2/',num2str(ii),'.png'),'png'); % ����ÿһ֡ 
    end
end