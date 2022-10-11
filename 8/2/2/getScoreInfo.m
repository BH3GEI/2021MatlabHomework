function res=getScoreInfo(students,courses,teachers,linkSC,gradeSC,studentID)
    [is,ic]=find(linkSC~=0);        
    k=1;                          
    for i=1:length(is)              
        if is(i)==studentID
            for j=1:length(courses)    
                 if ic(i)==j            
                     res(k)=struct( ...
                        'Stu_Name',students(is(i)).name,...
                        'Cour_Name',courses(j).name,...
                        'Tea_Name',teachers(linkSC(is(i),j)).name,...
                        'Grade',gradeSC(is(i),j)...
                        );
                     k=k+1;             
                 end
            end
        end
    end
    Current_Grade=[];               
    for i=1:length(res)
        Current_Grade=[Current_Grade;res(i).Grade];
    end
    for i=1:length(res)
        res(i).Lowest_Grade=min(Current_Grade);
        res(i).Highest_Grade=max(Current_Grade);
        res(i).Average_Grade=mean(Current_Grade);
    end
end