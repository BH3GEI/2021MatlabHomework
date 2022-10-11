function [L,P]=CalPath(index,D,stp)
    L=cell(0);P=cell(0);             
    for i=1:length(index)
        if i==stp
            continue
        end
        temperature=100*length(index);      
        iter=10;                     
        [L(i),P(i)]=RouGen(index,D,stp,i); 
        while(temperature>0.001)     
            for j=1:iter     
                [L1,P1]=RouGen(index,D,stp,i);  
                Delta=cell2mat(L1)-cell2mat(L(i));  
                if Delta<0          
                    L(i)=L1;
                    P(i)=P1;
                elseif exp(-Delta/temperature)>rand() 
                    L(i)=L1;
                    P(i)=P1;
                end
            end        
            temperature=temperature*0.99;   
        end 
    end
    if length(L)<length(index)&&length(P)<length(index)
        L(length(L)+1)={[]};
        P(length(P)+1)={[]};
    end
end

function [L,P]=RouGen(index,D,stp,edp)
    P=[stp,randsrc(1,1,CrtTemp(index,D,stp))];          
    while(P(end)~=edp)
        if isempty(CrtTemp(index,D,P(end),P))     
            break                            
        end
        P=[P,randsrc(1,1,CrtTemp(index,D,P(end),P))];     
    end
    if P(end)~=edp
        L=Inf;                      
    else
        L=computing(P,D);           
    end
    L={L};P={P};                       
end

function T=CrtTemp(index,D,stp,Ban_list)
    if ~exist('Ban_list','var') 
        Ban_list=[];
    end                       
    T=[];                   
    for i=1:length(index)
        if D(i,stp)
            T=[T,i];
        end
    end
    T=setdiff(T,Ban_list);     
end

function L=computing(route,D)
    L=0;
    for i=1:length(route)-1
        L=L+D(route(i),route(i+1));
    end
end