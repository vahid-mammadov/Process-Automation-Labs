% TASK 1 

clc; clear all; close all;

s = tf('s');
k1=1;
T1=75;
k2=1.2;
c0=85000;
c1=5700;
c2=150;

% Controller and Process;
C = (k1*T1*s+k1)/(T1*s);
G = tf(k2, [c0 c1 c2 1]);
L = C*G;
Tyr = feedback(L,1);
Tyr1 = feedback(.2*L,1);
Tyr2 = feedback(2*L,1);
Tyd = -feedback(G,C);
step(Tyr , 'r' , Tyr1 , 'b--' , Tyr2 , 'g:');
