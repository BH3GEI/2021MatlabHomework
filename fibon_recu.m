function F = fibon_recu(n)
B(1)=1;
B(2)=1;
if(n>2)
    for i=3:n
        B(i)=fibon_recu(i-1)+B(i-2);
    end
end
F=B(end);

end
