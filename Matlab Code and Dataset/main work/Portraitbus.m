w1 = VideoReader('APOri.mp4');
w2 = VideoReader('BPOri.mp4');

w1Height = w1.Height;
w2Height = w2.Height;
w1Width = w1.Width;
w2Width = w2.Width;
w1Frame = w1.Frame;

ss1 = struct('cdata',zeros(w1Height,w1Width,3,'uint8'),...
    'colormap',[]);
ss2 = struct('cdata',zeros(w2Height,w2Width,3,'uint8'),...
    'colormap',[]);

numFrames1 = get(w1,'NumberOfFrames');
numFrames2 = get(w2,'NumberOfFrames');

%read at most 200 frames for calibration
for k1 = 1:min(numFrames1, 200)
    ss1(k1).cdata = read(w1,k1);
end
 
for k2 = 1:min(numFrames2, 200)
    ss2(k2).cdata = read(w2,k2);
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
            curDistSum = curDistSum + sum(sum(sum(abs(ss1(i1 + k).cdata - ss2(i2 + k).cdata))));
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
stemp11 = strcat('APOri-',int2str(minDistI1),'.','jpg');
imwrite(ss1(minDistI1).cdata,stemp11);

stemp21 = strcat('BPOri-',int2str(minDistI2),'.','jpg');
imwrite(ss2(minDistI2).cdata,stemp21);
   
    

%Image Comparison
%Calculate Average Distance Between two Videos

%number of frames left

numFramesToBeConsider = min(numFrames1 - minDistI1, numFrames2 - minDistI2) - 1;
dist_array1 = zeros(1, numFramesToBeConsider);
%distSum = 0;
for k = 1:numFramesToBeConsider
    %instead of storing frames, read only needed frame on the fly
    dist_array1(k) = sum(sum(sum(abs(read(w1, minDistI1 + k) - read(w2, minDistI2 + k)))));
    %distSum = distSum + sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
end
avgDist1 = mean (dist_array1);

% frame_time(numFramesToBeConsider,1) = numFramesToBeConsider;
% frame_time(numFramesToBeConsider,2) = numFramesToBeConsider / v1Frame;

figure
plot(1:numFramesToBeConsider, dist_array1);
title('Portrait Frame Original');
xlabel('No.Frames');ylabel('Diff');

t0 = 1/w1Frame;
t = numFramesToBeConsider * (1/w1Frame);
figure
plot(0.04:0.04:t, dist_array1);
title('Portrait Time Original');
xlabel('Time');ylabel('Diff');

save dist1 dist_array1;