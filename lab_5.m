%% 5.1 Composite Signal
clc; clear all; close all;
fs = input('Enter sampling frequency (Hz): ')
L = input('Enter number of samples: ')
f1 = input('Enter frequency of Signal 1 (Hz): ')
f2 = input('Enter frequency of Signal 2 (Hz): ')
f3 = input('Enter frequency of Signal 3 (Hz): ')
A = input('Enter amplitude: ')
t = (0:L-1)/fs

s1 = A * sin(2*pi*f1*t)
s2 = A * sin(2*pi*f2*t)
s3 = A * sin(2*pi*f3*t)
s = s1 + s2 + s3

figure
subplot(4,1,1)
plot(t, s1, 'b','LineWidth',2)
title(['Signal 1: ', num2str(f1), ' Hz'])
xlabel('Time (s)') 
ylabel('Amplitude')

subplot(4,1,2)
plot(t, s2, 'g','LineWidth',2)
title(['Signal 2: ', num2str(f2), ' Hz'])
xlabel('Time (s)')
ylabel('Amplitude')

subplot(4,1,3)
plot(t, s3, 'r','LineWidth',2)
title(['Signal 3: ', num2str(f3), ' Hz'])
xlabel('Time (s)') 
ylabel('Amplitude')

subplot(4,1,4)
plot(t, s, 'm', 'LineWidth',2)
title(['Composite Signal (', num2str(f1), ' + ', num2str(f2), ' + ', num2str(f3), ') Hz'])
xlabel('Time (s)') 
ylabel('Amplitude')

%% 5.2 FFT and IFFT of the signal
clc; close all;
S = fft(s)
f = (0:L-1)*(fs/L)
si = ifft(S)

figure;
subplot(2,1,1)
stem(f(1:L/2), abs(S(1:L/2))/L, 'g', 'LineWidth', 2)
title('Frequency Spectrum (DFT)')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
grid minor

subplot(2,1,2)
plot(t, real(si), 'r', 'LineWidth', 2)
title('Reconstructed Signal')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor

%% 5.3 real part, imaginary part, magnitude, and phase angle of a signal.

clc; close all;

x = S  
N = length(x)
m = 0:N-1

X_real = zeros(1, N)
X_imag = zeros(1, N)
X_mag  = zeros(1, N)
X_phase = zeros(1, N)
X_power = zeros(1, N)

for k = 1:N
     re = (x(k) + conj(x(k))) / 2          
    
   im = (x(k) - conj(x(k))) / (2i)

    X_real(k) = re
    X_imag(k) = im
    X_mag(k) = sqrt(re^2 + im^2)

    if re == 0 && im == 0
        X_phase(k) = 0
    else
        X_phase(k) = atan2(im, re) * (180/pi)
    end

    X_power(k) = re^2 + im^2
end

disp('Index (k) | Real | Imag | Magnitude | Phase (deg) | Power')
for k = 1:N
    fprintf('%9d | %6.2f | %6.2f | %9.2f | %11.2f | %7.2f\n', ...
        k-1, X_real(k), X_imag(k), X_mag(k), X_phase(k), X_power(k))
end

m = 0:N-1
figure

subplot(3,2,1)
stem(m, X_real, 'filled', 'Color', 'b','LineWidth',2)
title('Real Part of DFT: Re{X(k)}')
xlabel('Frequency Index (k)')
ylabel('Re{X(k)}')
grid minor

subplot(3,2,2)
stem(m, X_imag, 'filled', 'Color', 'r','LineWidth',2)
title('Imaginary Part of DFT: Im{X(k)}')
xlabel('Frequency Index (k)')
ylabel('Im{X(k)}')
grid minor

subplot(3,2,3)
stem(m, X_mag, 'filled', 'Color', 'g', 'LineWidth',2)
title('Magnitude Spectrum: |X(k)|')
xlabel('Frequency Index (k)')
ylabel('|X(k)|')
grid minor

subplot(3,2,4)
stem(m, X_phase, 'filled', 'Color', 'm')
title('Phase Spectrum: ∠X(k) in Degrees')
xlabel('Frequency Index (k)')
ylabel('Angle (degrees)')
grid minor

subplot(3,2,5)
stem(m, X_power, 'filled', 'Color', 'c', 'LineWidth',2)
title('Power Spectrum: |X(k)|^2')
xlabel('Frequency Index (k)')
ylabel('Power')
grid minor

subplot(3,2,6)
stem(f(1:L/2), abs(S(1:L/2))/L, 'Color','y', 'LineWidth',2)  % Plot s (original signal), not x (FFT)
title('Original Time-Domain Signal: s[n]')
xlabel('Time Index (n)')
ylabel('Amplitude')
grid minor