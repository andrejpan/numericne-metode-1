% naloge so rešene v octave, klic spodaj podanih funkcij bo uspešen, če bodo vse datoteke v istem direktoriju
% klic metode regulafalsi v prvem poskusu umre, vendat dela v vsakem naslednjem... nisem se poglabljal zakaj ne :)

format long

disp('Bisekcija:');
y = bisekcija(inline('2 * 199.18 * sin(x/2) - 199 * x'), 0.1, 0.2, 1/100000000);

disp('Tangentna:');
y = tangentna(inline('2 * 199.18 * sin(x/2) - 199 * x'), inline('199.18 * cos(x/2) - 199'), 0.1, 1/100000000, 10);

disp('Sekanta:');
y = sekantna(inline('2 * 199.18 * sin(x/2) - 199 * x'), 0.1, 0.2, 1/100000000, 10);

disp('Regula falsi:');
y = regulafalsi(inline('2 * 199.18 * sin(x/2) - 199 * x'), 0.1, 0.2, 1/100000000);

format short
uporcki

disp('Ovčka rabi vrvico dolžine na okroglem pašniku, če hoče popasti 0.33% pašnika:')
ovcka_krog(0.33)

disp('Ovčka rabi vrvico dolžine na kvadratnem pašniku, če hoče popasti 0.67% pašnika in je količek na 1.62m:')
ovcka_kvadrat(1.62, 0.67)

