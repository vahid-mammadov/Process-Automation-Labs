clc; clear all; close all;

k1=4.5;
T1=0.2;
T2=0.015;
k2=2;
T3=0.1;
T4=0.25;

s=tf('s');
C=k1*(T1*s+1)/(T2*s+1);
G=k2/(s*(T3*s+1)*(T4*s+1));
H=1;
Gr=feedback(C*G,H);

figure;
step(Gr);
title('Step Response');

figure;
bode(Gr);
grid on;
title('Bode Plot Task 3');

[mag, phase, omega] = bode(Gr);
[maxMag, idx] = max(mag(:));
resonantFreq = omega(idx);

disp(['Maximum Magnitude: ', num2str(maxMag)]);
disp(['Resonant Frequency: ', num2str(resonantFreq), ' rad/s']);

info = stepinfo(Gr);
disp(['Settling time (seconds): ', num2str(info.SettlingTime)]);
disp(['Overshoot (%): ', num2str(info.Overshoot)]);



