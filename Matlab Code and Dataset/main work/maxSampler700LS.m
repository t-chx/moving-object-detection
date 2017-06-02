% max sampler 700

% Landscape
A = load('dist.mat','dist_array');
A = dist_array;

n = length(A)-700;
B = zeros(1,n);
for i = 351:(length(A)-350)
%     sum = 0;
%     for j = (i-5):(i+5)
%         sum = sum + A(j);
%     end
    B(i-350) = max(A((i-350):(i+350)));
end

figure
plot(1:(length(A)-700), B);
title('Landscape Frame Max Sampler 700');

t1 = (length(A)-700) * 0.04;
figure
plot(0.04:0.04:t1, B);
title('Landscape Time Max Sampler 700');
xlabel('Time');ylabel('Diff');
hold on 
% Plot ground truth 
xx1 = 284; yy1 = B(floor(xx1/0.04));
plot(xx1, yy1, 'rs');
text(xx1,yy1,['SmallCar']);
hold on
xx2 = 340; yy2 = B(floor(xx2/0.04));
plot(xx2, yy2, 'rs');
hold on
xx3 = 518; yy3 = B(floor(xx3/0.04));
plot(xx3, yy3, 'rs');
hold on
xx4 = 840; yy4 = B(floor(xx4/0.04));
plot(xx4, yy4, 'rs');
text(xx4,yy4,['SmallCar']);
hold on
xx5 = 895; yy5 = B(floor(xx5/0.04));
plot(xx5, yy5, 'rs');
text(xx5,yy5,['SmallCar']);
hold on
xx6 = 1295; yy6 = B(floor(xx6/0.04));
plot(xx6, yy6, 'rs');
hold on
xx7 = 1418; yy7 = B(floor(xx7/0.04));
plot(xx7, yy7, 'rs');
hold on
xx8 = 1430; yy8 = B(floor(xx8/0.04));
plot(xx8, yy8, 'rs');
hold on
xx9 = 1478; yy9 = B(floor(xx9/0.04));
plot(xx9, yy9, 'rs');
hold on
xx10 = 1881; yy10 = B(floor(xx10/0.04));
plot(xx10, yy10, 'rs');
text(xx10,yy10,['SmallCar']);
hold on
xx11 = 1964; yy11 = B(floor(xx11/0.04));
plot(xx11, yy11, 'rs');
hold on
xx12 = 2028; yy12 = B(floor(xx12/0.04));
plot(xx12, yy12, 'rs');
hold on
xx13 = 2339; yy13 = B(floor(xx13/0.04));
plot(xx13, yy13, 'rs');
hold on
xx14 = 2673; yy14 = B(floor(xx14/0.04));
plot(xx14, yy14, 'rs');
hold on
% xx15 = 2682; yy15 = B(floor(xx15/0.04));
% plot(xx15, yy15, 'rs');
% hold on
XX = [xx1,xx2,xx3,xx4,xx5,xx6,xx7,xx8,xx9,xx10,xx11,xx12,xx13,xx14];
YY = [yy1,yy2,yy3,yy4,yy5,yy6,yy7,yy8,yy9,yy10,yy11,yy12,yy13,yy14];
hold on
plot(XX,YY,'k--');
legend('Test Results','Ground Truth');