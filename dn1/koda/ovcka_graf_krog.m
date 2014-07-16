x = 0:1:100;
y = 0:1:100;

for i = 1:100
    y(i+1) = ovcka_krog(i ./ 100);
end

plot(x,y)
axis([0 100]); 
xlabel("procenti popasenega pasnika");
ylabel("velikost vrvice");
