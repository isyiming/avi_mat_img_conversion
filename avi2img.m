function avi2img(name)
%将avi视频中血流图，每帧存储为图像保存
%     name='FloE_2.avi';
%输入：
%      name：文件路径
% Author : Ming, 11/4/2018
    mov_obj=VideoReader(name);
    numFrames = mov_obj.NumberOfFrames;  
    if ~exist('./FloE_2/') 
        mkdir('./FloE_2/')%若不存在，在当前目录中产生一个子目录./averageimg/
    end 

    % 读取视频的帧数  
    for ii = 1 : numFrames      
        frame = read(mov_obj,ii);                            % 读取每一帧      
        imshow(frame);                                  %显示每一帧      
        imwrite(frame,strcat('./FloE_2/',num2str(ii),'.png'),'png'); % 保存每一帧 
    end
end