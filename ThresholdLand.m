% Threshold Accuracy

% Landscape

A = load('dist.mat','dist_array');
A = A.dist_array;

ThrL = zeros(1,length(A));
n = 0;
for i = 1:length(A)
    if A(i) > 73632299
        ThrL(i) = 1;
    end
    n = n + 1;
end

GTLL = load('GroundtruthL.mat','GTL');
GTL = GTLL.GTL;

errL = ThrL - GTL;
m = 0;
for i = 1:length(errL)
    if errL(i) == 0
        m = m + 1;
    end
end

acc = m / length(GTL);