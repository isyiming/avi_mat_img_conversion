function img_mat=avi2mat(name)
%��avi��Ƶ��Ѫ��ͼ��ÿ֡�洢Ϊͼ�񱣴�
%     name='FloE_2.avi';
%���룺
%      name���ļ�·��
% Author : Ming, 11/4/2018
    mov_obj=VideoReader(name);
    numFrames = mov_obj.NumberOfFrames;  
    I = read(mov_obj,1);               % ��ȡÿһ֡      
    if length(size(I))>2
        I=double(rgb2gray(I));
    else
        I=double(I);
    end 
    [height,width]=size(I);
    img_mat=zeros(height,width,numFrames);

    % ��ȡ��Ƶ��֡��  
    for ii = 1 : numFrames      
        frame = read(mov_obj,ii);                            % ��ȡÿһ֡      
        imshow(frame);                                  %��ʾÿһ֡      
%         imwrite(frame,strcat('./FloE_2/',num2str(ii),'.png'),'png'); % ����ÿһ֡ 
        if length(size(frame))>2
            frame=double(rgb2gray(frame));
        else
            frame=double(mat2gray(frame));
        end    
        img_mat(:,:,ii)=frame;
    end
    
    save([name(1:length(name)-3),'mat'],'img_mat','-v7.3');

end