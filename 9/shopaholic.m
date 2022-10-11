function [M1,P1]=shopaholic(a)

    global m Position
    m=[];
    Position=[];
    
    D={'洗发水',76
        '色拉油',95
        '大米',190
        '羊肉卷',209
        '面膜',228};

    A=cell2mat(D(:,2));
    [M,P]=recursion(A,a,1);
    index=find(M==min(M));
    M1=min(M);
    P1=P(index,:);
end
    

function [m,Position]=recursion(arr,a,i,p)     
    global m Position
    if i>length(arr)
        m=[m;a];                    
        Position=[Position;p];      
        return
    end                         
   if arr(i)<=a               
        for j=1:floor(a/arr(i))
            p(i)=j;
            recursion(arr,a-j*arr(i),i+1,p);
        end
    else                        
        p(i)=0;
        recursion(arr,a,i+1,p);
    end
end
