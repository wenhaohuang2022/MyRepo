

optim_vals = zeros(2,10);


% 定义约束矩阵和右侧向量（包括等式约束条件）

for i=1:100
    d = 8.5+0.01*i;
    % 定义目标函数系数向量
    c = [3; 5;9]; % 目标函数系数，例如 [3x1 + 5x2 +9x3] （minimize）

    A = [2, 1,4; 1,5, 3;4,20,7]; % 不等式约束矩阵
    b = [8; d ;10]; % 不等式右侧约束向量

    Aeq = [1, -1,0]; % 等式约束矩阵
    beq = 1; % 等式右侧约束向量
    
    % 定义决策变量的取值范围
    lb = zeros(3, 1); % 决策变量下界
    ub = []; % 决策变量上界，为空表示无上界
    
    % 使用线性规划求解器求解问题
    [x, fval, exitflag, output] = linprog(c, A, b, Aeq, beq, lb, ub);

    optim_vals(1,i) = d;
    optim_vals(2,i) = fval;
end


% 提取第一行和第二行的值
x_values = optim_vals(1, :);
y_values = optim_vals(2, :);

% 绘制散点图
scatter(x_values, y_values, 'o', 'filled');
title('散点图');
xlabel('第一行的值');
ylabel('第二行的值');
grid on;

