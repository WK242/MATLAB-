function ranking(m)
%本函数对不同科目成绩进行排名
[num,txt]=xlsread('学生信息',1);%读取xls数据

A=txt(:,1);A(1,:)=[];%处理姓名列

n=numel(A);%学生人数

g=cell(2,100);%创建2x100的元胞数组，即分配200人数空间
S=struct('Name',g,'Marks',g,'PostScript',g);%定义结构体
%当valuesx为元胞数组的时候，生成的结构数组的维数与元胞数组的维数相同。
%而在数据中不包含元胞的时候，得到的结构数组的维数是1×1的。

%信息赋值给结构体
for i=1:n
    S(i).Name=A(i);
    S(i).Marks=num(i,m);
end

%依据成绩排序  冒泡法实现
for i=1:n
    for j=1:n-i
        if S(j).Marks<S(j+1).Marks
            h=S(j);
            S(j)=S(j+1);
            S(j+1)=h;
        end
    end
end

%数据写入xls
for i=1:n
    A(i)=S(i).Name;
    num(i,m)=S(i).Marks;
end

xlswrite('学生信息',A,m+1,'A2');
xlswrite('学生信息',num(:,m),m+1,'B2');
xlswrite('学生信息',(1:n)',m+1,'C2');
end
