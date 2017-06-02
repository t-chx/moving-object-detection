v = VideoReader('ALOri.mp4');

vHeight = v.Height;
vWidth = v.Width;
vTime = v.Duration;
vFrame = v.Frame;

s = struct('cdata',zeros(vHeight,vWidth,3,'uint8'),...
    'colormap',[]);

% numFrames = get(v,'NumberOfFrames');
% frame_time = zeros(numFrames,2);
 for k = 1:200
    s(k).cdata = read(v,k);
%     frame_time(k,1) = k;
%     frame_time(k,2) = k / vFrame; % frame corresponding time
    
    stemp = strcat(int2str(k),'.','jpg');
    imwrite(s(k).cdata,stemp);
 end