% Groud Truth 
% Landscape

A = load('dist.mat','dist_array');
A = A.dist_array;

t = length(A) * (1/25);
T = [0.04:0.04:t];

GTL = zeros(1,length(A));

CarTimeL = [339,517,1293,1418,1430,1477,1962,2026,2337,2672,2682];

for i = 1: length(CarTimeL)
    for j = ((CarTimeL(i)-3)*25):((CarTimeL(i)+3)*25)
        GTL(j) = 1;
    end
end
save GroundtruthL GTL;

% Portrait

A1 = load('dist1.mat','dist_array1');
A1 = A1.dist_array1;

GTP = zeros(1,length(A1));

CarTimeP = [56,326,336,465,583,640,963,1088,1266,1274];

for i = 1: length(CarTimeP)
    for j = ((CarTimeP(i)-3)*25):((CarTimeP(i)+3)*25)
        GTP(j) = 1;
    end
end
save GroundtruthP GTP;