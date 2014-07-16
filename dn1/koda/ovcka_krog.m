function y = ovcka_krog(s)
    format long
    if (s <= 0)
        y = 0;
        % disp('Ovčka ni lančna, sploh!');
    elseif (s >= 1)
        % disp('Ovčka ne rabi vrvice daljše od 20m!');
        y = 20;
    else 
        g = inline('r .* r .* acos((r) ./ 20) .+ 100 .* acos((200 .- r .* r) ./ 200) .- (1 ./ 2 .* r .* (400 - r .* r) .^ (1 ./ 2)) .- s .* 100 .* pi');
        y = fzero(@(r) g(r, s), [0,20]);
    endif
end
