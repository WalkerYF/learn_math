# matlab的基本操作及画图，拟合

[toc]

## 左除和右除的区别
Matlab提供了两种除法运算：左除（\）和右除（/）。
一般情况下，x=a\b是方程a*x =b的解，而x=b/a是方程x*a=b的解。
例：a=[1  2  3; 4  2  6; 7  4  9]
b=[4; 1; 2];
x=a\b
则显示：x=
          -1.5000
           2.0000
           0.5000
如果a为非奇异矩阵，则a\b和b/a可通过a的逆矩阵与b阵得到：
       a\b = inv(a)*b
       b/a = b*inv(a)
     

## 点运算与其他运算的区别
运算分为两种：
矩阵运算符
阵列运算符
阵列运算符：有一个.以示区分

## 其他
	感叹号：调用各种系统命令
	续行符：...
	中括号：
	大括号：单元数组 {}



## 定义函数
输入输出上有几个特定的函数可以帮助控制输入参数个数，控制输出参数类型
可以实现类似函数重载的效果

函数传入参数默认是传值传递。


## 读取文件
注：textread不用先fopen那个文件，适用于格式统一的txt文件的一次性大批量读取。textread读取某个文件后，下次再用textread读取这个文件时，还是会从文件头开始读取。
例如：

---------------------
例1：无分隔符
mytest.txt
 1     2     3     4
 5     6     7     8
 9    10    11    12

```
读取：
[data1,data2,data3,data4]=textread('mytest.txt','%n%n%n%n',3);
data=[data1 data2 data3 data4]
data =
     1     2     3     4
     5     6     7     8
     9    10    11    12
```

---------------------
例2：有分隔符（逗号，分号...）
myfile.txt 中的内容如下：
    1, 2, 3, 4
    5, 6, 7, 8
    9, 10, 11, 12
读取：

```matlab
>> [data1,data2,data3,data4]=textread('myfile.txt','%n%n%n%n','delimiter', ',')
>> data=[data1 data2 data3 data4]
data =
     1     2     3     4
     5     6     7     8
     9    10    11    12
```
这里delimiter是指 指出分隔符，读数据的时候会自动跳过分隔符。

---------------------
例3：有分隔符及首行注释
myfiles.txt 中的内容如下：
    % this a comment
    1, 2, 3, 4
    5, 6, 7, 8
    9, 10, 11, 12
```
>> [data1,data2,data3,data4]=textread('myfiles.txt','%n%n%n%n','delimiter', ',','headerlines', 1);
>>  data=[data1 data2 data3 data4]
data =
     1     2     3     4
     5     6     7     8
     9    10    11    12
```
textread中的headerlines指明了跳过几行，1可自由设定
这里headerlines告诉textread跳过一开始的1行，1可以替换为任意你要跳过的行数。
__________________________________
例4：针对txt文件不同格式数据的读取
myfile.txt 中的内容如下：
Sally Level1 12.34 45 Yes
读入：
```
[names, types, x, y, answer] = textread('myfileli4.txt' , '%s %s %f %d %s', 1);
```
例4.1: 如果要忽略12.34这个浮点数。

```matlab
 [names, types, y, answer] = textread（'myfileli4.txt' , '%s %s %*f %d %s', 1）
    %*f 告诉textread跳过一个浮点数。
names =
    'Sally'

types =
    'Level1'

y =
    45

answer =
    'Yes'
```

对于iris.txt如果只想读取数据可用[data1,data2,data3,data4]=textread('Iris.txt','%f %f %f %f %*s',150,'delimiter',',');
____________________________________________________________________________________________
 例：4.2  如果要忽略Level，指读取后面的数字，

```
>> [names, levelnum, x, y, answer] = textread('myfileli4.txt','%s Level%d %f %d %s', 1)
names =
    'Sally'

levelnum =
     1

x =
   12.3400

y =
    45

answer =
    'Yes'
```

________________________________________________________________________________________________
例5： txt中存在空位
myfileli5.txt 中的内容如下
    1,2,3,4,,6
    7,8,9,,11,12
    想用nan替代为空的部分
如下：

```
>>[data1 data2 data3 data4 data5 data6] = textread('myfileli5.txt','%f%f%f%f%f%f', 'delimiter', ',', 'emptyvalue', NaN)
>> data=[data1 data2 data3 data4 data5 data6];
>> data
data =
     1     2     3     4   NaN     6
     7     8     9   NaN    11    12
```

....................................................................................................................
例6： 跳列
myfileli6.txt 中的内容如下
    Sally Type1 12.34 45 Yes
    Joe Type2 23.54 60 No
    Bill Type1 34.90 12 No
如果只想读第一列，其余的跳过
读入：

```
>> clear
>> [names]=textread('myfileli6.txt','%s%*[^\n]');
>> names
names =
    'Sally'
    'Joe'
    'Bill'
```

%[^\n] 就是一直读到行尾。
如：

```
>> [names rest]=textread('myfileli6.txt','%s%[^\n]')
names =
    'Sally'
    'Joe'
    'Bill'

rest =
    'Type1 12.34 45 Yes'
    'Type2 23.54 60 No'
    'Type1 34.90 12 No'
```
_____________________________.
例7：读入规律格式的数据
myfileli7.txt 中的内容如下

  Location;date;discharge

  Lobith;1989-01-01;00:00;2801

  Lobith;1989-01-02;00:00;2619
如下：

```
>> clear
>> [location year month day hour minute discharge]=textread('myfileli7.txt','%s%f-%f-%f%f:%f%f','headerlines',1,'delimiter',';')
location =
    'Lobith'
    'Lobith'

year =
        1989
        1989

month =
     1
     1

day =
     1
     2

hour =
     0
     0

minute =
     0
     0

discharge =
        2801
        2619
```

## 写入文件
1. 将matlab数据写入文件
```
save file obj1 obj2
```
存为*.mat格式
2. 格式化输出
```
fid = fopen( 'tp.txt' ,'wt');
fprintf(fid,' This is the database of class 1 . \n');
name = 'sally'; types = l; x = 3.1; y = 45; answer ='Yes';
fprintf(fid ,' %s Type%u %f %u %s \n' ,name, types, x, y, answer);
fclose(fid) ;
```
##matlab的符号运算
sym函数

## matlab与线性代数
#### 向量处理
1. 冒号
1. linspace函数
2. logspace函数

#### 矩阵处理相关
1. 矩阵的转置

```
z=[1+j,2+pi*i,-sqrt(-1)]’
z =
1.0000 - 1.0000i
2.0000 - 3.1416i
0 + 1.0000i
当对复数向量进行转置操作时,可以得到其共轭转置向量。
z.' (非共轭转置向量)
```

2. 解线性方程组：\
> 如对超定方程用最小二乘法，对欠定方程它将给
> 出范数最小的一个解，解三对角阵方程组时用追赶法等。


3. rref函数：将矩阵化简为阶梯型的行最简形式
4. det函数：求行列式
5. eig函数：求特征值，特征向量
6. eye函数
7. ones函数
8. zeros函数
9. diag函数
使用方法

## matlab绘图
subplot函数：http://blog.csdn.net/gsls200808/article/details/45870911
hold 函数
axis('square')
axis（[xmin xmax ymin ymax zmin zmax]
axis('normal')
title('My Title')
xlabel('My X-axis Label')
ylabel('My Y-axisLabel')
text(8,2,'Text for annotation')
gtext('Text for annotation')
grid % 给图加上方格
http://blog.csdn.net/wangcj625/article/details/6287735/
#### 二维
plot
ezplot
fplot 使用函数，画自定义函数的图像
polar  极坐标
hist 频数直方图
line 连线（可放向量）
实例：
```
ezplot('sin(x**2+x+4)')
ezplot('sin(x**2+x+4)',[1,6])
ezplot (@(X, Y) X.^2 - Y.^2 - 1)
```
```
x=0:0.1:2*pi;
r=cos(2*x);
polar(x,r);
```
```
x=rand(1,20);
hist(x);
```

```
line([1,2],[3,2])
line([1,2;5,6],[3,2;7,8])
```

#### 三维
1. plot3(x,y,z)通过描点连线画出曲线，这里x,y,z 都是n 维向量，分别表示该曲线
上点集的横坐标、纵坐标、竖坐标。
2. mesh(x,y,z)画网格曲面
```matlab
x=-3:0.1:3;y=-5:0.1:5;
x1=ones(size(y'))*x;y1=y'*ones(size(x));% 重要！生成网格
z1=(sin(x1.*y1)+eps)./(x1.*y1+eps);
mesh(x1,y1,z1)

[x2,y2]=meshgrid(x,y);% 与上面作用相同：生成网格
z2=(sin(x2.*y2)+eps)./(x2.*y2+eps);
mesh(x2,y2,z2)
```
3. contour，contourf
contourf(…)命令的参数与contour 命令完全相同，只是其绘出的等高线图将被自动
填上颜色。
c=contour(x,y,z,n) % n 是一个标量
c=contour(x,y,z,v) % v 是一个向量
上面2 个命令用来计算所画等高线的x，y 坐标值。
clabel(c) % 给等高线标注高度
clabel(c,v) % 给特定高度的等高线标注高度

4. surf  三维着色表面
5. 
## 多项式拟合

```matlab
x0=[1990 1991 1992 1993 1994 1995 1996];
y0=[70 122 144 152 174 196 202];
a=polyfit(x0,y0,3); %该处数字指的是使用几阶的多项式来拟合 
poly2sym(a) % 可视化多项式
x=x0;
y=polyval(a,x); % 多项式求值
plot(x0,y0,'r*',x,y)

y97=polyval(a,1997)
y98=polyval(a,1998)
```

## 指定函数拟合（octave中貌似没有）
```
x = [0;0.4;1.2;2;2.8;3.6;4.4;5.2;6;7.2;8;9.2;10.4;11.6;12.4; 13.6;14.4;15];
y = [ 1 ; 0.85; 0.29; -0.27; -0.53; -0.4; -0.12; 0.17; 0.28; 0.15; -0.03; -0.15; -0.071 ; 0.059;0.08;0.032; -0.015; -0.02];
plot(x,y, 'r*');

f=fittype('a*cos(k*t)*exp(w*t)','independent','t','coefficients',{'a','k','w'});
cfun=fit(x,y,f)
xi=0:0.1:20;
yi=cfun(xi);
plot(x,y,'r*',xi,yi,'b-')
```

## 非线性拟合
问题：有些时候我们需要拟合一些非线性的表达式。
已知：一个表达式的式子是y=A*sin(x).*exp(x)-B./log(x),
还知道：x与y对应的一大把数据。
目的：我们如何根据x,y的值找出最佳的A、B值。


格式:lsqcurvefit(f,a,x,y)、nlinfit(x,y,f,a)
```
f:符号函数句柄,如果是以m文件的形式调用的时候,别忘记加@.
这里需要注意,f函数的返回值是和y匹对的,即拟合参数的标准是**(f-y)^2取最小值**,具体看下面的例子
a:最开始预估的值(预拟合的未知参数的估计值)。如上面的问题如果我们预估A为1,B为2,则a=[1 2]
x:我们已经获知的x的值
y:我们已经获知的x对应的y的值
```
例子1:
问题:对于函数$y=a*sin(x)*exp(x)-b/log(x)$我们现在已经有多组(x,y)的数据,我们要求最佳的a,b值
%针对上面的问题,我们可以来演示下如何使用这个函数以及看下其效果
```
>> x=2:10;
>> y=8*sin(x).*exp(x)-12./log(x);
%上面假如是我们事先获得的值
>> a=[1 2];
>> f=@(a,x)a(1)*sin(x).*exp(x)-a(2)./log(x);
%第一种方法使用lsqcurvefit
>> lsqcurvefit(f,a,x,y)
ans =
   7.999999999999987  11.999999999988997%和我们预期的值8和12结合得非常好
>>
%第二种方法使用nlinfit
>> nlinfit(x,y,f,a)
ans =
   8.000000000000000  11.999999999999998
>>
%**********************************
%另一种方法,假如我们写了一个如下的m文件
function f=test(a,x)
f=a(1)*sin(x).*exp(x)-a(2)./log(x);
end
%则在上面lsqcurvefit函数调用如下,不要忘记那个@
lsqcurvefit(@test,a,x,y)
```

例子2:(多元的情况,注意看格式)
问题:我们已知z=a*(exp(y)+1)-sin(x)*b且有多组(x,y,z)的值,现在求最佳系数a,b
```
>> x=2:10;
>> y=10*sin(x)./log(x);
>> z=4.5*(exp(y)+1)-sin(x)*13.8;
>> f=@(a,x)a(1)*(exp(x(2,:))+1)-sin(x(1,:))*a(2);
%第一种方法使用lsqcurvefit
>> lsqcurvefit(f,[1 2],[x;y],z)%注意这里面的[x;y],这里的[1 2]表示我们设置f函数里的初始值a(1)=1,,a(2)=2
ans =
   4.499999999999999  13.800000000000024
%第二种方法使用nlinfit
>> nlinfit([x;y],z,f,[1 2])
ans =
   4.500000000000000  13.799999999999956
>>
```

## 线性规划
概念:      
决策变量  目标函数  约束条件 
注意matlab中线性规划的标准模型
$$ min\ c^Tx  \ \ \ \   Ax\leq b $$
如果是其他的情况，需要适当的转换
如：
以下模型可这样转换
$ max\ c^Tx\ \ \ \ \ Ax\geq b\quad \rightarrow\quad min\ (-c)^Tx\quad (-A)x\leq (-b)$
```
[x,fval] = linprog (F, A, B)
[x,fval] = linprog (F, A, B, AEQ, BEQ)
[x,fval] = linprog (F, A, B, AEQ, BEQ, LB, UB)
```
#### 敏感性分析！！！
> 非线性规划函数：fmincon
> 二次规划函数：quadprog

## 非线性规划
在一组等式或不等式的约束下，求一个函数的最大值
![Alt text](./1502354235050.png)

```matlab
X=fmincon(FUN,X0,A,B,Aeq, Beq, LB, UB, NONLCON, OPTIONS);
%FUN 目标函数
%NONLCON 非线性约束条件函数
%（该函数分两部分，一部分为≤0，另一部分为＝0）
```
![Alt text](./1503216887583.png)
例2： min f(x) = exp(x1) * (4*x1^2 + 2*x2^2 + 4*x1*x2 + 2*x2 + 1)
x1 + x2 = 0
1.5 + x1 * x2 - x1 - x2  <= 0
-x1*x2 - 10 <= 0
```matlab
function youh3
clc;
x0 = [-1, 1];
A = [];b = [];
Aeq = []; beq = [];
vlb = []; vub = [];
[x, fval] = fmincon(@fun4, x0, A, b, Aeq, beq, vlb, vub, @mycon)
 
function f = fun4(x);
f = exp(x(1)) * (4*x(1)^2 + 2*x(2)^2 + 4*x(1)*x(2) + 2*x(2) + 1);
 
function [g, ceq] = mycon(x) % !!!!
g = [1.5 + x(1)*x(2) - x(1) - x(2); -x(1)*x(2) - 10];
ceq = [x(1) + x(2)];
```


## 二次规划
定义:
目标函数为自变量x的二次系数
约束条件全为线性
$min\quad \frac{1}{2}x^THx + f^Tx,\quad s.t. \quad Ax \leq b$
```
[X, FVAL] = quadprog(H,f,A,b,Awq,bwq,LB,UB,XO,OPTIONS)
```




## 灰色预测
```
clear
syms a b;
c=[a b]';
A=[89677,99215,109655,120333,135823,159878,182321,209407,246619,300670]; % 需要修改
B=cumsum(A);  % 原始数据累加
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2;  % 生成累加矩阵
end
% 计算待定参数的值
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
c=inv(E*E')*E*D;
c=c';
a=c(1);b=c(2);
% 预测后续数据
F=[];F(1)=A(1);
for i=2:(n+10)
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a ;
end
G=[];G(1)=A(1);
for i=2:(n+10)
    G(i)=F(i)-F(i-1); %得到预测出来的数据
end 
t1=1999:2008;% 需要修改，样本自变量范围
t2=1999:2018;% 需要修改，预测范围
G
plot(t1,A,'o',t2,G)  %原始数据与预测数据的比较
xlabel('年份')
ylabel('利润')

```