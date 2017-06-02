% Logistic Regression

% Landscape
A = load('dist.mat','dist_array');
A = A.dist_array;
x = A';
GTLL = load('GroundtruthL.mat','GTL');
GTL = GTLL.GTL;
y = GTL';

theta = glmfit(x, y, 'binomial', 'link', 'logit');

Y = zeros(length(x),1);
LRL = zeros(1,length(x));
nn = 0;
for i = 1:length(Y)
    Y(i) = 1/(1+exp((-theta(1))- theta(2)*x(i)));
    if Y(i) > 0.5
        LRL(i) = 1;
        nn = nn + 1;
    end
end

figure
plot(x,Y,'*');
title('Logistic Regression in Horizontal Orientation');
xlabel('Diff');ylabel('Value');

GTLL = load('GroundtruthL.mat','GTL');
GTL = GTLL.GTL;

errLLR = LRL - GTL;
mm = 0;
for i = 1:length(errLLR)
    if errLLR(i) == 0
        mm = mm + 1;
    end
end

accLRL = mm / length(GTL);



% Portrait

A1 = load('dist1.mat','dist_array1');
A1 = A1.dist_array1;
x1 = A1';
GTPP = load('GroundtruthP.mat','GTP');
GTP = GTPP.GTP;
y1 = GTP';

theta1 = glmfit(x1, y1, 'binomial', 'link', 'logit');

Y1 = zeros(length(x1),1);
LRP = zeros(1,length(x1));
nn1 = 0;
for i = 1:length(Y1)
    Y1(i) = 1/(1+exp((-theta1(1))- theta1(2)*x1(i)));
    if Y1(i) > 0.5
        LRP(i) = 1;
        nn1 = nn1 + 1;
    end
end
figure
plot(x1,Y1);

GTPP = load('GroundtruthP.mat','GTP');
GTP = GTPP.GTP;

errPLR = LRP - GTP;
mm1 = 0;
for i = 1:length(errPLR)
    if errPLR(i) == 0
        mm1 = mm1 + 1;
    end
end

accLRP = mm1 / length(GTP);

figure
plot(x1,Y1,'*');
title('Logistic Regression in Vertical Orientation');
xlabel('Diff');ylabel('Value');

