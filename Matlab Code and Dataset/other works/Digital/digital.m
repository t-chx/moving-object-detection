v1 = VideoReader('A0.mp4');
v2 = VideoReader('B0.mp4');
% r1 = reference video
% Calibration

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
stemp11 = strcat('A0-',int2str(minDistI1),'.','jpg');
imwrite(s1(minDistI1).cdata,stemp11);

stemp21 = strcat('B0-',int2str(minDistI2),'.','jpg');
imwrite(s2(minDistI2).cdata,stemp21);
   
    
%Calculate Average Distance Between two Videos

%number of frames left
%minDistI1 = 75;
%minDistI2 = 74;
% numFramesToBeConsider = min(numFrames1 - minDistI1, numFrames2 - minDistI2) - 1;
% dist_array = zeros(1, numFramesToBeConsider);
% %distSum = 0;
% for k = 1:numFramesToBeConsider
%     %instead of storing frames, read only needed frame on the fly
%     dist_array(k) = sum(sum(sum(abs(read(v1, minDistI1 + k) - read(v2, minDistI2 + k)))));
%     %distSum = distSum + sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
% end
% avgDist = mean (dist_array);

% With Disturb
% Calculate Real distance after calibration with disturb
j1 = VideoReader('A1.mp4');
j2 = VideoReader('B1.mp4');
% r1 = reference video
% Calibration

j1Height = j1.Height;
j2Height = j2.Height;
j1Width = j1.Width;
j2Width = j2.Width;
j1Frame = j1.Frame;

ss1 = struct('cdata',zeros(j1Height,j1Width,3,'uint8'),...
    'colormap',[]);
ss2 = struct('cdata',zeros(j2Height,j2Width,3,'uint8'),...
    'colormap',[]);

numFrames11 = get(j1,'NumberOfFrames');
numFrames22 = get(j2,'NumberOfFrames');

for k1 = 1:min(numFrames11,200)
    ss1(k1).cdata = read(j1,k1);
end
 
for k2 = 1:min(numFrames22,200)
    ss2(k2).cdata = read(j2,k2);
end

%Calibration

%max delay between two videos
maxMissMatchLen = 100;

%number of frames considered for calibration
windowLen = 50;

%min distance and corresponding start frames of two videos
minDistSum = Inf;
minDistI11 = 0;
minDistI22 = 0;

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
            minDistI11 = i1;
            minDistI22 = i2;
        end
    end
end

% Show the same frame
stemp12 = strcat('A1-',int2str(minDistI11),'.','jpg');
imwrite(ss1(minDistI11).cdata,stemp12);

stemp22 = strcat('B1-',int2str(minDistI22),'.','jpg');
imwrite(ss2(minDistI22).cdata,stemp22);

%Calculate Average Real Distance Between two Videos

%number of frames left
numFramesToBeConsider = min([(numFrames1 - minDistI1), (numFrames2 - minDistI2), (numFrames11 - minDistI11), (numFrames22 - minDistI22)]) - 1;
dist_array = zeros(1, numFramesToBeConsider);
%distSum = 0;
for k = 1:numFramesToBeConsider
    %instead of storing frames, read only needed frame on the fly
    dist_array(k) = sum(sum(sum(abs(read(v1, minDistI1 + k) - read(v2, minDistI2 + k)))));
    %distSum = distSum + sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
end
avgDist = mean (dist_array);

dist_array1 = zeros(1, numFramesToBeConsider);
%distSum = 0;
for k = 1:numFramesToBeConsider
    dist_array1(k) = sum(sum(sum(abs(read(j1, minDistI11 + k) - read(j2, minDistI22 + k)))));
    %dist_array1(k) = sum(sum(sum(abs(ss1(minDistI11 + k).cdata - ss2(minDistI22 + k).cdata))));
    %distSum = distSum + sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
end
realDist = mean (dist_array1) - avgDist;

% Plot the total figure
numofFrame = numFramesToBeConsider * 2;
dist_arrays = [dist_array, dist_array1];
figure
plot(1:numFramesToBeConsider, dist_array,(numFramesToBeConsider + 1):numofFrame,dist_array1,'g');
title('Digital Difference');
xlabel('No.Frames');ylabel('Diff');