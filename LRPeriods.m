% Logistic Regression Used Specfic periods

% Landscape
A = load('dist.mat','dist_array');
A = A.dist_array;

% Groud Truth 

GTL = -ones(1,length(A));

CarTimeL = [339,517,1293,1418,1430,1477,1962,2026,2337,2672,2682];

for i = 1: length(CarTimeL)
    for j = ((CarTimeL(i)-3)*25):((CarTimeL(i)+3)*25)
        GTL(j) = 1;
    end
end
% GTLL = load('GroundtruthL.mat','GTL');
% GTL = GTLL.GTL;

for i = (600*25):(800*25)
    GTL(i) = 0;
end
for i = (2400*25):(2600*25)
    GTL(i) = 0;
end

xx = [];
GTLRL = [];
for i = 1:length(A)
    if GTL(i)~= -1
        GTLRL = [GTLRL, GTL(i)];
        xx = [xx, A(i)];
    end
end
% GTLL = load('GroundtruthL.mat','GTL');
% GTL = GTLL.GTL;
y = GTLRL';

theta = glmfit(xx, y, 'binomial', 'link', 'logit');

Y = zeros(length(xx),1);
LRL = zeros(1,length(xx));
nn = 0;
for i = 1:length(Y)
    Y(i) = 1/(1+exp((-theta(1))- theta(2)*xx(i)));
    if Y(i) > 0.5
        LRL(i) = 1;
        nn = nn + 1;
    end
end

figure
plot(xx,Y,'*');
title('Logistic Regression in Specfic Periods(Horizontal)');
xlabel('Diff');ylabel('Value');

mm = sum(LRL == GTLRL);

accLRL1 = mm / length(LRL);

% Portrait

A1 = load('dist1.mat','dist_array1');
A1 = A1.dist_array1;
% Groud Truth 

GTP = -ones(1,length(A1));

CarTimeP = [56,326,336,465,583,640,963,1088,1266,1274];

for i = 1: length(CarTimeP)
    for j = ((CarTimeP(i)-3)*25):((CarTimeP(i)+3)*25)
        GTP(j) = 1;
    end
end

for i = 1:(311*25)
    GTP(i) = 0;
end

xx1 = [];
GTLRP = [];
for i = 1:length(A1)
    if GTP(i)~= -1
        GTLRP = [GTLRP, GTP(i)];
        xx1 = [xx1, A1(i)];
    end
end
% GTLL = load('GroundtruthL.mat','GTL');
% GTL = GTLL.GTL;
y1 = GTLRP';

theta1 = glmfit(xx1, y1, 'binomial', 'link', 'logit');

Y1 = zeros(length(xx1),1);
LRP = zeros(1,length(xx1));
nn1 = 0;
for i = 1:length(Y1)
    Y1(i) = 1/(1+exp((-theta1(1))- theta1(2)*xx1(i)));
    if Y1(i) > 0.5
        LRP(i) = 1;
        nn1 = nn1 + 1;
    end
end

figure
plot(xx1,Y1,'*');
title('Logistic Regression in Specfic Periods(Vertical)');
xlabel('Diff');ylabel('Value');

mm1 = sum(LRP == GTLRP);

accLRP1 = mm1 / length(LRP);

