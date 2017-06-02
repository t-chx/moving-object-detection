% Threshold Accuracy

% Portrait

A1 = load('dist1.mat','dist_array1');
A1 = A1.dist_array1;

ThrP = zeros(1,length(A1));
n1 = 0;
for i = 1:length(A1)
    if A1(i) > 37629545
        ThrP(i) = 1;
    end
    n1 = n1 + 1;
end

GTPP = load('GroundtruthP.mat','GTP');
GTP = GTPP.GTP;

errP = ThrP - GTP;
m1 = 0;
for i = 1:length(errP)
    if errP(i) == 0
        m1 = m1 + 1;
    end
end

acc1 = m1 / length(GTP);