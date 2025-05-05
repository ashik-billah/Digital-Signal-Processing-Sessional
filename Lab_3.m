%% Lab 3.1 (Time Shifting)
clc; clear all; close all;
x = [ 0  0  0 2 1 2 1 0 0 0];
n= -3:1:6;
k= input("Enter the shiftig value: ")
N=length(x)
x_shifted=zeros(1,N)
if k>0
   x_shifted(k+1:N)=x(1:N-k)
elseif k<0
    x_shifted(1:N+k)=x(-k+1:N)
else
    x_shifted=x
end
n_shifted=n

subplot(2,1,1)
stem(n,x,'r',LineWidth=2)
title('Original Signal x(n)')
xlabel('Time Index (n)')
ylabel('Amplitude')
grid minor

subplot(2,1,2)
stem(n_shifted,x_shifted,'b',LineWidth=2)
title('Shifted Signal x(n-k)')
xlabel('Time Index (n)')
ylabel('Amplitude')
grid minor

%% Lab 3.2 (Time Reversal)
clc; clear all; close all;
x = [ 0 0 0 0  0  0 2 1 2 1 0 0 0];
n= -6:1:6;
N=length(x)
x_reversed=zeros(1,N)
n_reversed=n
for i=1:N
    val_n=-n(i); %this will give the x(-n)
    indx=find(n==val_n)
    x_reversed(i)=x(indx)
end

subplot(2,1,1)
stem(n,x,'r',LineWidth=2)
title("Original Signal x(n)")
xlabel("Time Index (n)")
ylabel("Amplitude")
grid minor

subplot(2,1,2)
stem(n_reversed,x_reversed,'b',LineWidth=2)
title("Reversed Signal x(-n)")
xlabel("Time Index (n)")
ylabel("Amplitude")
grid minor

%% Lab 3.3 (Time Scaling)
clc; clear all; close all;
x = [ 0  0  0  0  1  2  3  4 5 4 3 2 1 0 0 0 0]
n = [-8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8]
a=length(x)
x_scaled=zeros(1,a)
b=input("Enter the scaling value (lambda) : ")
num2str(b)
if b>1
    for i=1:a
        if x(i)~=0
            val=b*n(i)
            indx=find(n==val)
            x_scaled(i)=x(indx)
        end
    end
elseif b<1
        for i=1:2:a
                val=b*n(i)
                indx=find(n==val)
                x_scaled(i)=x(indx)
        end
else
    x_scaled=x
end
n_scaled=n

subplot(2,1,1)
stem(n,x,'r',LineWidth=2)
title("Original Signal x(n)")
xlabel('Time Index (n)')
ylabel('Amplitude')
grid minor

subplot(2,1,2)
stem(n_scaled,x_scaled,'b',LineWidth=2)
if b>1
    title("Scaled Signal x(n*labmda)")
elseif b<1
        title("Scaled Signal x(n/lambda)")
else
    title("Scaled Signal x(n)")
end
xlabel('Time Index (n)')
ylabel('Amplitude')
grid minor
