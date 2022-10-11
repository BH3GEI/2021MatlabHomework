function res=ndGetStudentsByCourse(students,linkSC,courseID)
    res={};
    [is,ic]=find(linkSC~=0);
    j=1;
    for i=1:length(is)
         if ic(i)==courseID
             res{j}=students(is(i));
             j=j+1;
         end
    end
end

