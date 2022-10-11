function traverseCellTree(data,i)
    if ~exist('i','var')
        i=1;
    end                    
        
    [m,~]=size(data);
    for k=1:m
        if i==1
            disp(cell2mat(data(k,1)))
        else
            t=[];
            for l=1:i-1
                t=[t,'    '];       
            end
            disp([t,cell2mat(data(k,1))])
        end
        if cell2mat(data(k,2))
            traverseCellTree(eval(cell2mat(data(k,2))),i+1)
        end
    end
end