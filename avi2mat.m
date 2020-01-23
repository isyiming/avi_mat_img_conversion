function img_mat=avi2mat(name)
%将avi视频中血流图，每帧存储为图像保存
%     name='FloE_2.avi';
%输入：
%      name：文件路径
% Author : Ming, 11/4/2018
    mov_obj=VideoReader(name);
    numFrames = mov_obj.NumberOfFrames;  
    I = read(mov_obj,1);               % 读取每一帧      
    if length(size(I))>2
        I=double(rgb2gray(I));
    else
        I=double(I);
    end 
    [height,width]=size(I);
    img_mat=zeros(height,width,numFrames);

    % 读取视频的帧数  
    for ii = 1 : numFrames      
        frame = read(mov_obj,ii);                            % 读取每一帧      
        imshow(frame);                                  %显示每一帧      
%         imwrite(frame,strcat('./FloE_2/',num2str(ii),'.png'),'png'); % 保存每一帧 
        if length(size(frame))>2
            frame=double(rgb2gray(frame));
        else
            frame=double(mat2gray(frame));
        end    
        img_mat(:,:,ii)=frame;
    end
    
    save([name(1:length(name)-3),'mat'],'img_mat','-v7.3');

end