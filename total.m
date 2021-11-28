function total()
%本函数对总成绩进行计算并按总成绩排名
[num,txt]=xlsread('学生信息',1);%读取xls数据
A=txt(:,1);A(1,:)=[];%处理姓名列

n=numel(A);%学生人数

g=cell(2,100);%创建2x100的元胞数组，即分配200人数空间
S=struct('Name',g,'Marks1',g,'Marks2',g,'Marks3',g,'Marks4',g,'Marks5',g,'Marks6',g,'Marks',g);%定义结构体
%当valuesx为元胞数组的时候，生成的结构数组的维数与元胞数组的维数相同。
%而在数据中不包含元胞的时候，得到的结构数组的维数是1×1的。

%信息赋值给结构体
for i=1:n
    S(i).Name=A(i);
    S(i).Marks1=num(i,1);
    S(i).Marks2=num(i,2);
    S(i).Marks3=num(i,3);
    S(i).Marks4=num(i,4);
    S(i).Marks5=num(i,5);
    S(i).Marks6=num(i,6);
    S(i).Marks=S(i).Marks1+S(i).Marks2+S(i).Marks3+S(i).Marks4+S(i).Marks5+S(i).Marks6;%总分
end
%依据总成绩排序  冒泡法实现
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
    num(i,1)=S(i).Marks1;
    num(i,2)=S(i).Marks2;
    num(i,3)=S(i).Marks3;
    num(i,4)=S(i).Marks4;
    num(i,5)=S(i).Marks5;
    num(i,6)=S(i).Marks6;
    num(i,7)=S(i).Marks;
end
xlswrite('学生信息',A,1,'A2');
xlswrite('学生信息',num,1,'B2');
xlswrite('学生信息',(1:n)',1,'I2');
end