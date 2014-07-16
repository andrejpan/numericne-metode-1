function [c,yc,k]=regula(f,a,b,delta,max1)

%Input - f is the function input as a string 'f'
%        - a and b are the left and right endpoints
%        - delta is the tolerance for the zero
%        - epsilon is the tolerance for the value of f at the zero
%        - max1 is the maximum number of iterations
%Output - c is the zero
%         - yc=f(c)
%         - err is the error estimate for c

format long
ya=feval(f,a);
yb=feval(f,b);
if ya*yb>0
    disp('Note: f(a)*f(b) >0'),
    break,
end
for k=1:max1
    
    dx=yb*(b-a)/(yb-ya);
    c=b-dx;
    ac=c-a;
    yc=feval(f,c);
    if yc==0,break;
    elseif yb*yc>0
        b=c;
        yb=yc;
    else
        a=c;
        ya=yc;
    end
    dx=min(abs(dx),ac);
    if abs(a-b)<delta,break,end    
end

c;
yc=feval(f,c);
