// DSP Exercise 1.2: Sampling and Quantization
// Analog Signal: x_a(t) = 3*sin(100*pi*t)

clear; clc; clf;

// --- 1. Analog Signal Parameters ---
A = 3;                       // Amplitude
Omega = 100 * %pi;           // Angular frequency (rad/s)
f_analog = Omega / (2 * %pi); // Analog frequency (Hz)
T_analog = 1 / f_analog;      // Analog period (s)
t_start = 0;
t_stop = 5 * T_analog;
t = linspace(t_start, t_stop, 1000); 
xa = A * sin(Omega * t);

// Sampling with Fs = 300 samples/s
Fs = 300;                    
Ts = 1 / Fs;                 
n_limit = floor(5 * T_analog / Ts); 
n = 0:n_limit; 
xn = A * sin(Omega * n * Ts); 

//Determine Periodicity and Digital Period
f_digital = f_analog / Fs;
[num, den] = rat(f_digital);
N = den; 

printf("--- ANALYSIS RESULTS ---\n");
printf("Digital Frequency (f): %f\n", f_digital);

if (f_digital == num/den) then
    printf("Periodicity: x(n) is PERIODIC\n");
    printf("Fundamental Period (N): %d samples\n", N);
else
    printf("Periodicity: x(n) is NON-PERIODIC\n");
end 

//TRUNCATED METHOD IS USED
delta = 0.1;
xq = delta * floor(xn / delta);

//Draw all graph in one(Single Window using Subplots)

// Analog Signal
subplot(3, 1, 1);
plot(t, xa, 'b');
xtitle("Analog Signal x_a(t)", "Time (s)", "Amplitude");
xgrid();

// Discrete-time Signal
subplot(3, 1, 2);
plot2d3(n, xn); 
replot([0, -3.5, n($), 3.5]); 
xtitle("Discrete-time Signal x(n) [Fs=300Hz, N=6]", "n (samples)", "Amplitude");
xgrid();

//Quantized Signal
subplot(3, 1, 3);
plot2d3(n, xq);
replot([0, -3.5, n($), 3.5]);
xtitle("Quantized Signal x_q(n) [Delta=0.1, Truncated]", "n (samples)", "Amplitude");
xgrid();
