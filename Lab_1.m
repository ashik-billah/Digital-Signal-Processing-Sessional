%% Lab 1.1 (example 1.1 exponential)
clc; clear all; close all;
x=0:0.2:2;
x1=0:1:10;
%continuous
y1=2*exp(-2*x)
subplot(2,1,1)
plot(x,y1, 'r', LineWidth=2)
xlabel('Value of variable')
ylabel('Value of equation')
title("Continuous Exponential Equation")
grid minor

%discrete
subplot(2,1,2)
stem(x1, y1, 'b', LineWidth=2)
xlabel('Sampling Point')
ylabel('Equation According to sampling point')
title("Discrete Exponential Equation")
grid minor

%% Lab 1.2 (example 1.2 sinusoidal)
clc; clear all; close all;
x=0:0.2:2;
x1=0:1:10;
y=sin(7*x)+sin(10*x);

%continuous
subplot(2,1,1)
plot(x,y,'r','LineWidth',2)
xlabel('Values of X')
ylabel('Values of Equation')
title('Continuous Sinusoidal Equation')
grid minor

%discrete
subplot(2,1,2)
stem(x1,y,'b','LineWidth',2)
xlabel('Sampling Points')
ylabel('Equation According to sampling point')
title('Discrete Sinusoidal Equation')
grid minor

%% Lab 1.3 (practice 1.1 exponential equation)
clc; clear all; close all;
x=-1:0.2:1;
x1=0:1:10;
y=exp(-(x.^2)/2);

%Continuous
subplot(2,1,1)
plot(x,y,'r','LineWidth',2)
xlabel('Values of X')
ylabel('Values of Equation')
title('Practice Problem 1.1 Continuous')
grid minor

%Discrete
subplot(2,1,2)
stem(x1,y,'b','LineWidth',2)
xlabel('Sampling Points')
ylabel('Values of Equation')
title('Practice Problem 1.1 Discrete')
grid minor
