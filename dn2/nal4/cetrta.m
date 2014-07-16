a = [1 2 3 4 5 6];
b = 0:0.2:1; 
c = vander_interp(a, b);
polyout (c, 'x');

subplot(2,1,1); 
plot(a, polyval (c, a))

hold on
scatter(a, b, 10, 'red');
hold off

c1 = vander_interp([1 2 3 4 5 5], b);
polyout (c1, 'x');

subplot(2,1,2); 
plot(a, polyval (c1, a))

hold on
scatter(a, b, 10, 'red');
hold off
