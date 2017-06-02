A = dist_array;

% Convolutional Filter len10
n = length(A)-20;
B2 = zeros(1,n);
for i = 11:(length(A)-10)
    sum = 0;
    for j = (i-10):(i+10)
        sum = sum + A(j);
    end
    B2(i-10) = mean(sum);
end

figure
plot(1:(length(A)-20), B2);
title('Frame Filter20');

t2 = (length(A)-20) * 0.04;
figure
plot(0.04:0.04:t2, B2);
title('Time Filter20');
xlabel('Time');ylabel('Diff');

