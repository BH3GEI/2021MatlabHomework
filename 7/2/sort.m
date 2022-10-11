function y=sort(x)
x_len=length(x);
for i=1:x_len-1
    for j=1:x_len-i
        if(x(j)>x(j+1))
            [x(j),x(j+1)]=swap(x(j),x(j+1));
        end
    end
    disp([num2str(i),'.Sort:x=',num2str(x)]);
end
y=x;
end
function [a,b]=swap(x,y)
a=y;
b=x;
end