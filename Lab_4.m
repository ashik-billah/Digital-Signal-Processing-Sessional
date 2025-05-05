%% 4.1 Convolution Sum
clc;clear all; close all;
x = input('Enter x(n) as a vector (e.g [1 2 3 4]): ')
n_x_start = input('Enter x(n) start index: ')
h = input('Enter h(n) as a vector (e.g [1 2 3 4]): ')
n_h_start = input('Enter h(n) start index: ')
n_x = n_x_start : n_x_start + length(x) - 1
n_h = n_h_start : n_h_start + length(h) - 1
n_y_start = n_x(1) + n_h(1)
n_y_end = n_x(end) + n_h(end)
n_y = n_y_start : n_y_end
y = zeros(1, length(n_y))
for n = 1:length(n_y)
    current_n = n_y(n)
    for k = 1:length(n_x)
        h_index = current_n - n_x(k)
        h_pos = find(n_h == h_index)
        if ~isempty(h_pos)
            y(n) = y(n) + x(k) * h(h_pos)
        end
    end
end
disp('Convolution result y(n):')
disp(y)
disp('Time indices n:')
disp(n_y)

subplot(3,1,1)
stem(n_x, x, 'r', 'LineWidth', 2)
title('Original x(n)')
xlabel('Time'); ylabel('Amplitude')
grid minor

subplot(3,1,2)
stem(n_h, h, 'b', 'LineWidth', 2)
title('Impulse Signalh(n)')
xlabel('Time')
ylabel('Amplitude')
grid minor

subplot(3,1,3)
stem(n_y, y, 'g', 'LineWidth', 2)
title('Convoluted Signal y(n) = x(n) * h(n)')
xlabel('Time')
ylabel('Amplitude')
grid minor

%% 4.2 Correlation
clc; clear all; close all;
x = input('Enter sequence x(n) as a vector: ')
n_x_start = input('Enter starting index for x(n): ')
h = input('Enter sequence h(n) as a vector: ')
n_h_start = input('Enter starting index for h(n): ')
n_x = n_x_start : n_x_start + length(x) - 1
n_h = n_h_start : n_h_start + length(h) - 1
h_reversed = fliplr(h)
n_h_reversed = -fliplr(n_h)
corr_length = length(x) + length(h) - 1
n_corr_start = n_x(1) + n_h_reversed(1)
n_corr = n_corr_start : n_corr_start + corr_length - 1
corr_result = zeros(1, corr_length)
for k = 1:corr_length
    current_n = n_corr(k)
    sum_val = 0
    for m = 1:length(x)
        h_index = current_n - n_x(m);
        h_pos = find(n_h_reversed == h_index)      
        if ~isempty(h_pos)
            sum_val = sum_val + x(m) * h_reversed(h_pos)
        end
    end
    corr_result(k) = sum_val
end
disp('Correlation result:')
disp(corr_result)
disp('Time indices:')
disp(n_corr)

subplot(3,1,1)
stem(n_x, x, 'r', 'LineWidth', 2)
title('Input Sequence x(n)')
xlabel('Time index n')
ylabel('Amplitude')
grid minor

subplot(3,1,2)
stem(n_h, h, 'b', 'LineWidth', 2)
title('Time-Reversed h(-n)')
xlabel('Time index n')
ylabel('Amplitude')
grid on

subplot(3,1,3)
stem(n_corr, corr_result, 'g', 'LineWidth', 2)
title('Correlation Result')
xlabel('Time index n')
ylabel('Amplitude')
grid on