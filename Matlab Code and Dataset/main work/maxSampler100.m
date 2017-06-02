% max sampler 100

% Landscape
A = load('dist.mat','dist_array');
A = dist_array;

n = length(A)-100;
B = zeros(1,n);
for i = 51:(length(A)-50)
%     sum = 0;
%     for j = (i-5):(i+5)
%         sum = sum + A(j);
%     end
    B(i-50) = max(A((i-50):(i+50)));
end

figure
plot(1:(length(A)-100), B);
title('Landscape Frame Max Sampler 100');

t1 = (length(A)-100) * 0.04;
figure
plot(0.04:0.04:t1, B);
title('Landscape Time Max Sampler 100');
xlabel('Time');ylabel('Diff');


% Portrait
A1 = load('dist1.mat','dist_array1');
A1 = dist_array1;

n1 = length(A1)-100;
B1 = zeros(1,n1);
for i = 51:(length(A1)-50)
%     sum = 0;
%     for j = (i-5):(i+5)
%         sum = sum + A(j);
%     end
    B1(i-50) = max(A1((i-50):(i+50)));
end

figure
plot(1:(length(A1)-100), B1);
title('Portrait Frame Max Sampler 100');

t2 = (length(A1)-100) * 0.04;
figure
plot(0.04:0.04:t2, B1);
title('Portrait Time Max Sampler 100');
xlabel('Time');ylabel('Diff');
hold on 
% Plot ground truth
x1 = 58; y1 = B1(floor(x1/0.04));
plot(x1, y1, 'rs');
hold on
x2 = 328; y2 = B1(floor(x2/0.04));
plot(x2, y2, 'rs');
hold on
x3 = 336; y3 = B1(floor(x3/0.04));
plot(x3, y3, 'rs');
hold on
x4 = 466; y4 = B1(floor(x4/0.04));
plot(x4, y4, 'rs');
text(x4,y4,['Airplane']);
hold on
x5 = 513; y5 = B1(x5/0.04);
plot(x5, y5, 'rs');
text(x5,y5,['SmallCar']);
hold on
x6 = 583; y6 = B1(x6/0.04);
plot(x6, y6, 'rs');
hold on
x7 = 638; y7 = B1(x7/0.04);
plot(x7, y7, 'rs');
hold on
x8 = 965; y8 = B1(x8/0.04);
plot(x8, y8, 'rs');
hold on
x9 = 1088; y9 = B1(x9/0.04);
plot(x9, y9, 'rs');
hold on
x10 = 1096; y10 = B1(x10/0.04);
plot(x10, y10, 'rs');
text(x10,y10,['SmallCar']);
hold on
x11 = 1175; y11 = B1(x11/0.04);
plot(x11, y11, 'rs');
text(x11,y11,['SmallCar']);
hold on
x12 = 1265; y12 = B1(x12/0.04);
plot(x12, y12, 'rs');
hold on
x13 = 1273; y13 = B1(x13/0.04);
plot(x13, y13, 'rs');
hold on
X = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13];
Y = [y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13];
plot(X,Y,'k--');
legend('Test Results','Ground Truth');