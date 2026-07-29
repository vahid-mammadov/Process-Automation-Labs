clc; clear all; close all;

numerator = 1.7;
denominator = [1, 3, 2, 1.7];
sys = tf(numerator, denominator);

figure;
bode(sys);
grid on;
title('Bode Plot of the Closed-Loop System');

figure;
step(sys);
grid on;
title('Step Response of the Closed-Loop System');

[mag, phase, omega] = bode(sys);
mag = squeeze(mag);
[Mp, idx] = max(mag);
omega_r = omega(idx);
Mp_db = 20*log10(Mp);

info = stepinfo(sys);
T_s = info.SettlingTime;
P_O = info.Overshoot;

disp('Resonant Frequency (wr):');
disp(omega_r);
disp('Peak Magnitude (Mp in dB):');
disp(Mp_db);
disp('Settling Time:');
disp(T_s);
disp('Percent Overshoot:');
disp(P_O);


