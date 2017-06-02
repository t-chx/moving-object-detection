% avg 20

A = load('dist.mat','dist_array');
A = dist_array;

% len10
n1 = floor(length(A)/20);
Bavg = zeros(1,n1);
for i = 1:n1
    sum = 0;
    for j = (20*i-19):(20*i)
        sum = sum + A(j);
    end
    Bavg(i) = mean(sum);
end

% figure
% plot(1:n1, Bavg);
% title('Frame Avg10');
% xlabel('No.Frames');ylabel('Diff');

t3 = n1 * 0.04 * 20;
figure
plot(0.4:0.4:t3, Bavg);
title('Time Avg 20');
xlabel('Time');ylabel('Diff');