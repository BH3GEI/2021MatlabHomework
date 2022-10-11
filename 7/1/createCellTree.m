function f=createCellTree()    
    d223(1).name='数学学院';            
    d223(2).name='物理学院';            
    d223(3).name='化学学院';            
    d223(4).name='生命科学学院';     
    d223(1).subDept=[];
    
    d32(1).name='国家重点实验室';       
    d32(2).name='教育部重点实验室';   
    d32(1).subDept=[];
    
    d22(1).name='人文学部';                 
    d22(2).name='理学部';                    
    d22(2).subDept=d223;
    
    d12(1).name='组织部';                     
    d12(2).name='教务处'; 
    d12(3).name='学工部';
    d12(1).subDept=[];
    
    d1(1).name='管理机构';      d1(1).subDept=d12;
    d1(2).name='院系';            d1(2).subDept=d22;
    d1(3).name='研究机构';     d1(3).subDept=d32;
     
    datas.name='吉林大学';    datas.subDept=d1;

    f=datas;

end
