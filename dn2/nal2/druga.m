% Podatki
w = 1 + (1 / 25) * (0*0 + 9) / 200; % c1 = 0, c2 = 0, c3 = 9
x = [   w 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
y = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';

% Generiranje matrike A
A = zeros (size (x, 1), 5);
a1 = x .* x;
a2 = x .* y;
a3 = y .* y;
A = [a1, a2, a3, x, y]

% generiranje vektorja b
b = -1 * ones (size (x, 1), 1)

% rešitev
c = A \ b

% risanje
[X, Y] = meshgrid (-0.3:.02:1.2, 0.1:.02:0.8);
Z = c(1) * X.^2 + c(2) * X .* Y + c(3) * Y.^2 + c(4) * X + c(5) * Y + 1;
contour (X, Y, Z, [0 0]);
xlabel ('x');
ylabel ('y');

hold on
scatter(x, y, 10);
hold off

% za izris slike na disk
%print ("orb", "-deps")

