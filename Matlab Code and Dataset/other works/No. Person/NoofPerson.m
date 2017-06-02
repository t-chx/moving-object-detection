% No. of Person

% input no of person

NoPerson = 5;

% Read every video
% CalibrationVideo is A0, B0
v1 = VideoReader('A0.mp4');
v2 = VideoReader('B0.mp4');

v1Height = v1.Height;
v2Height = v2.Height;
v1Width = v1.Width;
v2Width = v2.Width;

s1 = struct('cdata',zeros(v1Height,v1Width,3,'uint8'),...
    'colormap',[]);
s2 = struct('cdata',zeros(v2Height,v2Width,3,'uint8'),...
    'colormap',[]);

numFrames1 = get(v1,'NumberOfFrames');
numFrames2 = get(v2,'NumberOfFrames');

for k1 = 1:numFrames1
    s1(k1).cdata = read(v1,k1);
end
 
for k2 = 1:numFrames2
    s2(k2).cdata = read(v2,k2);
end

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

frames1 = numFrames1 - minDistI1;
frames2 = numFrames2 - minDistI2;
% number of frames left
% numFramesToBeConsider = min(numFrames1 - minDistI1, numFrames2 - minDistI2) - 1;
% dist_array = zeros(1, numFramesToBeConsider);
% %distSum = 0;
% for k = 1:numFramesToBeConsider
%     dist_array(k) = sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
%     %distSum = distSum + sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
% end
% avgDist = mean (dist_array);


% No. of Person
numFrames11 = zeros(1, NoPerson);
numFrames22 = zeros(1, NoPerson);
minDistI11 = zeros(1, NoPerson);
minDistI22 = zeros(1, NoPerson);
frames11 = zeros(1, NoPerson);
frames22 = zeros(1, NoPerson);

for n = 1: NoPerson
    % read video
    str1 = strcat('A',int2str(n),'.mp4');
    j1 = VideoReader(str1);
    str2 = strcat('B',int2str(n),'.mp4');
    j2 = VideoReader(str2);
    
    % video parameters
    j1Height = j1.Height;
    j2Height = j2.Height;
    j1Width = j1.Width;
    j2Width = j2.Width;
   
    ss1 = struct('cdata',zeros(j1Height,j1Width,3,'uint8'),...
        'colormap',[]);
    ss2 = struct('cdata',zeros(j2Height,j2Width,3,'uint8'),...
        'colormap',[]);

    numFrames11(n) = get(j1,'NumberOfFrames');
    numFrames22(n) = get(j2,'NumberOfFrames');

    for k1 = 1:numFrames11(n)
        ss1(k1).cdata = read(j1,k1);
    end

    for k2 = 1:numFrames22(n)
        ss2(k2).cdata = read(j2,k2);
    end

    %Calibration

    %max delay between two videos
    maxMissMatchLen = 100;

    %number of frames considered for calibration
    windowLen = 50;

    %min distance and corresponding start frames of two videos
    minDistSum = Inf;
    minDistI11(n) = 0;
    minDistI22(n) = 0;

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
                minDistI11(n) = i1;
                minDistI22(n) = i2;
            end
        end
    end

    % Show the same frame
    stemp12 = strcat('A',int2str(n),'-',int2str(minDistI11(n)),'.','jpg');
    imwrite(ss1(minDistI11(n)).cdata,stemp12);

    stemp22 = strcat('B',int2str(n),'-',int2str(minDistI22(n)),'.','jpg');
    imwrite(ss2(minDistI22(n)).cdata,stemp22);

    frames11(n) = numFrames11(n) - minDistI11(n);
    frames22(n) = numFrames22(n) - minDistI22(n);
    
end

% Calculate the number of frames left
numFramesToBeConsider = min([min(frames11), min(frames22), frames1, frames2]) - 1;

% A0,B0
dist_array = zeros(1, numFramesToBeConsider);
for k = 1:numFramesToBeConsider
    dist_array(k) = sum(sum(sum(abs(s1(minDistI1 + k).cdata - s2(minDistI2 + k).cdata))));
end
avgDist = mean (dist_array);

figure
plot(1:numFramesToBeConsider, dist_array);
title('Diff of 0 Person');
xlabel('No.Frames');ylabel('Diff');
% saveas(fig,'Diff of 0 Person.png');

% Calculate the real distance
dist = zeros(NoPerson,numFramesToBeConsider);
realDist = zeros(1,NoPerson);
for n = 1: NoPerson
    % read video
    str1 = strcat('A',int2str(n),'.mp4');
    j1 = VideoReader(str1);
    str2 = strcat('B',int2str(n),'.mp4');
    j2 = VideoReader(str2);
    
    % video parameters
    j1Height = j1.Height;
    j2Height = j2.Height;
    j1Width = j1.Width;
    j2Width = j2.Width;
   
    ss1 = struct('cdata',zeros(j1Height,j1Width,3,'uint8'),...
        'colormap',[]);
    ss2 = struct('cdata',zeros(j2Height,j2Width,3,'uint8'),...
        'colormap',[]);

    numFrames11(n) = get(j1,'NumberOfFrames');
    numFrames22(n) = get(j2,'NumberOfFrames');

    for k1 = 1:numFrames11(n)
        ss1(k1).cdata = read(j1,k1);
    end

    for k2 = 1:numFrames22(n)
        ss2(k2).cdata = read(j2,k2);
    end
    
    for k = 1:numFramesToBeConsider
        dist(n,k) = sum(sum(sum(abs(ss1(minDistI11(n) + k).cdata - ss2(minDistI22(n) + k).cdata))));
    end
    
    realDist(n) = mean (dist(n,:)) - avgDist;
    
%     figure
%     plot(1:numFramesToBeConsider, dist(n,:));
%     filename = strcat('Diff of',int2str(n),' person.png');
%     title(filename);
%     xlabel('No.Frames');ylabel('Diff');
%     saveas(fig, filename, 'png');
    % title
    % save
end

figure
plot(1:numFramesToBeConsider, dist_array,'y',(numFramesToBeConsider + 1):(numFramesToBeConsider*2),dist(1,:),'m',(numFramesToBeConsider*2 + 1):(numFramesToBeConsider*3),dist(2,:),'c',(numFramesToBeConsider*3 + 1):(numFramesToBeConsider*4),dist(3,:),'r',(numFramesToBeConsider*4 + 1):(numFramesToBeConsider*5),dist(4,:),'g',(numFramesToBeConsider*5 + 1):(numFramesToBeConsider*6),dist(5,:),'b');
title('Diff of Person');
xlabel('No.Frames');ylabel('Diff');
% saveas(fig,'Diff of Person1.png');

figure
plot(1:numFramesToBeConsider, dist_array,'y');
hold on
plot(1:numFramesToBeConsider, dist(1,:),'m');
hold on
plot(1:numFramesToBeConsider, dist(2,:),'c');
hold on
plot(1:numFramesToBeConsider, dist(3,:),'r');
hold on
plot(1:numFramesToBeConsider, dist(4,:),'g');
hold on
plot(1:numFramesToBeConsider, dist(5,:),'b');
hold off
legend('0 Person','1 Person','2 Person','3 Person','4 Person','5 Person');
title('Diff of Person');
xlabel('No.Frames');ylabel('Diff');
% saveas(fig, 'Diff of Person.png');

% Dist = [dist_array;dist];
% % 3D Figure
% plot3(1:numFramesToBeConsider,dist_array,0);
% hold on
% plot3(1:numFramesToBeConsider,dist,1:NoPerson);
% title('Diff of No of Person in 3D');
% xlabel('No.Frames');ylabel('Diff');zlabel('NoPerson');
% saveas(fig,'Diff of No of Person in 3D.png');
