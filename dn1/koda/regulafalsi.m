function y = regula_falsi(f, a, b, delta)

if nargin<4, delta=eps; end

fa=f(a);
fb=f(b);
korak=0;
if sign(fa)==sign(fb) 
   disp('Nepravilen interval')
   return
end

while((abs(a-b) > delta))
    korak = korak+1;
    
    razmerje = abs(f(a) / f(b));
    if razmerje > 1
        razmerje = abs(f(b)/f(a));
    end
    c = a + razmerje * (b - a);
    disp(sprintf('%3d: %15.15f',[korak,c]));

    fc=f(c);
    if sign(fa)==sign(fc) 
      a=c;
      fa=fc;
    else
      b=c;
      fb=fc;
    end
end
y = c;
