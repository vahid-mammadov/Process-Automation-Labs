clc; clear all; close all;

k1=1500;
k2=0.002; 
k3=15; 
T1=0.01; 
T2=0.2; 

num2=k1*k2; 
den2=conv([T1 1],[T2 1]); 
den2=conv(den2,[1 0]); 

G2=tf(num2, den2); 

figure; 
nyquist(G2); 
title('Nyquist Plot'); 

figure; 
bode(G2);
grid on; 
title('Bode Plot for open-loop system'); 

s=tf('s'); 
C=k1/(T1*s+1); 
H=1; 
G=k2/(s*(T2*s+1)); 
Gd=-k3; 

G2_closed=feedback(C*G,H); 
GD=-k3*feedback(G,C); 
GN=feedback(-1*C*G,1);

figure; 
bode(G2_closed); 
grid on; 
title('Bode Plot Y(s)/R(s)'); 

figure; 
bode(GD); 
grid on;
title('Bode Plot Y(s)/D(s)');

figure;
bode(GN); 
grid on; 
title('Bode Plot Y(s)/N(s)'); 


