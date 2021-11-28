%*******注意:本学生成绩管理小程序只适合 班级，小规模团体成员的成绩排名分析
%*******原因:考虑到内存分配及运行效率问题，本程序分配200人的存储空间，6门科目
clear;
disp('需要对excel中总成绩表进行总分计算并排名请输入"0"');
disp('需要对excel中某一课目成绩进行排名并输出成绩单请输入"1"');
disp('需要对excel中某一课目成绩进行图像分析请输入"2"');
disp('需要对excel中某一课目成绩进行排名并且输出图像分析请输入"3"');
disp('退出程序请输入"4"')
    
while true
    y=input('请输入你的操作代码:');
    if y==4
        break
    end
    switch y
        case 0
            total();
            disp('已对总成绩表进行总分计算并排名');
        case 1
            disp('只需输入该科目在excel表中sheet表的位数eg:总成绩输入"1"');
            z=input('请输入你要进行按名次排名并输出成绩单的科目:');
            ranking(z);disp('已对该成绩进行排名并输出');
        case 2
            disp('只需输入该科目在excel表中sheet表的位数eg:总成绩输入"1"');
            z=input('请输入你要进行图像分析的科目:');
            keshihua(z);
        case 3
            disp('只需输入该科目在excel表中sheet表的位数eg:总成绩输入"1"');
            z=input('请输入你要进行排名并且输出图像分析的科目:');
            ranking(z);
            keshihua(z);disp('已对该成绩进行排名并输出图像');
        otherwise
            disp('请输入规定的数字');
            y=4;break
    end
end
         