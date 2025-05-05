clc; clear all; close all;

x = input('Enter the input signal x[n] as a vector: ')
N = length(x)
X_real = zeros(1, N)
X_imag = zeros(1, N)
for k = 0:N-1
    for n = 0:N-1
        angle = 2 * pi * k * n / N
        X_real(k+1) = X_real(k+1) + x(n+1) * cos(angle)
        X_imag(k+1) = X_imag(k+1) - x(n+1) * sin(angle)
    end
end
X_mag = zeros(1, N)
X_phase = zeros(1, N)
X_power = zeros(1, N)
for k = 1:N
    re = X_real(k)
    im = X_imag(k)
    X_mag(k) = sqrt(re*re + im*im)
    if re == 0 && im == 0
        X_phase(k) = 0
    else
        X_phase(k) = atan2(im, re) * (180/pi)
    end
    X_power(k) = re*re + im*im
end
disp('Index (k) | Real | Imag | Magnitude | Phase (deg) | Power')
for k = 1:N
    fprintf('%9d | %5.2f | %5.2f | %9.2f | %11.2f | %5.2f\n', k-1, X_real(k), X_imag(k), X_mag(k), X_phase(k), X_power(k))
end

m = 0:N-1
figure

subplot(3,2,1)
stem(m, X_real, 'filled', 'Color', 'b')
title('Real Part of DFT: Re{X(k)}')
xlabel('Frequency Index (k)')
ylabel('Re{X(k)}')
grid minor

subplot(3,2,2)
stem(m, X_imag, 'filled', 'Color', 'r')
title('Imaginary Part of DFT: Im{X(k)}')
xlabel('Frequency Index (k)')
ylabel('Im{X(k)}')
grid minor

subplot(3,2,3)
stem(m, X_mag, 'filled', 'Color', 'g')
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
stem(m, X_power, 'filled', 'Color', 'c')
title('Power Spectrum: |X(k)|^2')
xlabel('Frequency Index (k)')
ylabel('Power')
grid minor

subplot(3,2,6)
stem(m, x, 'filled', 'Color', 'k')
title('Original Fourier (Frequency Domain) Signal: x[n]')
xlabel('Time Index (n)')
ylabel('Amplitude')
grid minor
