// EXERCISE 1.1 LAB1

// Create a vector (x1+1, x2+1, x3+1, x4+1)
x = 1:4;
y = x + 1;
disp(y);

// Create a vector (x1*y1, x2*y2, x3*y3, x4*y4)
y = 5:8;
z = x .* y;
disp(z);

// Create a vector (sin(x1), ..., sin(x10))
x = linspace(0, %pi, 10);
c = sin(x);
disp(c);
