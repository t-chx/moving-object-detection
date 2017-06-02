% SVM

% Landscape
A = load('dist.mat','dist_array');
A = A.dist_array;
T = [0.04:0.04:(0.04*length(A))];
x = [T',A'];
xx = A';
% Groud Truth 

GTL = zeros(1,length(A));

CarTimeL = [339,517,1293,1418,1430,1477,1962,2026,2337,2672,2682];

for i = 1: length(CarTimeL)
    for j = ((CarTimeL(i)-3)*25):((CarTimeL(i)+3)*25)
        GTL(j) = 1;
    end
end
% GTLL = load('GroundtruthL.mat','GTL');
% GTL = GTLL.GTL;

for i = (600*25):(800*25)
    GTL(i) = -1;
end
for i = (2400*25):(2600*25)
    GTL(i) = -1;
end

xxx = [];
TrainL = [];
for i = 1:length(A)
    if GTL(i)~= 0
        TrainL = [TrainL, GTL(i)];
        xxx = [xxx, A(i)];
    end
end
    
y = TrainL';

SVMStruct1 = svmtrain(xxx',y);
% SVMStruct2 = svmtrain(xx(20001:40000),y(20001:40000));
% SVMStruct3 = svmtrain(xx(40001:60000),y(40001:60000));
% SVMStruct4 = svmtrain(xx(60001:length(A)),y(60001:length(A)));

% LRL = svmclassify(SVMStruct,x, 'boxconstraint', 0.1); % default = 1, decrease it
% LRL = svmclassify(SVMStruct,x, 'tolkkt', 1e-2); % default = 1e-3, increase it
% LRL = svmclassify(SVMStruct,x, 'kktviolationlevel', 0.1); % default = 0, choose from [0, 1)

%LRL = svmclassify(SVMStruct,x,'Showplot',true); use this if you'd like a figure

SVML1 = svmclassify(SVMStruct1,xxx');

mmm = sum(SVML1 == y);

accSVML = mmm / length(y);

figure
plot(xxx',SVML1,'*');
title('SVM Landscape');
xlabel('Diff');ylabel('Value');

% Portrait
A1 = load('dist1.mat','dist_array1');
A1 = A1.dist_array1;
T1 = [0.04:0.04:(0.04*length(A1))];
x1 = [T1',A1'];
xx1 = A1';

% Groud Truth 

GTP = zeros(1,length(A1));

CarTimeP = [56,326,336,465,583,640,963,1088,1266,1274];

for i = 1: length(CarTimeP)
    for j = ((CarTimeP(i)-3)*25):((CarTimeP(i)+3)*25)
        GTP(j) = 1;
    end
end

for i = 1:(311*25)
    GTP(i) = -1;
end

xxx1 = [];
TrainP = [];
for i = 1:length(A1)
    if GTP(i)~= 0
        TrainP = [TrainP, GTP(i)];
        xxx1 = [xxx1, A1(i)];
    end
end
    
y1 = TrainP';

SVMStruct2 = svmtrain(xxx1',y1);
% SVMStruct2 = svmtrain(xx(20001:40000),y(20001:40000));
% SVMStruct3 = svmtrain(xx(40001:60000),y(40001:60000));
% SVMStruct4 = svmtrain(xx(60001:length(A)),y(60001:length(A)));

% LRL = svmclassify(SVMStruct,x, 'boxconstraint', 0.1); % default = 1, decrease it
% LRL = svmclassify(SVMStruct,x, 'tolkkt', 1e-2); % default = 1e-3, increase it
% LRL = svmclassify(SVMStruct,x, 'kktviolationlevel', 0.1); % default = 0, choose from [0, 1)

%LRL = svmclassify(SVMStruct,x,'Showplot',true); use this if you'd like a figure

SVMP = svmclassify(SVMStruct2,xxx1');

mmm1 = sum(SVMP == y1);

accSVMP = mmm1 / length(y1);

figure
plot(xxx1',SVMP,'*');
title('SVM Portrait');
xlabel('Diff');ylabel('Value');