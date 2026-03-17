// Ex 1.2 LAB1
//xa(t) = 3*sin(100*pi*t)
//Fs = 300 samples/s
//Delta = 0.1


clc; clear; clf;

//draw xat in 5 period

f0 = 50;
T0 = 1/f0;//period = 0.02 s
t = 0 : 0.0001 : 5*T0;
xa = 3 * sin(100 * %pi * t);
Fs = 300;
Ts = 1/Fs;

omega = 2 * %pi * f0 / Fs;
disp(" DISCRETE SIGNAL ANALYSIS x(n) ");
disp("Angular frequency: omega = " + string(omega/(%pi)) + " * pi (rad/sample)");

ratio = f0 / Fs;   // = 1/6
N_period = Fs / f0; // N = 6
disp("f0/Fs = " + string(ratio) + " = " + string(1) + "/" + string(N_period));
disp("=> x(n) is a periodic signal with period N = " + string(N_period));
disp("Digital Frequency: f = " + string(ratio) + " (cycles/sample)");

//draw 5 discrete period: n from 0 to 5*N - 1
n = 0 : 5*N_period - 1;
xn = 3 * sin(omega * n);

Delta = 0.1;
//TRUNCATED: xq = floor(x/Delta) * Delta
xq = floor(xn / Delta) * Delta;


disp("Quantized");
disp("Quantization Step Size = " + string(Delta));
disp("Method: Truncated");


// 1 CHO TẤT CẢ (subplot 3x1)
figure(1);
clf;

// --- Subplot 1: x_a(t) ---
subplot(3, 1, 1);
plot(t * 1000, xa, 'b-');   // t đổi sang ms
xgrid();
xlabel("t (ms)");
ylabel("x_a(t)");
title("Analog signal: x_a(t) = 3sin(100πt)  [5 periods]");
a = gca();
a.font_size = 2;

// --- Subplot 2: x(n) ---
subplot(3, 1, 2);
// Vẽ stem 
for i = 1:length(n)
    plot([n(i) n(i)], [0 xn(i)], 'r-');
end
plot(n, xn, 'ro', 'MarkerSize', 4);
plot(n, zeros(1, length(n)), 'k-');
xgrid();
xlabel("n (samples)");
ylabel("x(n)");
title("Sampled signal: x(n) = 3sin(π/3 · n)  [5 periods, N=6]");
a = gca();
a.font_size = 2;

// --- Subplot 3: x_q(n) ---
subplot(3, 1, 3);
for i = 1:length(n)
    plot([n(i) n(i)], [0 xq(i)], 'g-');
end
plot(n, xq, 'gs', 'MarkerSize', 4);
plot(n, zeros(1, length(n)), 'k-');
xgrid();
xlabel("n (samples)");
ylabel("x_q(n)");
title("Quantized signal: x_q(n), Δ=0.1, Truncated  [5 periods]");
a = gca();
a.font_size = 2;

;
