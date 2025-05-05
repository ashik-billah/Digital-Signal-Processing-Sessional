%% Lab 2.1 Elementary Signals (Unit Step Signal)
clc; clear all; close all;
t=(-5:0.5:5);
t1=0:1:20;
y=t>=0;

%Continuous
subplot(2,1,1)
plot(t,y,'r','LineWidth',2)
xlabel('Time')
ylabel('Function')
title('Unit Step Continuous')
grid minor

%Discrete
subplot(2,1,2)
stem(t1,y,'b','LineWidth',2)
xlabel('Time')
ylabel('Function')
title('Unit Step Discrete')
grid minor

%% Lab 2.2 Elementary Signals (Unit Ramp Signal)
clc; clear all; close all;
t=(-5:0.5:5);
t1=(0:1:20);
y=(t>=0).*t;

%Continuous
subplot(2,1,1)
plot(t,y,'r','LineWidth',2)
xlabel('Time')
ylabel('Function')
title('Unit Ramp Continuous')
grid minor

%Discrete
subplot(2,1,2)
stem(t1,y,'b','LineWidth',2)
xlabel('Time')
ylabel('Function')
title('Unit Ramp Discrete')
grid minor

%% Lab 2.3 Elementary Signals (Unit Impulse Signal)
clc; clear all; close all;
t=(-5:0.5:5);
t1=(0:1:20);
y=(t==0);

%Continuous
subplot(2,1,1)
plot(t,y,'r','LineWidth',2)
xlabel('Time')
ylabel('Function')
title('Unit Impulse Continuous')
grid minor

%Discrete
subplot(2,1,2)
stem(t1,y,'b','LineWidth',2)
xlabel('Time')
ylabel('Function')
title('Unit Impulse Discrete')
grid minor

%% Lab 2.4 Elementary Signals (Exponential Signal)
clc; clear all; close all;
n=2
x=(-2:0.2:2);
x1=(0:1:20);
y=(n.^x);

%continuous
subplot(2,1,1)
plot(x,y,'r','LineWidth',2)
xlabel('Values of X')
ylabel('The function')
title('Exponential Signal Continuous')
grid minor

%Discrete
subplot(2,1,2)
stem(x1,y,'b','linewidth',2)
xlabel('Values of X')
ylabel('The Exponential Function')
title('Exponential Signal Discrete')
grid minor

%% Lab 2.5 Elementary Signals (Sign Wave)
clc; clear all; close all;
A=input("Give the amplitude of a signal: ");
f=input("Give the Frequency of a signal: ");
t=input("Give the Duration of the Signal: ")

fs=input("Give the sampling frequency of the signal: ");
 %continuous 
 t1=0:0.001:t;
 y=A*sin(2*pi*f*t1)
 subplot(2,1,1)
 plot(t1,y,'r','LineWidth',2)
 xlabel('Time')
 ylabel('Amplitude')
 title('Continuous Sinusoidal signal')
 grid minor

 %discrete
 td=1/fs
 t2=0:td:t
 y1=A*sin(2*pi*f*t2)
 subplot(2,1,2)
 stem(t2, y1,'b','LineWidth',2)
 xlabel('Time')
 ylabel('Amplitude')
 title('Sampled Sinusoidal Signal')
 grid minor