clc ; clear all ; close all;
s=tf('s');
% from link
P = 1/(s^2 + 10*s + 20);
%den of our example
den = [1 10 20];
%state model from transfer function
[A,B,C,D]=tf2ss(1,den);
%convert it to system and apply step response.
sys = ss(A,B,C,D);
step(feedback(sys,1))
eig(sys)
eig(P)