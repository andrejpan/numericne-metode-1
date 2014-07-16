% Vhodni podatki
C = 1 + (0*0 + 9*9) / 200;
f = @ (x) cos (2 + C .* x);
x = 0:0.2:1;

% Evaluiraj funkcijo v šestih vrednostih
y = f (x);

% Interpoliraj polinom pete stopnje
p = polyfit (x, y, 5);

%za lepši izpis polinoma
polyout (p, 'x')

% Evaluiraj funkcijo in polinom v dveh točkah
s = [0.25, 0.95];
eo = f (s)
ep = polyval (p, s)

% Relativna napaka
r = abs ((ep - eo) ./ eo)

% Izris funkcije in polinoma
%x = -2.5:.02:2.5;
%plot (x, f (x), x, polyval (p, x));
