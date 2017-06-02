% max 10

A = load('dist.mat','dist_array');
A = dist_array;

% len10
n = floor(length(A)/10);
Bmax = zeros(1,n);
for i = 1:n
    sum = 0;
    for j = (10*i-9):(10*i)
        sum = sum + A(j);
    end
    Bmax(i) = max(sum);
end

figure
plot(1:n, Bmax);
title('Frame Max10');
xlabel('No.Frames');ylabel('Diff');

t3 = n * 0.04 * 10;
figure
plot(0.4:0.4:t3, Bmax);
title('Time Max10');
xlabel('Time');ylabel('Diff');