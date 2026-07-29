% TASK 2

clc; clear all; close all;

s = tf('s');
k1=5;
T1=0.06;
c0=0.00005;
c1=0.01;
J=0.1;

% Controller and Process;
C1 = (k1*T1*s+k1)/(T1*s);
C2 = tf(1, [c0 c1 1]);
G = 1/(J*s);
L = C1*C2*G;
Tyr = feedback(L,1);
Tyd = -feedback(G,C1*C2);
step(Tyr , 'r' , Tyd , 'b--');

% Part - B
k3=5;
L1=k3*C2*G;
Tyr1=feedback(L1,1);
figure;
step(Tyr1);
