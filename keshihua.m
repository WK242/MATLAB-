function  keshihua(y)
%UNTITLED 绘制饼图，直方图
%  
[num,txt]=xlsread('学生信息',1);%读取xls数据

A=txt(:,1);A(1,:)=[];%处理姓名列

n=numel(A);%学生人数

score=num(:,y);
%根据分数判断等级并统计各等级人数
a=0;b=0;c=0;d=0;e=0;f=0;
for i=1:n
    switch floor(score(i)/10)%向下取整函数
        case 10
            a=a+1;
        case -1
            b=b+1;
        case 9
            c=c+1;
        case 8
            d=d+1;
        case {6,7}
            e=e+1;
        otherwise
            f=f+1;
    end
end

x=[a,b,c,d,e,f];


subplot(1,2,1)
pie3(x)%饼图
legend(' 满分',' 缺考',' 优秀',' 良好',' 合格 ','不合格');
title('成绩饼图');
subplot(1,2,2)
value=x;
bar(value);
set(gca, 'XTickLabel', {' 满分',' 缺考',' 优秀',' 良好',' 合格 ','不合格'});
ylabel('分数');
xlabel('备注');
title('成绩柱状图');
for ii=1:length(value)
    str=sprintf('%d',value(ii));
    text(ii-0.4,value(ii)+0.2,str);
end

end

