% TASK 4

clc; clear all; close all;
s = tf('s');

k1 = 2.5;
T1 = 0.25;
T2 = 0.125;
k2 = 0.4;
c0 = 0.02;
c1 = 0.3;

C = (k1*T1*s+k1)/(T2*s+1);
G = tf(k2, [c0 c1 1 0]);
L = C*G;
Tyr = feedback(L,1);
Tyr1 = feedback(2*L,1);
Tyr2 = feedback(4*L,1);
Tyr3 = feedback(8*L,1);
Tyd = -feedback(G*C,1);
step(Tyr);
figure;
step(Tyr1);
figure;
step(Tyr2);
figure;
step(Tyr3);


