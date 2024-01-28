prob = optimproblem('ObjectiveSense','max'); %指定求最大值而非默认的最小值

%定义决策变量、取值范围
x = optimvar('x',5,1,'LowerBound',0,'UpperBound',+Inf);

%目标函数系数
c=[0.05,0.27,0.19,0.185,0.185];
prob.Objective = c*x;

%等式约束
Aeq=[1,1.01,1.02,1.045,1.065];
M=10000;
beq=M;
prob.Constraints.con1 = Aeq*x ==beq;

%初始化
a = 0;
aa=[];
QQ=[];
XX=[];
hold on

while a<0.05
    %不等式约束
    A=[0,0.025,0,0,0;
    0,0,0.015,0,0;
    0,0,0,0.055,0;
    0,0,0,0,0.026];
    b=a*M*[1;1;1;1];

    prob.Constraints.con2 = A*x <=b;
    
    %求解
    [sol,Q,flag,output]=solve(prob);
    
    %迭代轮数
    aa=[aa;a];
    %最优目标函数
    QQ=[QQ;Q];
    %最优决策变量
    XX=[XX;sol.x'];

    a=a+0.001;
end

plot(aa,QQ,'r-o')
