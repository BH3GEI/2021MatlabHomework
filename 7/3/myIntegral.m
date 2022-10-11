function f=myIntegral(handle,x0,xt)    
    step=1e-6;    
    x=x0:step:xt;       
    fac1=handle(x);
    fac2=handle(x+step);         
    if x0<xt
        temp=step.*(fac1+fac2)./2;
    else
        temp=-step.*(fac1+fac2)./2;
    end
    f=sum(temp(1:end-1));
end
