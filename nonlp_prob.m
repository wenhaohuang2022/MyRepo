%基于问题的求解法

prob = optimproblem('ObjectiveSense','max'); %定义优化类型

%定义决策变量、取值范围
x = optimvar('x',4,1,'LowerBound',-1,'UpperBound',1);


%目标函数
c = [6;8;4;2];
Q = [-1,2,0,0;2,-1,2,0;0,2,-1,2;0,0,2,-1];
prob.Objective = c'*x + 0.5*x'*Q*x;

%不等式约束、等式约束
prob.Constraints.con1 = x(1)*x(2) + x(3)*x(4) <= 1;
prob.Constraints.con2 = x(1)*x(2) + x(3)*x(4) >= -1;
prob.Constraints.con3 = x(1) + x(2) + x(3) + x(4) <= 2;
prob.Constraints.con4 = x(1) + x(2) + x(3) + x(4) >= 2;


%非线性规划需要赋初始值
x0.x = rand(4,1);

%求解
[sol,fval,flag,output] = solve(prob,x0);sol.x;
