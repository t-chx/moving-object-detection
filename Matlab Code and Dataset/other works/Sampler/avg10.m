% avg 10

A = load('dist.mat','dist_array');
A = dist_array;

% len10
n = floor(length(A)/10);
Bavg = zeros(1,n);
for i = 1:n
    sum = 0;
    for j = (10*i-9):(10*i)
        sum = sum + A(j);
    end
    Bavg(i) = mean(sum);
end

figure
plot(1:n, Bavg);
title('Frame Avg10');
xlabel('No.Frames');ylabel('Diff');

t3 = n * 0.04 * 10;
figure
plot(0.4:0.4:t3, Bavg);
title('Time Avg10');
xlabel('Time');ylabel('Diff');
