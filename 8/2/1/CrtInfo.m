teachers=struct('id',{1 2 3}, ...
    'code',{'t01','t02','t03'}, ...
    'name',{'教师1','教师2','教师3'});
students=struct('id',{1 2 3 4 5 6}, ...
    'code',{'s01','s02','s03','s04','s05','s06'}, ...
    'name',{'学生1','学生2','学生3','学生4','学生5','学生6'});
courses=struct('id',{1 2 3 4}, ...
     'code',{'c01','c02','c03','c04'}, ...
    'name',{'课程1','课程2','课程3','课程4'});

linkTC=sparse(3,4);
linkSC=sparse(5,4);
 
linkTC(1,1)=1;
linkTC(1,2)=1;
linkTC(2,3)=1;
linkTC(3,3)=1;
linkTC(3,4)=1;
linkSC(1,1)=1;
linkSC(1,2)=1;
linkSC(1,3)=1;
linkSC(2,1)=1;
linkSC(2,4)=1;
linkSC(3,2)=1;
linkSC(3,3)=1;
linkSC(3,4)=1;
linkSC(4,1)=1;
linkSC(4,2)=1;
linkSC(5,3)=1;
linkSC(5,4)=1;
linkSC(6,4)=1;

linkSC(1,3)=2;linkSC(3,3)=2;
linkSC(5,3)=3;

res=ndGetStudentsByCourse(students,linkSC,3);

res=cell2mat(res);
for i=1:length(res)
    res(i).Teacher_ID=linkSC(res(i).id,3);
end

gradeSC=linkSC;
[is,ic]=find(gradeSC~=0);

Grade_Info=round(rand(length(is),1)*10+90);
for i=1:length(is)
    gradeSC(is(i),ic(i))=Grade_Info(i);
end


R=getScoreInfo(students,courses,teachers,linkSC,gradeSC,1);
