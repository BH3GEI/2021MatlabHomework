function F = fibon_loop(n)
a=1;
b=1;
c=0;
while n>2
    c=a+b;
    a=b;
    b=c;
    n=n-1;
end
F = c;