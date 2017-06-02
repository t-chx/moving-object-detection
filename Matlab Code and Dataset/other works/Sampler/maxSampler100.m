% max filter 100

A = load('dist.mat','dist_array');
A = dist_array;

% Convolutional Fliter len10
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
title('Frame Max Sampler 500');

t1 = (length(A)-100) * 0.04;
figure
plot(0.04:0.04:t1, B);
title('Time Max Sampler 100');
xlabel('Time');ylabel('Diff');

