clc,clear

%基于求解器的求解法
%目标函数func1
func1 = @(x) x(1)^2+x(2)^2+x(3)^2+8;

%初始值
x0=rand(3,1);

%线性约束
A = [];
b = [];
Aeq = [];
beq = [];

%上下界
lb=zeros(3,1);
ub=[];

[x,fval]=fmincon(func1,x0,A,b,Aeq,beq,lb,ub,@func2);

function[c,ceq] = func2(x)
   %非线性不等式约束
   c = [-x(1)^2+x(2)-x(3)^2;
        x(1)+x(2)^2+x(3)^3-20];
   %非线性等式约束
   ceq = [-x(1)-x(2)^2+2;
         x(2)+2*x(3)^2-3];
end
