% TASK 3

clc; clear all; close all;
s = tf('s');

Z=.7;
Wn=1;
sys=Wn^2/(s*(s+2*Z*Wn));
sys_cl = feedback(sys,1);
stepinfo(sys_cl)

step(sys_cl);


