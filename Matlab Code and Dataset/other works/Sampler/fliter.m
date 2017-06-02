A = load('dist.mat','dist_array');
A = dist_array;

% Convolutional Fliter len10
n = length(A)-10;
B = zeros(1,n);
for i = 6:(length(A)-5)
    sum = 0;
    for j = (i-5):(i+5)
        sum = sum + A(j);
    end
    B(i-5) = mean(sum);
end

figure
plot(1:(length(A)-10), B);
title('Frame Filter10');

t1 = (length(A)-10) * 0.04;
figure
plot(0.04:0.04:t1, B);
title('Time Filter10');
