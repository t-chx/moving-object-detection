% max filter 500

A = load('dist.mat','dist_array');
A = dist_array;

% Convolutional Fliter len10
n = length(A)-500;
B = zeros(1,n);
for i = 251:(length(A)-250)
%     sum = 0;
%     for j = (i-5):(i+5)
%         sum = sum + A(j);
%     end
    B(i-250) = max(A((i-250):(i+250)));
end

figure
plot(1:(length(A)-500), B);
title('Frame Max Sampler 500');

t1 = (length(A)-500) * 0.04;
figure
plot(0.04:0.04:t1, B);
title('Time Max Sampler 500');
xlabel('Time');ylabel('Diff');