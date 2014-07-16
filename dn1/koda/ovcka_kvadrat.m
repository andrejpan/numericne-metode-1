function y = ovcka_kvadrat(x, s)
    format long
    
    % a velikost kvadrata
    a = 10;
    % x količek na stranici med [0,a]:

    % s = procenti pašnika, ki ga želimo, da ovca popaše    
    Pl = s .* 100;

    % kvadrat je simetričen, zato je zadosti, da gledamo, da je količek zapičen med [0, a/2]
    if (x > a ./ 2)
        x = a - x;
    endif

    % pogledam dva robna pogoja
    if (s == 1)
        y = sqrt((10 .- x) .* (10 .- x) .+ a .* a);
        break
    endif

    if (s <= 0)
        y = 0;
        % disp(sprintf('Ovčka ni lančna, sploh!'));
        break
    endif
        
    Robna1 = pi .* x .* x ./ 2 ;
    if (Pl < Robna1 )
        func1 = @(r) pi .* r .* r ./ 2 - Pl;
        disp(sprintf('Rešitev se generira po prvem načinu'));
        y = fzero(func1 , [0, 5]);
        break
    endif

    alfa2 = acos(x ./ (a .- x));
    Robna2 = (pi .- alfa2) .* ( a .- x) .* ( a .- x) ./ 2 .+ x .* (a .- x) .* sin(alfa2) ./ 2;
    
    if (Pl >= Robna1 && Pl < Robna2)    
        % wolfram koda: (pi - acos(3/r))*r^2/2 + 3*r*sin(acos(3/r))/2 - 15 
        func2 = @(r) ((pi .- acos(x ./ r)) .* r .* r ./ 2) .+ (x .* r .* sin(acos(x ./ r)) ./ 2) - Pl;
        if (x == 0 )
            func2 = @(r) pi .* r .* r ./ 4 - Pl;
        endif
        %disp(sprintf('Rešitev se generira po drugem načinu'));
        y = fzero(func2 , [x, 10]) ;
        break
    endif

    alfa3 = acos(x ./ a);
    beta3 = acos((a .- x) ./ a);
    Robna3 = (pi .- alfa3 .- beta3) .* a .* a ./ 2 .+ (x .* a .* sin(alfa3) .+ (a .- x) .* a .* sin(beta3)) ./ 2;
    
    if (Pl >= Robna2 && Pl < Robna3)
        func3 = @(r) (pi .- alfa3 .- beta3) .* r .* r ./ 2 .+ x .* r .* sin(alfa3) ./ 2 .+ (a .- x) .* r .* sin (beta3) ./ 2 .- Pl;
        %disp(sprintf('Rešitev se generira po tretjem načinu'));
        y = fzero(func3, [5, 10]);
        break
    endif

    r4 = sqrt(a .* a + x .* x);
    alfa4 = acos(x ./ r4);
    beta4 =  pi ./ 2 .- acos(a ./ r4);
    gama4 = acos((a .- x) ./ r4);
    delta4 = beta4;
    Robna4 = a .* x .+ a .* x ./ 2 .+ (delta4 .- gama4) .* r4 .* r4 ./ 2 + ((a .- x) .* r4 * sin(gama4)) ./ 2 ;

    if (Pl >= Robna3 && Pl < Robna4)
        sum1 = @(r) x .* r .* sin(acos(x ./ r)) ./ 2;
        sum2 = @(r) a .* r .* sin(acos(a ./ r));
        sum3 = @(r) (a .- x) .* r .* sin(acos((a .- x) ./ r)) ./ 2;
        sum4 = @(r) r .* r ./ 2 .* (pi .- 2 .* acos(a ./ r) .- acos(x ./ r) .- acos((a .- x) ./ r));
        func4 = @(r) sum1(r) + sum2(r) + sum3(r) + sum4(r) - Pl;
        %disp(sprintf('Rešitev se generira po četrtem načinu'));
        y = fzero(func4, [10, r4]);
        break
    endif

    %disp(sprintf('Rešitev se generira po petem načinu'));
    delta = @(r) acos(a ./ r);
    alfa = @(r) acos((a .- x) ./ r);
    sum1 = @(r) a .* x;
    sum2 = @(r) a .* r .* sin(delta(r)) ./ 2;
    sum3 = @(r) (a .- x) .* r .* sin(alfa(r)) ./ 2;
    sum4 = @(r) r .* r .* (pi ./ 2 .- alfa(r) .- delta(r)) ./ 2;
    func5 = @(r) sum1(r) + sum2(r) + sum3(r) + sum4(r) - Pl;

    y = fzero(func5, [r4, sqrt((10 .- x) .* (10 .- x) .+ a .* a)]);
end
