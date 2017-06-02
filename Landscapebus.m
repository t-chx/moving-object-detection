v1 = VideoReader('ALOri.mp4');
v2 = VideoReader('BLOri.mp4');

v1Height = v1.Height;
v2Height = v2.Height;
v1Width = v1.Width;
v2Width = v2.Width;
v1Frame = v1.Frame;

s1 = struct('cdata',zeros(v1Height,v1Width,3,'uint8'),...
    'colormap',[]);
s2 = struct('cdata',zeros(v2Height,v2Width,3,'uint8'),...
    'colormap',[]);

numFrames1 = get(v1,'NumberOfFrames');
numFrames2 = get(v2,'NumberOfFrames');

%read at most 200 frames for calibration
for k1 = 1:min(numFrames1, 200)
    s1(k1).cdata = read(v1,k1);
end
 
for k2 = 1:min(numFrames2, 200)
    s2(k2).cdata = read(v2,k2);
end

%Calibration

%max delay between two videos
maxMissMatchLen = 100;

%number of frames considered for calibration
windowLen = 50;

%min distance and corresponding start frames of two videos
minDistSum = Inf;
minDistI1 = 0;
minDistI2 = 0;

%enumerate possible start frames for two videos
for i1 = 1:maxMissMatchLen
    disp(strcat('iteration i1 = ', int2str(i1)));
    for i2 = 1:maxMissMatchLen
        %calculate distance with i1, i2 as start frames
        curDistSum = 0;
        for k = 1:windowLen
            curDistSum = curDistSum + sum(sum(sum(abs(s1(i1 + k).cdata - s2(i2 + k).cdata))));
        end
        %record min distance and corresponding i1, i2
        if minDistSum > curDistSum
            minDistSum = curDistSum;
            minDistI1 = i1;
            minDistI2 = i2;
        end
    end
end

% Show the same frame
stemp11 = strcat('ALOri-',int2str(minDistI1),'.','jpg');
imwrite(s1(minDistI1).cdata,stemp11);

stemp21 = strcat('BLOri-',int2str(minDistI2),'.','jpg');
imwrite(s2(minDistI2).cdata,stemp21);
   
%Image Comparison  
%Calculate Average Distance Between two Videos

%number of frames left

numFramesToBeConsider = min(numFrames1 - minDistI1, numFrames2 - minDistI2) - 1;
dist_array = zeros(1, numFramesToBeConsider);
%distSum = 0;
for k = 1:numFramesToBeConsider
    %instead of storing frames, read only needed frame on the fly
    dist_array(k) = sum(sum(sum(abs(read(v1, minDistI1 + k) - read(v2, minDistI2 + k)))));
    %distSum = distSum + sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
end
avgDist = mean (dist_array);

% frame_time(numFramesToBeConsider,1) = numFramesToBeConsider;
% frame_time(numFramesToBeConsider,2) = numFramesToBeConsider / v1Frame;

figure
plot(1:numFramesToBeConsider, dist_array);
title('Landscape Frame Original');
xlabel('No.Frames');ylabel('Diff');

t0 = 1/v1Frame;
t = numFramesToBeConsider * (1/v1Frame);
figure
plot(0.04:0.04:t, dist_array);
title('Landscape Time Original');
xlabel('Time');ylabel('Diff');

save dist dist_array;