tic             %记录运行时间

index={'老年公寓','邮局','区政府','学校','幼儿园','卫生院';
    1,2,3,4,5,6};
D=zeros(length(index));
D(1,2)=1000;
D(2,3)=900;
D(2,4)=600;
D(4,5)=1200;
D(3,5)=800;
D(3,6)=850;
D(5,6)=1000;
D=sparse(D);
for i=1:size(D)
    for j=1:size(D)
        if D(i,j)==0&&D(j,i)~=0
            D(i,j)=D(j,i);
        end
    end
end

L=cell(0);P=cell(0);        %将L和P初始化为单位数组
for i=1:length(index)
    [L(i,:),P(i,:)]=CalPath(index,D,i);
end

L_out=cell(length(index)+1);
for i=2:length(index)+1
    L_out(1,i)=index(1,i-1);
    L_out(i,1)=index(1,i-1);
end
P_out=L_out;
L_out(2:length(index)+1,2:length(index)+1)=L;

for i=1:length(index)
    for j=1:length(index)
        t=cell2mat(P(i,j));
        if ~isempty(t)
            for k=1:length(t)
                if k==1
                    P_out(i+1,j+1)=index(1,t(k));
                else
                    P_out(i+1,j+1)={strjoin([P_out(i+1,j+1),'->',index(1,t(k))])};
                end
            end
        end
    end
end

fprintf('\t各地点之间的最短距离为：\n')
disp(L_out)
fprintf('\t行进的路线为：\n')
disp(P_out)

toc             %输出运行时间