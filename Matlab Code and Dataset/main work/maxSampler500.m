% max sampler 500

% Landscape
A = load('dist.mat','dist_array');
A = A.dist_array;

n = length(A)-500;
B = zeros(1,n);
for i = 251:(length(A)-250)
%     sum = 0;
%     for j = (i-5):(i+5)
%         sum = sum + A(j);
%     end
    B(i-250) = max(A((i-250):(i+250)));
end
save max500 B;

figure
plot(1:(length(A)-500), B);
title('Landscape Frame Max Sampler 500');

t1 = (length(A)-500) * 0.04;
figure
plot(0.04:0.04:t1, B);
title('Horizontal Max Sampler 500');
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
xx15 = 2682; yy15 = B(floor(xx15/0.04));
plot(xx15, yy15, 'rs');
hold on
XX = [xx1,xx2,xx3,xx4,xx5,xx6,xx7,xx8,xx9,xx10,xx11,xx12,xx13,xx14,xx15];
YY = [yy1,yy2,yy3,yy4,yy5,yy6,yy7,yy8,yy9,yy10,yy11,yy12,yy13,yy14,yy15];
plot(XX,YY,'k--');
legend('Test Results','Ground Truth');
% hold on 
% plot([0 (t1+200)],[yy11 yy11],'m');
% Threshold


% Portrait
A1 = load('dist1.mat','dist_array1');
A1 = A1.dist_array1;

n1 = length(A1)-500;
B1 = zeros(1,n1);
for i = 251:(length(A1)-250)
%     sum = 0;
%     for j = (i-5):(i+5)
%         sum = sum + A(j);
%     end
    B1(i-250) = max(A1((i-250):(i+250)));
end

figure
plot(1:(length(A1)-500), B1);
title('Portrait Frame Max Sampler 500');

t2 = (length(A1)-500) * 0.04;
% t2 = 1350;
figure
plot(0.04:0.04:t2, B1);
title('Vertical Max Sampler 500');
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
x5 = 513; y5 = B1(floor(x5/0.04));
plot(x5, y5, 'rs');
text(x5,y5,['SmallCar']);
hold on
x6 = 583; y6 = B1(floor(x6/0.04));
plot(x6, y6, 'rs');
hold on
x7 = 638; y7 = B1(floor(x7/0.04));
plot(x7, y7, 'rs');
hold on
x8 = 965; y8 = B1(floor(x8/0.04));
plot(x8, y8, 'rs');
hold on
x9 = 1088; y9 = B1(floor(x9/0.04));
plot(x9, y9, 'rs');
hold on
x10 = 1096; y10 = B1(floor(x10/0.04));
plot(x10, y10, 'rs');
text(x10,y10,['SmallCar']);
hold on
x11 = 1175; y11 = B1(floor(x11/0.04));
plot(x11, y11, 'rs');
text(x11,y11,['SmallCar']);
hold on
x12 = 1265; y12 = B1(floor(x12/0.04));
plot(x12, y12, 'rs');
hold on
x13 = 1273; y13 = B1(floor(x13/0.04));
plot(x13, y13, 'rs');
hold on
X = [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13];
Y = [y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13];
plot(X,Y,'k--');
legend('Test Results','Ground Truth');
% hold on 
% plot([0 (t2+100)],[y3 y3],'m');
% Threshold