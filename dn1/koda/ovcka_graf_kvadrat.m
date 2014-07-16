x = 0:0.1:10;
y = 0:1:100;

% i - kje palica stoji
for i = 1:100   
    y(i+1) = ovcka_kvadrat(i ./ 10, 0.36);
end

plot(x,y)
axis([0.1 10]); 
xlabel("kolicek");
ylabel("velikost vrvice");
