clc; clear all; close all;

k1=8;
k2=0.5;
T1=20; 
T2=25; 
c0=4200; 
c1=180; 

% Tf
num1=k1*k2; 
denl=conv([T1 1], [T2 1]); 
den1=conv(denl, [c0 c1 1]);
G1=tf(num1,den1); 

% Nyquist Plot
figure; 
nyquist (G1); 
title('Nyquist Plot');

% Bode Plot
figure; 
bode (G1); 
grid on; 
title('Bode Plot'); 


